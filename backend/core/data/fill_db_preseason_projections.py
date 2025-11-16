"""
Allows users to fill the DataBase with a CSV data on player projections.
"""

from main import Player, engine, Base
from logging_config import logger
import os
import sys
from sqlalchemy.orm import Session
import pandas as pd

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, "fantasy-rankings-07-25-25.csv")


logger.info("Starting preseason projection DB fill.")


# create table
try:
    Base.metadata.create_all(bind=engine)
    logger.info("Table successfully created.")
except Exception as e:
    logger.critical(f"Error creating table error={e}", exc_info=True)
    raise


try:
    df = pd.read_csv(csv_file)
    logger.info(f"Loaded CSV with {len(df)} rows from {csv_file}")
except Exception as e:
    logger.error(f"Failed to load CSV: {e}")
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
                logger.warning(f"Failed to process row {index}: {row_error}")

        session.commit()
        logger.info("All valid rows committed successfully.")

except Exception as e:
    logger.error(f"Transaction failed. Rolling back. Error: {e}", exc_info=True)
    try:
        session.rollback()
        logger.debug("Session rollback successful.")
    except Exception as rollback_error:
        logger.critical(f"Rollback failed: {rollback_error}", exc_info=True)
