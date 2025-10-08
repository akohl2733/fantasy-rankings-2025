from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, declarative_base, Session
import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import pandas as pd
from main import Player, engine, Base

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, "fantasy-rankings-07-25-25.csv")

df = pd.read_csv(csv_file)

# create table
Base.metadata.create_all(bind=engine)

# insert one row
with Session(engine) as session:
    for index, row in df.iterrows():
        session.add(
            Player(
                id = row["Overall Rank"],
                name = row["Name"],
                position = row["Position"],
                position_rank = row["Position Rank"],
                team = row["Team"],
                receptions = row["Receptions"],
                receiving_yards = row["Receiving Yards"],
                receiving_tds = row["Receiving TDs"],
                rushing_yards = row["Rushing Yards"],
                rushing_tds = row["Rushing Touchdowns"],
                passing_yards = row["Passing Yards"],
                passing_tds = row["Passing Touchdowns"],
                turnovers = row["Turnovers"],
                proj_points = row["Total Fantasy Points"],
                tier = row["Tier"]
            )
        )
    session.commit()

session.close()