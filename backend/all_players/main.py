from fastapi import FastAPI 
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import typing
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

csv_file = "./fantasy-rankings-07-25-25.csv"
df = pd.read_csv(csv_file)

class Player(BaseModel):
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

player_list: list[Player] = []

for index, row in df.iterrows():
    player_list.append(
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

@app.get("/")
def root():
    return {"Success": "Connection made"}

@app.get("/players/")
def all_players():
    return player_list

@app.get("/players/{rank}")
def individual_player(rank: str):
    for player in player_list:
        if str(player.id) == str(rank):
            return player
    raise HTTPException(status_code=404, detail=f"Player with ID {id} not found")

@app.get("/health")
def health():
    return {"ok": True}