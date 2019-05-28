import logging
import os

from logging.handlers import RotatingFileHandler


# 日志模块，带滚动策略
def create_logger():
    if not os.path.exists('../log/'):
        os.makedirs('../log/')
    # 日志文件
    file_handler = RotatingFileHandler('../log/log.log', maxBytes=100*1024*1024, backupCount=2) # 单个文件100M
    file_handler.setLevel(logging.INFO)
    file_handler.setFormatter(logging.Formatter("%(asctime)s %(filename)s [line:%(lineno)d] [%(levelname)s'] %(message)s"))
    # 屏幕输出
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.INFO)
    console_handler.setFormatter(logging.Formatter("[%(levelname)s] %(message)s"))
    # logger对象
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.INFO)
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
    return logger
