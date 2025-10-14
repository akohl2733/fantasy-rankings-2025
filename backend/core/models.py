from sqlalchemy import Column, Integer, Float, String, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relationship, Mapped, mapped_column
from main import Base

class PlayerInfo(Base):
    __tablename__ = 'player_info'
    __table_args__ = (UniqueConstraint("name", "team", name="uq_player_name_team"),)

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = mapped_column(String(50), nullable=False)
    position: Mapped[str] = mapped_column(String(10))
    team: Mapped[str] = mapped_column(String(3))

    weekly_stats_qb_flex = relationship("WeeklyStats_QB_Flex", back_populates="playerinfo")

    def repr(self):
        return f"<PlayerInfo(name={self.name}, team={self.team}, pos={self.position})>"

class WeeklyStats_QB_Flex(Base):
    __tablename__ = 'weekly_stats_qb_flex'

    id: Mapped[int] = mapped_column(primary_key=True, index=True)
    player_id: Mapped[int] = mapped_column(ForeignKey("player_info.id"))
    week: Mapped[int] = mapped_column(nullable=False)
    year: Mapped[int] = mapped_column(nullable=False)
    pass_yards: Mapped[int] 
    pass_tds: Mapped[int]
    rush_attempts: Mapped[int]
    rush_yards: Mapped[int]
    rush_tds: Mapped[int]
    targets: Mapped[int]
    receptions: Mapped[int]
    receiving_yards: Mapped[int]
    receiving_tds: Mapped[int]
    fumbles: Mapped[int]
    interceptions: Mapped[int]
    fantasy_points: Mapped[float]
    game_played: Mapped[int]
    rostered_percent: Mapped[int]   

    playerinfo = relationship("PlayerInfo", back_populates=("weekly_stats_qb_flex"))

    def repr(self):
        return f"<Weekly Stats(id={self.player_id}, fantasy_points={self.fantasy_points})>"