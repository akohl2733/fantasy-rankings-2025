"""
Contains FastAPI router and runs the application.
Defines endpoints for accessing API.
"""

from typing import List
import os

from fastapi import FastAPI, HTTPException, Depends
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from sqlalchemy.exc import SQLAlchemyError
from pydantic import BaseModel

from core.logging_config import logger


# start FastAPI app
app = FastAPI()


# mark frontend
origins = [
    "http://localhost:3000",
    "https://fantasy-gateway.livelydune-5915b05d.eastus2.azurecontainerapps.io",
    "https://fantasy-frontend-app.livelydune-5915b05d.eastus2.azurecontainerapps.io"
]


# allow for interaction between FastAPI and front end
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# automatically log every unhandled exception
@app.exception_handler(Exception)
async def global_exception_handler(exc: Exception):
    """Handles all unhandled Exceptions that exist, but are not specifically defined."""
    logger.error("Unhandled error: %s", exc, exc_info=True)
    return JSONResponse(status_code=500, content={"detail": "Internal Server Error"})


# log to confirm start up and shutdown
@app.on_event("startup")
def startup_event():
    """Log to window when FastAPI is started."""
    logger.info("FastAPI app starting up")

@app.on_event("shutdown")
def shutdown_event():
    """Log information to window when FastAPI app is shutting down."""
    logger.info("FastAPI app shutting down")


class Base(DeclarativeBase):
    pass


class Player(Base):
    """Defines what fields a player object should have."""
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
        """Allows string representation of class."""
        return f"<Player(name={self.name}, team={self.team}, pos={self.position})>"


# DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///:memory:")
DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+psycopg2://fantasy_user:secret@db:5432/players"
)

# Create engine and Session for SQLAlchemy -> PostgreSQL connection
try:
    engine = create_engine(DATABASE_URL, echo=True)
    SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
    Base.metadata.create_all(bind=engine)
    logger.info("Database connection established successfully")
except Exception as e:
    logger.error("Database Initializtion failed: %s", e, exc_info=True)
    raise


class PlayerSchema(BaseModel):
    """Defines schema for what a player object will look like when accessed from database"""
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


# create a thread to existing session to be used as parameter in endpoint logic
def get_db():
    """Allows for functions to connect to a database session to GET/POST information."""
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# confirm functionality for app
@app.get("/")
def root():
    """Endpoint made to prove connectivity."""
    return {"Success": "Connection made"}


# access all players in the database
@app.get("/players/", response_model=List[PlayerSchema])
def all_players(db: SessionLocal = Depends(get_db)):
    """GET request for all players in database."""
    try:
        players = db.query(Player).all()
        logger.info("Fetched %s players from database", len(players))
        return players
    except SQLAlchemyError as e:
        logger.error("Database error during all_players query: %s", e, exc_info=True)
        raise HTTPException(status_code=500, detail=f"Database Error: {str(e)}")


# get player based on their specific rank
@app.get("/players/{rank}")
def individual_player(rank: str, db: SessionLocal = Depends(get_db)):
    """Allows for search for a particular existing player in the database by 'rank'."""
    try:
        player = db.query(Player).filter(Player.id == rank).first()
        if not player:
            logger.warning("Player with rank %s not found", rank)
            raise HTTPException(status_code=404, detail=f'Player with ID {rank} not found')
        logger.info("Returned player: %s (ID=%s)", player.name, rank)
        return player
    except SQLAlchemyError as e:
        logger.error("Database error fetching player%s: %s", rank, e, exc_info=True)
        raise HTTPException(status_code=404, detail=f"Player with ID {rank} not found")


# endpoint for assessing health of application
@app.get("/health")
def health():
    """Check health of database."""
    logger.debug("Health check endpoint hit")
    return {"ok": True}
