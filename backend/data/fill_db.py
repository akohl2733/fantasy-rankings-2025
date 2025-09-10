from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, declarative_base
import os
import pandas as pd

DATABASE_URL = 'postgresql+psycopg2://fantasy_user:secret@localhost:5432/fantasy'
csv_file = os.path.join("fantasy-rankings-07-25-25.csv")
df = pd.read_csv(csv_file)

# SQLAlchemy setup
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)
Base = declarative_base()

# simple model
class Player(Base):
    __tablename__ = 'players'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    team = Column(String, nullable=False)
    position = Column(String, nullable=False)
    position_rank = Column(Integer, nullable=False)
    receptions = Column(Float)
    receiving_yards = Column(Float)
    receiving_tds = Column(Float)
    rushing_yards = Column(Float)
    rushing_tds = Column(Float)
    passing_yards = Column(Float)
    passing_tds = Column(Float)
    turnovers = Column(Integer)
    proj_points = Column(Float)
    tier = Column(Integer)

# create table
Base.metadata.create_all(bind=engine)

# open session
session = SessionLocal()

# insert one row
# for index, row in df.iterrows():
#     session.add(
#         Player(
#             id = row["Overall Rank"],
#             name = row["Name"],
#             position = row["Position"],
#             position_rank = row["Position Rank"],
#             team = row["Team"],
#             receptions = row["Receptions"],
#             receiving_yards = row["Receiving Yards"],
#             receiving_tds = row["Receiving TDs"],
#             rushing_yards = row["Rushing Yards"],
#             rushing_tds = row["Rushing Touchdowns"],
#             passing_yards = row["Passing Yards"],
#             passing_tds = row["Passing Touchdowns"],
#             turnovers = row["Turnovers"],
#             proj_points = row["Total Fantasy Points"],
#             tier = row["Tier"]
#         )
#     )
# session.commit()

session.close()