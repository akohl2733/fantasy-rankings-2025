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

csv_file = "./Draft-rankings-export-2025.csv"
df = pd.read_csv(csv_file)

class Player(BaseModel):
    id: int
    name: str
    team: str
    position: str
    position_rank: int
    proj_points: float

player_list: list[Player] = []

for index, row in df.iterrows():
    player_list.append(
        Player(
            id = row["Overall Rank"],
            name = row["Full Name"],
            team = row["Team Abbreviation"],
            position = row["Position"],
            position_rank = row["Position Rank"],
            proj_points = row["Projected Points"]
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
    