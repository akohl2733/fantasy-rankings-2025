import pytest
from backend.core.utils import clean_player_name

@pytest.mark.parametrize("input_name,expected", [
    (' patrick mahomes ', "Patrick Mahomes"),
    ('LAMAR JACKSON', "Lamar Jackson"),
    (" JoSH allen", "Josh Allen"),
])
def test_clean_player_name(input_name, expected):
    assert clean_player_name(input_name) == expected