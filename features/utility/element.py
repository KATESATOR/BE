from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import *
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from retrying import retry
from traceback import print_stack
from features.utility.custom_logger import CustomLogger as cl
from features.configuration import Config
from features.utility.screenshot import Screenshot
import logging


class Element:
    ss = Screenshot()
    log = cl.logger(logging.DEBUG)

    def __init__(self, locator, locator_type, name=""):
        self.locator = locator
        self.locator_type = locator_type
        self.name = name

    def get_by_type(self):
        locator_type = self.locator_type.lower()
        if locator_type == "id":
            return By.ID
        elif locator_type == "name":
            return By.NAME
        elif locator_type == "xpath":
            return By.XPATH
        elif locator_type == "css":
            return By.CSS_SELECTOR
        elif locator_type == "class":
            return By.CLASS_NAME
        elif locator_type == "link":
            return By.LINK_TEXT
        else:
            self.log.info("Locator type " + locator_type +
                          " isn't correct")
        return locator_type

    def web_element(self):
        element = None
        try:
            element = Config.driver.find_element(self.get_by_type(), self.locator)
        except:
            self.log.warn("Element isn't found with locator: " + self.locator +
                          " and locator_type: " + self.locator_type)
            print_stack()
        return element

    def wait_for_element(self, condition, timeout=25, pollFrequency=0.5):
        try:
            wait = WebDriverWait(Config.driver, timeout=timeout,
                                 poll_frequency=pollFrequency,
                                 ignored_exceptions=[NoSuchElementException,
                                                     ElementNotVisibleException,
                                                     ElementNotSelectableException])

            condition = condition.lower()
            # click = element_to_be_clickable
            # present = presence_of_element_located
            # select = element_to_be_selected

            if condition == 'click':
                wait.until(EC.element_to_be_clickable((self.locator_type, self.locator)))
            elif condition == 'present':
                wait.until(EC.presence_of_element_located((self.locator_type, self.locator)))
            elif condition == 'select':
                wait.until(EC.element_to_be_selected((self.locator_type, self.locator)))
        except:
            self.log.warn("Element hasn't appeared on the web page")

    def get_attr(self, parameter):

        try:
            web_element = self.web_element()
            value = web_element.get_attribute(parameter)
        except:
            raise
        return value


class Button(Element):

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def click(self):
        try:
            self.wait_for_element('click')
            self.web_element().click()
        except:
            raise

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('present')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False

    def get_text(self, info=""):

        try:
            web_element = self.web_element()
            text = web_element.text
            if len(text) == 0:
                text = web_element.get_attribute("innerText")
            if len(text) != 0:
                self.log.info("Getting text on element :: " + info)
                self.log.info("The text is :: '" + text + "'")
                text = text.strip()
        except:
            self.log.warn("Failed to get text on element " + info)
            print_stack()
            text = None
        return text


class CheckBox(Element):

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def select(self):
        try:
            self.wait_for_element('click')
            if self.web_element().is_selected():
                self.log.info("The checkbox is already selected with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
                pass
            else:
                self.web_element().click()

        except:
            raise

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def deselect(self):
        try:
            self.wait_for_element('click')
            if not self.web_element().is_selected():
                self.log.info("The checkbox is already deselected with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
                pass
            else:
                self.web_element().click()
        except:
            raise

    def is_selected(self):
        try:
            self.wait_for_element('click')
            if self.web_element().is_selected():
                self.log.info("The checkbox with locator: " + self.locator +
                              " locatorType: " + self.locator_type + " is selected")
            else:
                self.log.info("The checkbox with locator: " + self.locator +
                              " locatorType: " + self.locator_type + " is not selected")

        except:
            self.log.warn("Cannot find the checkbox with locator: " + self.locator +
                          " locatorType: " + self.locator_type)

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('present')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False


class TextField(Element):

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    def clear_field(self):
        try:
            self.wait_for_element('present')
            self.web_element().clear()
        except:
            self.log.warn("Cannot clear the text field with locator: " + self.locator +
                          ", locatorType: " + self.locator_type)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def send_keys(self, text):
        try:
            self.wait_for_element('present')
            self.web_element().clear()
            self.web_element().send_keys(text)
        except:
            raise

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('present')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False


class Selector(Element):
    a = 120

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def select_by_value(self, value):
        try:
            self.wait_for_element('present')
            Select(self.web_element()).select_by_value(value)
        except:
            raise

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def select_by_index(self, index):
        try:
            self.wait_for_element('present')
            Select(self.web_element()).select_by_index(index)
        except:
            raise

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def select_by_visible_text(self, text):
        try:
            self.wait_for_element('present')
            Select(self.web_element()).select_by_visible_text(text)
        except:
            raise

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('select')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False


class Slider(Element):

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def moving_slider(self, attribute='text()', quantity=None):
        try:
            self.wait_for_element('present')
            position = Config.driver.find_element_by_xpath(
                "//span[@class='irs-grid']//span[{}='{}']".format(attribute, quantity))
            Config.get_actions().click_and_hold(self.web_element()).move_to_element(position).release().perform()
        except:
            raise

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def moving_ap_slider(self, quantity=None):
        try:
            self.wait_for_element('present')
            position = Config.driver.find_element_by_xpath(
                "//table[@class='inst-option width_100 cell_padd_spac']//td[@style]//a[@href='#{}']".format(quantity))
            Config.get_actions().click_and_hold(self.web_element()).move_to_element(position).release().perform()
        except:
            raise

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('present')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False


class Link(Element):

    def __init__(self, locator, locator_type, name=""):
        super().__init__(locator, locator_type, name)

    @retry(wait_fixed=1000, stop_max_delay=10000)
    def click(self):
        try:
            self.wait_for_element('click')
            self.web_element().click()
        except:
            raise

    def is_displayed(self):
        is_displayed = False
        try:
            self.wait_for_element('click')
            web_element = self.web_element()
            if web_element is not None:
                is_displayed = web_element.is_displayed()
                self.log.info("Element is displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            else:
                self.log.warn("Element is not displayed with locator: " + self.locator +
                              " locatorType: " + self.locator_type)
            return is_displayed
        except:
            return False

    def get_text(self, info=""):

        try:
            web_element = self.web_element()
            text = web_element.text
            if len(text) == 0:
                text = web_element.get_attribute("innerText")
            if len(text) != 0:
                self.log.info("Getting text on element :: " + info)
                self.log.info("The text is :: '" + text + "'")
                text = text.strip()
        except:
            self.log.warn("Failed to get text on element " + info)
            print_stack()
            text = None
        return text
