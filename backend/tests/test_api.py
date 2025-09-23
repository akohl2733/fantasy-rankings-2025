from fastapi.testclient import TestClient 
from backend.core.main import app

client = TestClient(app)

def test_get_existing_player(client, db_session):
    
    from backend.core.main import Player
    player = Player(
        id=1,
        name="Patrick Mahomes",
        team="KC",
        position="QB",
        position_rank=1,
        receptions=0,
        receiving_yards=0,
        receiving_tds=0,
        rushing_yards=0,
        rushing_tds=0,
        passing_yards=0,
        passing_tds=0,
        turnovers=0,
        proj_points=0,
        tier=1,
    )
    db_session.add(player)
    db_session.commit()

    response = client.get("/players/1")
    assert response.status_code == 200
    data = response.json()
    assert data["name"] == "Patrick Mahomes"

def test_get_nonexistent_player(client):
    response = client.get("/players/99")
    assert response.status_code == 404
    assert "Player with ID 99 not found" in response.json()['detail']