import os
import time
from features.configuration import Config
from features.utility.custom_logger import CustomLogger
import logging


class Screenshot:
    log = CustomLogger.logger(logging.DEBUG)

    def take_screenshot(self, result_message):
        file_name = result_message + "." + str(time.asctime().replace(":", "_")) + ".png"
        screen_shot_directory = "../results/screenshots/"
        relative_file_name = screen_shot_directory + file_name
        current_directory = os.path.dirname(__file__)
        destination_file = os.path.join(current_directory, relative_file_name)
        destination_directory = os.path.join(current_directory, screen_shot_directory)
        try:
            if not os.path.exists(destination_directory):
                os.makedirs(destination_directory)
            Config.driver.save_screenshot(destination_file)
            self.log.info("Screenshot is saved to directory: " + destination_file)
        except:
            self.log.error("### Exception Occurred when taking screenshot")
