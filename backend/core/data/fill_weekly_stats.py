"""
Fill Weekly Stat DataBase with player data.
"""

import os

from sqlalchemy.orm import Session
import pandas as pd

from core.main import Base, engine
from core.logging_config import logger
from core.models import WeeklyStats_QB_Flex


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
csv_file = os.path.join(BASE_DIR, 'week_1_2025.csv')


# Create and/or connect to table
try:
    Base.metadata.create_all(bind=engine)
    logger.info("Weekly table created or already exists")
except Exception as e:
    logger.critical("Error creating table: %s", e, exc_info=True)
    raise


# load in CSV file
try:
    df = pd.read_csv(csv_file)
    logger.info("Loaded CSV with %s rows from %s", len(df), csv_file)
except Exception as e:
    logger.error("Failed to read CSV: %s", e, exc_info=True)
    raise


# connect to DB and add player for each row in DataFrame
try:
    with Session(engine) as session:
        for idx, row in df.iterrows():
            try:
                session.add(
                    WeeklyStats_QB_Flex(
                        player_id = row["player_id"],
                        week = row["week"],
                        year = row["year"],
                        pass_yards = row["pass_yards"],
                        pass_tds = row["pass_tds"],
                        rush_attempts = row["rush_attempts"],
                        rush_yards = row["rush_yards"],
                        rush_tds = row["rush_tds"],
                        targets = row["targets"],
                        receptions = row["receptions"],
                        receiving_yards = row["receiving_yards"],
                        receiving_tds = row["receiving_tds"],
                        fumbles = row["fumbles"],
                        interceptions = row["interceptions"],
                        fantasy_points = row["fantasy_points"],
                        game_played = row["game_played"],
                        rostered_percent = row["rostered_percent"],
                        )
                    )
            except Exception as row_error:
                logger.warning("Failed to process row %s: %s", idx, row_error)

        session.commit()
        logger.info("All valid rows committed successfully.")
except Exception as e:
    logger.error("Transaction failed. Rolling back. Error %s", e, exc_info=True)
    try:
        session.rollback()
        logger.debug("Session rollback successful.")
    except Exception as rollback_error:
        logger.critical("Rollback failed. %s", rollback_error, exc_info=True)
