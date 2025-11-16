"""
Allows users to fill the DataBase with a CSV data on player projections.
"""

import os

from sqlalchemy.orm import Session
import pandas as pd

from core.main import Player, engine, Base
from core.logging_config import logger


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, "fantasy-rankings-07-25-25.csv")


logger.info("Starting preseason projection DB fill.")


# create table
try:
    Base.metadata.create_all(bind=engine)
    logger.info("Table successfully created.")
except Exception as e:
    logger.critical("Error creating table error=%s", e, exc_info=True)
    raise


try:
    df = pd.read_csv(csv_file)
    logger.info("Loaded CSV with %s rows from %s", len(df), csv_file)
except Exception as e:
    logger.error("Failed to load CSV: %s", e)
    raise


# insert all rows of CSV
try:
    with Session(engine) as session:
        logger.debug("Session started. Beginning insert loop...")

        for index, row in df.iterrows():
            try:
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
            except Exception as row_error:
                logger.warning("Failed to process row %s: %s", index, row_error)

        session.commit()
        logger.info("All valid rows committed successfully.")

except Exception as e:
    logger.error("Transaction failed. Rolling back. Error: %s", e, exc_info=True)
    try:
        session.rollback()
        logger.debug("Session rollback successful.")
    except Exception as rollback_error:
        logger.critical("Rollback failed: %s", rollback_error, exc_info=True)
