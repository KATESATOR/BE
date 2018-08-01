import inspect
import logging
import os
import settings


class CustomLogger:

    @staticmethod
    def logger(log_level=logging.DEBUG):

        logger_name = inspect.stack()[1][3]
        logger = logging.getLogger(logger_name)

        logger.setLevel(logging.DEBUG)
        path = os.path.join(settings.LOGS_DIR, "automation.log")
        file_handler = logging.FileHandler(filename=path, mode='a') # w - логи только последнего запущенного теста
        file_handler.setLevel(log_level)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s: %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)

        return logger

