import pandas as pd
from all_players.dbPlayers import insert_record
from sqlalchemy import create_engine


df = pd.read_csv("C:\Projects\\ff2025\\files\Draft-rankings-export-2025.csv", skiprows=1, nrows=200)
df = df[["Full Name", "Team Abbreviation", "Position", "Bye Week"]]

df = df.rename(columns={
    "Full Name": "name",
    "Team Abbreviation": "team",
    "Position": "position",
    "Bye Week": "bye"
})

df["years_played"] = 0

engine = create_engine("mysql+pymysql://root:root@localhost:3306/ff_25_v1")

# Dump to MySQL in bulk
df.to_sql(name="player", con=engine, if_exists="append", index=False)
