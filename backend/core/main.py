from fastapi import FastAPI, HTTPException, Depends
from fastapi.requests import Request
from fastapi.responses import JSONResponse
from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from sqlalchemy.exc import SQLAlchemyError
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from core.logging_config import logger
from typing import List
import pandas as pd 
import os


# start FastAPI app
app = FastAPI()


# mark frontend
origins = [
    "http://localhost:3000",
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
async def global_exception_handler(request: Request, exc: Exception):
    logger.error(f"Unhandled error: {exc}", exc_info=True)
    return JSONResponse(status_code=500, content={"detail": "Internal Server Error"})


# log to confirm start up and shutdown
@app.on_event("startup")
def startup_event():
    logger.info("FastAPI app starting up")

@app.on_event("shutdown")
def shutdown_event():
    logger.info("FastAPI app shutting down")


class Base(DeclarativeBase):
    pass


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
    logger.error(f"Database Initializtion failed: {e}", exc_info=True)
    raise


# scheme for player
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


# create a thread to existing session to be used as parameter in endpoint logic
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# confirm functionality for app
@app.get("/")
def root():
    return {"Success": "Connection made"}


# access all players in the database
@app.get("/players/", response_model=List[PlayerSchema])
def all_players(db: SessionLocal = Depends(get_db)):
    try:
        players = db.query(Player).all()
        logger.info(f"Fetched {len(players)} players from database")
        return players
    except SQLAlchemyError as e:
        logger.error(f"Database error during all_players query: {e}", exc_info=True)
        raise HTTPException(status_code=500, detail=f"Database Error: {str(e)}")


# get player based on their specific rank
@app.get("/players/{rank}")
def individual_player(rank: str, db: SessionLocal = Depends(get_db)):
    try:
        player = db.query(Player).filter(Player.id == rank).first()
        if not player:
            logger.warning(f"Player with rank {rank} not found")
            raise HTTPException(status_code=404, detail=f'Player with ID {rank} not found')
        logger.info(f"Returned player: {player.name} (ID={rank})")
        return player
    except SQLAlchemyError as e:
        logger.error(f"Database error fetching player{rank}: {e}", exc_info=True)
        raise HTTPException(status_code=404, detail=f"Player with ID {rank} not found")


# endpoint for assessing health of application
@app.get("/health")
def health():
    logger.debug("Health check endpoint hit")
    return {"ok": True}