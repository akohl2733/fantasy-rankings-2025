import logging
from logging.handlers import RotatingFileHandler
import os


# ensure log dir exists
os.makedirs("logs", exist_ok=True)


# Base logger
logger = logging.getLogger("fantasy_app")
logger.setLevel(logging.INFO)


# format
formatter = logging.Formatter(
    '%(asctime)s | %(levelname)s | %(name)s | %(message)s'
)


# console handler (for Docker / stdout)
console_handler = logging.StreamHandler()
console_handler.setFormatter(formatter)


# rotating file handler - keeps 5 logs of up to 1 MB each
file_handler = RotatingFileHandler(
    "logs/app.log", maxBytes=1_000_000, backupCount=5
)
file_handler.setFormatter(formatter)


# attach handlers if not present
if not logger.hasHandlers():
    logger.addHandler(console_handler)
    logger.addHandler(file_handler)