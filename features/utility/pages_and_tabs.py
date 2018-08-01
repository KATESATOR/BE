from features.configuration import Config
from retrying import retry
import requests
from features.utility.custom_logger import CustomLogger as cl
import logging
from features.utility.screenshot import Screenshot


class PagesAndTabs:
    ss = Screenshot()
    log = cl.logger(logging.DEBUG)

    @retry(wait_fixed=1000, stop_max_delay=20000)
    def open_page(self, page):
        try:
            r = requests.get(page)
            r.raise_for_status()
            Config.driver.get(page)
        except:
            raise

    def set_focus_to_tab(self, value):
        return Config.driver.switch_to_window(Config.driver.window_handles[int(value) - 1])

    def set_focus_to_next_tab(self):
        return Config.driver.switch_to_window(Config.driver.window_handles[-1])
