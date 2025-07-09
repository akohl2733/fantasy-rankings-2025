import pandas as pd
from pandas import DataFrame
from pathlib import Path
import logging
from dbPlayers import insert_record
from sqlalchemy import create_engine

# introduce logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()]
    )

# cleaning function
def load_and_clean_rankings(csv_path: str, nrows: int = 200) -> DataFrame:
    try:
        df = pd.read_csv(csv_path, skiprows=1, nrows=nrows)
        df = df[["Full Name", "Team Abbreviation", "Position", "Bye Week"]]

        df = df.rename(columns={
            "Full Name": "name",
            "Team Abbreviation": "team",
            "Position": "position",
            "Bye Week": "bye"
        })

        df["years_played"] = 0
        return df
    except Exception as e:
        logging.exception("ERROR:", e)


# run function
if __name__ == "__main__":
    base_dir = Path(__file__).resolve().parent
    csv_path = base_dir / "Draft-rankings-export-2025.csv"

    df = load_and_clean_rankings(csv_path)
    logging.info("Leaded and cleaned data successfully")

    output_path = base_dir  / "cleaned_rankings.json"
    df.to_json(output_path, orient="records", indent=2)
    logging.info(f"Exported cleaned data to {output_path}")
    
    # engine = create_engine("mysql+pymysql://root:root@localhost:3306/ff_25_v1")
    # df.to_sql(name="player", con=engine, if_exists="append", index=False) # Dump to MySQL in bulk