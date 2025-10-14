import sys, os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models import PlayerInfo, WeeklyStats_QB_Flex
from main import engine
from sqlalchemy.orm import Session
import re
import pandas as pd

def get_player_lookup(db: Session):
    players = db.query(PlayerInfo).all()
    lookup = {}
    for p in players:
        key = normalize_names(p.name, p.team)
        lookup[key] = p.id
    return lookup


def normalize_names(name: str, team: str = ""):
    name = name.lower()
    name = re.sub(r"[.\']", "", name)
    name = re.sub(r"\s+jr|sr|ii|iii", "", name)
    name = re.sub(r"\s+", " ", name).strip()
    return f"{name}-{team.lower()}"

def split_name(name_with_team: str):
    match = re.match(r"^(.*?)\s*\((\w+)\)$", name_with_team.strip())
    if match:
        name = match.group(1).strip()
        team = match.group(2).strip()
        return name, team
    else:
        return name_with_team.strip(), None

def clean_percent(val):
    if pd.isna(val):
        return None
    if isinstance(val, str):
        val = val.strip().replace("%", "")
    try:
        return float(val)  # or float(val) / 100 if you want a fraction
    except ValueError:
        return None


def load_weekly_stats(csv_path: str):
    df = pd.read_csv(csv_path)
    df = df.fillna(0)

    df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]

    with Session(engine) as db:

        player_lookup = get_player_lookup(db)

        missing = []
        records = []

        for _, row in df.iterrows():

            raw_name = row["name"]
            name, team = split_name(raw_name)

            if not team:
                missing.append((raw_name, "Unknown"))
                continue

            key = normalize_names(name, team)
            player_id = player_lookup.get(key)

            if not player_id:
                missing.append((row["name"], team))
                continue

            records.append(
                WeeklyStats_QB_Flex(
                    player_id = player_id,
                    week = row["week"],
                    year = row["year"],
                    pass_yards = row.get("pass_yards"),
                    pass_tds = row.get("pass_tds"),
                    rush_attempts = row.get("rush_attempts"),
                    rush_yards = row.get("rush_yards"),
                    rush_tds = row.get("rush_tds"),
                    targets = row.get("targets"),
                    receptions = row.get("receptions"),
                    receiving_yards = row.get("receiving_yards"),
                    receiving_tds = row.get("receiving_tds"),
                    fumbles = row.get("fumbles"),
                    interceptions = row.get("interceptions"),
                    fantasy_points = row.get("fantasy_points"),
                    game_played = row.get("game_played"),
                    rostered_percent = clean_percent(row.get("rostered_percent")),
                )
            )



        # db.bulk_save_objects(records)
        # db.commit()
        for record in records:
            try:
                db.add(record)
                db.commit()
            except Exception as e:
                db.rollback()
                print(f"⚠️ Error inserting {record.player_id}, week {record.week}: {e}")

        print(f"Inserted {len(records)} weekly stats")
        if missing:
            print(f"Missing {len(missing)} players (names didn't match)")
            for name, team in missing[:10]:
                print(f"    - {name} ({team})")

if __name__ == "__main__":
    csv_path = os.path.join(os.path.dirname(__file__), "week_1_2025.csv")
    load_weekly_stats(csv_path)