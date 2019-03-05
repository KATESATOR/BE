from features.utility.initialization import *
from features.configuration import Config
from features.utility.screenshot import Screenshot
from features.utility.pages_and_tabs import PagesAndTabs
from features.utility.custom_logger import CustomLogger
import logging


def before_all(context):
    c = Config("chrome")
    context.log = CustomLogger.logger(logging.DEBUG)
    context.driver = c.get_driver()
    context.web_elements = Pages()
    context.screenshot = Screenshot()
    context.driver.maximize_window()
    context.pages_and_tabs = PagesAndTabs()


def before_scenario(context, scenario):
    pass


def after_scenario(context, scenario):
    context.driver.delete_all_cookies()
    # context.driver.refresh() из-за этого шага после импорта дампа обновляется страница и дамп заливается повторно
    try:
        context.driver.switch_to_alert().accept()
    except:
        pass


def after_all(context):
    # context.screenshot.take_screenshot("All tests passed")
    context.driver.quit()
