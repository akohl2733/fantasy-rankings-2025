from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, declarative_base
import os
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
import pandas as pd 

app = FastAPI()

origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///:memory:")

engine = create_engine(DATABASE_URL, echo=True)
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()
# BASE_DIR = os.path.dirname(os.path.abspath(__file__))
# csv_file = os.path.join(BASE_DIR, "..", "data", "fantasy-rankings-07-25-25.csv")
# df = pd.read_csv(csv_file)


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

    def repr(self):
        return f"<Player(name={self.name}, team={self.team}, pos={self.position})>"

class PlayerSchema(BaseModel):
    id: int
    name: str
    team: str
    position: str
    position_rank: int
    receptions: float
    receiving_yards: float
    receiving_tds: float
    rushing_yards: float
    rushing_tds: float
    passing_yards: float
    passing_tds: float
    turnovers: int
    proj_points: float
    tier: int

# player_list: list[Player] = []

# for index, row in df.iterrows():
#     player_list.append(
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

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def root():
    return {"Success": "Connection made"}

@app.get("/players/", response_model=List[PlayerSchema])
def all_players(db: SessionLocal = Depends(get_db)):
    players = db.query(Player).all()
    return players

@app.get("/players/{rank}")
def individual_player(rank: str, db: SessionLocal = Depends(get_db)):
    player = db.query(Player).filter(Player.id == rank).first()
    if player:
            return player
    raise HTTPException(status_code=404, detail=f"Player with ID {id} not found")

@app.get("/health")
def health():
    return {"ok": True}