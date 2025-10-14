import sys, os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from models import WeeklyStats_QB_Flex
from main import engine

# WeeklyStats_QB_Flex.__table__.drop(bind=engine, checkfirst=True)
# WeeklyStats_QB_Flex.__table__.create(bind=engine, checkfirst=True)