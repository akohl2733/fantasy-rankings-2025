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

csv_file = "./rb_totals_v1.csv"
df = pd.read_csv(csv_file)

class Player(BaseModel):
    name: str
    total_touches: float
    rush_points: float
    rec_points: float
    total: float
    position_rank: int

player_list: list[Player] = []

for index, row in df.iterrows():
    player_list.append(
        Player(
            name = row["name"],
            total_touches = row["total_touches"],
            rush_points = round(row["rush_points"], 2),
            rec_points = round(row["rec_points"], 2),
            total = round(row["total"], 2),
            position_rank = row["position_rank"]
        )
    )

@app.get("/")
def root():
    return {"Success": "Connection made"}

@app.get("/players/")
def all_players():
    return player_list
    