"""
Intakes players names from CSV and matches their format to existing names in DB.
"""

def clean_player_name(name: str) -> str:
    """Strip player name of any white-space and capitalize first/last names"""
    return name.strip().title()
