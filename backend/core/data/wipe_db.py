"""
If database becomes corrupted, run this file to wipe one or both clean.
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# from models import WeeklyStats_QB_Flex
# from main import engine

# WeeklyStats_QB_Flex.__table__.drop(bind=engine, checkfirst=True)
# WeeklyStats_QB_Flex.__table__.create(bind=engine, checkfirst=True)