import sys, os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from sqlalchemy.orm import Session, sessionmaker
from main import Base, engine
import pandas as pd
from models import WeeklyStats_QB_Flex

Base.metadata.create_all(bind=engine)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, '')

df = pd.read_csv(csv_file)

with Session(engine) as session:
    for idx, row in df.iterrows():
        Session.add(
            WeeklyStats_QB_Flex(
                player_id = row["player_id"],
                week = row["week"],
                year = row["year"],
                pass_yards = row["pass_yards"],
                pass_tds = row["pass_tds"],
                rush_attempts = row["rush_attempts"],
                rush_yards = row["rush_yards"],
                rush_tds = row["rush_tds"],
                targets = row["targets"],
                receptions = row["receptions"],
                receiving_yards = row["receiving_yards"],
                receiving_tds = row["receiving_tds"],
                fumbles = row["fumbles"],
                interceptions = row["interceptions"],
                fantasy_points = row["fantasy_points"],
                game_played = row["game_played"],
                rostered_percent = row["rostered_percent"],
            )
        )
        session.commit()
    session.close()