from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains


class Config:
    driver = None

    def __init__(self, driver_type):
        self.driver_type = driver_type

    def get_driver(self):
        if self.driver_type == "chrome":
            Config.driver = webdriver.Chrome("D:\chromedriver.exe")
            return Config.driver

    @staticmethod
    def get_actions():
        return ActionChains(Config.driver)
