from core.main import Player

def test_create_player(db_session):
    player = Player(
        name="Justin Jefferson", 
        team="MIN", 
        position="WR",
        position_rank=2,
        receptions=100.5,
        receiving_yards=1450.5,
        receiving_tds=7.5,
        rushing_yards = 0,
        rushing_tds=0,
        passing_yards=0,
        passing_tds=0,
        turnovers=6,
        proj_points=250,
        tier=1)
    db_session.add(player)
    db_session.commit()
    db_session.refresh(player)

    assert player.id is not None
    assert player.name == "Justin Jefferson"
    assert player.position == "WR"