from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, declarative_base, Session
import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import pandas as pd
from models import PlayerInfo
from main import Base, engine

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, "all_players.csv")

df = pd.read_csv(csv_file)

Base.metadata.create_all(bind=engine)

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
       