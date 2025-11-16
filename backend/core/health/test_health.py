"""
Hit the /health endpoint to test API health.
"""

from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_health():
    """Query the health endpoint in the API."""
    r = client.get("/health")
    assert r.status_code == 200
