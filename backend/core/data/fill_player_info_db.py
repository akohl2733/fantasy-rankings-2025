"""
Take in data from 'fantasy-rankings-07-25-25.csv' into database.
"""

import os

from sqlalchemy import text
from sqlalchemy.orm import Session
import pandas as pd

from core.models import PlayerInfo
from core.main import Base, engine

with engine.connect() as conn:
    conn.execute(text("DROP TABLE IF EXISTS player_info CASCADE;"))
    conn.commit()

Base.metadata.create_all(bind=engine)

with engine.connect() as conn:
    conn.execute(text("TRUNCATE TABLE player_info RESTART IDENTITY CASCADE;"))
    conn.commit()

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, "all_players.csv")

df = pd.read_csv(csv_file)

with Session(engine) as session:
    for idx, row in df.iterrows():
        session.add(
            PlayerInfo(
                name = row["name"],
                position = row["position"],
                team = row["team"]
                )
            )
        session.commit()
    session.close()
