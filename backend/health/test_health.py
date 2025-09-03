from fastapi.testclient import TestClient 
from all_players.main import app

client = TestClient(app)

def test_health():
    r = client.get("/health")
    assert r.status_code == 200