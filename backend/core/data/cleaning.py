"""
Contains logic on cleaning CSV imported data for weekly CSVs.
Cleans names, accesses DB, and ensures data integrity.
"""

import sys
import os

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import re
import pandas as pd
from sqlalchemy.orm import Session

from models import PlayerInfo, WeeklyStats_QB_Flex
from main import engine
from logging_config import logger


# normalize players already in database
def get_player_lookup(db: Session):
    """Query database for all playesr and add to a dictionary for later use."""
    players = db.query(PlayerInfo).all()
    lookup = {}
    for p in players:
        key = normalize_names(p.name, p.team)
        lookup[key] = p.id
    return lookup


# normalize names to match what is in db
def normalize_names(name: str, team: str = ""):
    """Clean names from CSV to not contain surnames, spaces, or non-alpha characters."""
    name = name.lower()
    name = re.sub(r"[.\']", "", name)
    name = re.sub(r"\s+jr|sr|ii|iii", "", name)
    name = re.sub(r"\s+", " ", name).strip()
    return f"{name}-{team.lower()}"


# separate team from player name (shows up in csv as both combined)
def split_name(name_with_team: str):
    """Split name from full name to a first and last name."""
    match = re.match(r"^(.*?)\s*\((\w+)\)$", name_with_team.strip())
    if match:
        name = match.group(1).strip()
        team = match.group(2).strip()
        return name, team
    return name_with_team.strip(), None


# remove '%' symbol from csv for rostered percentage (only want value)
def clean_percent(val):
    """Take string form or percent, and change the value to a float value."""
    if pd.isna(val):
        return None
    if isinstance(val, str):
        val = val.strip().replace("%", "")
    try:
        return float(val)  # or float(val) / 100 if you want a fraction
    except ValueError:
        return None


# take in csv and match name to players in database

def load_weekly_stats(csv_path: str):
    """Take in CSV file, match names, and load the data into the Weekly database."""
    logger.info(f"Starting load_weekly_stats for file: {csv_path}")

    df = pd.read_csv(csv_path)
    df = df.fillna(0)

    df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]

    with Session(engine) as db:
        logger.debug("Database session started.")
        player_lookup = get_player_lookup(db)
        logger.debug(f"Loaded {len(player_lookup)} players into lookup.")

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
                logger.error(
                    f"DB insert failed for player_id={record.player_id}"
                    f"week={record.week}, year={record.year}, error={e}"
                )

        logger.info(f"Inserted {len(records)} weekly stats")
        if missing:
            logger.warning(f"Missing {len(missing)} players (names didn't match)")
            for name, team in missing[:10]:
                logger.debug(f"    - {name} ({team})")

        logger.info('Finished loading weekly stats.')


# run all functions
if __name__ == "__main__":
    path = os.path.join(os.path.dirname(__file__), "week_1_2025.csv")
    load_weekly_stats(path)
