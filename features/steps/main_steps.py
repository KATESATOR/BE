from behave import *
from features.utility.element import *
from features.utility.constants import Constants
import re
import time
import glob
import os


#  Шаги для всех тестов

#  открытие страницы и запуск конфигов
@step('I open a page {page}')
def open_a_page(context, page):
    try:
        context.pages_and_tabs.open_page(Constants.aTUrl + page)
        cookies = context.driver.get_cookies()
        if len(cookies) != 0:
            context.driver.delete_all_cookies()
            context.driver.refresh()
        context.log.info("I have opened a page: " + str(Constants.aTUrl + page))
    except:
        context.log.warn("I can't open a page: " + str(Constants.aTUrl + page))
        context.screenshot.take_screenshot("I can't open a page")
        raise


@step('I open actiPLANS page {page}')
def open_a_page(context, page):
    try:
        context.pages_and_tabs.open_page(Constants.aPUrl + page)
        cookies = context.driver.get_cookies()
        if len(cookies) != 0:
            context.driver.delete_all_cookies()
            context.driver.refresh()
        context.log.info("I have opened a page: " + str(Constants.aPUrl + page))
    except:
        context.log.warn("I can't open a page: " + str(Constants.aPUrl + page))
        context.screenshot.take_screenshot("I can't open a page")
        raise


@step('I am logged in as admin')
def login_as_admin(context):
    context.execute_steps(f"""
           Given I open a page {'/'}
           When {'at_login_page'} is visible
           And I enter {'admin'} in the {'username_field'}
           And I enter {'manager'} in the {'password_field'}
           And I click {'login_button'}
       """)
    time.sleep(1)
    text = "Welcome to actiTIME!"
    start_button = Button(".startExploringText", "css", "start exploring button")
    if text not in context.driver.page_source:
        pass
    else:
        start_button.click()
        time.sleep(10)


@step('I am logged in actiPLANS as admin')
def login_as_admin(context):
    context.execute_steps(f"""
           Given I open actiPLANS page {'/'}
           When {'ap_login_page'} is visible
           And I enter {'admin'} in the {'username_field'}
           And I enter {'manager'} in the {'password_field'}
           And I click {'login_button'}
        """)
    time.sleep(1)
    text = "Welcome to actiTIME!"
    start_button = Button(".startExploringText", "css", "start exploring button")
    if text not in context.driver.page_source:
        pass
    else:
        start_button.click()
        time.sleep(10)


@step('I am logged in as user')
def login_as_user(context):
    context.execute_steps(f"""
           Given I open a page {'/'}
           When {'at_login_page'} is visible
           And I enter {'trainee'} in the {'username_field'}
           And I enter {'trainee'} in the {'password_field'}
           And I click {'login_button'}
       """)
    time.sleep(1)
    text = "Welcome to actiTIME!"
    start_button = Button(".startExploringText", "css", "start exploring button")
    if text not in context.driver.page_source:
        pass
    else:
        start_button.click()
        time.sleep(3)


@step('I am on {page} page')
def on_page(context, page):
    context.execute_steps(f"""
           Given general_page is visible
           And I click {page}
       """)


# указание на какой странице находимся, для взаимодеймствия с элементами с этой страницы
@step('{page} is visible')
def set_the_page(context, page):
    global set_page
    set_page = getattr(context.web_elements, page.replace(" ", "_"))
    return set_page


@step('I click {button}')
def click_the_button(context, button):
    page = set_page
    button = getattr(page, button.replace(" ", "_"))
    try:
        button.click()
        context.log.info("I have clicked the button: " + button.name)
    except:
        context.screenshot.take_screenshot("Can not click the  " + button.name)
        context.log.warn("I can't click the button: " + button.name)
        raise


@step('I accept alert menu')
def accept_alert_menu(context):
    context.driver.switch_to_alert().accept()


@step('I dismiss alert menu')
def dismiss_alert_menu(context):
    context.driver.switch_to_alert().dismiss()


@step('I perform {option} in the {checkbox}')
def select_or_deselect_checkbox(context, option, checkbox):
    page = set_page
    checkbox = getattr(page, checkbox.replace(" ", "_"))
    if option == 'select':
        try:
            checkbox.select()
            context.log.info("Checkbox has been selected : " + str(checkbox.name))
        except:
            context.screenshot.take_screenshot("Can not select the checkbox " + checkbox.name)
            context.log.warn("Can not select the checkbox: " + str(checkbox.name))
            raise

    elif option == "deselect":
        try:
            checkbox.deselect()
            context.log.info("Checkbox has been deselected : " + str(checkbox.name))
        except:
            context.screenshot.take_screenshot("Can not deselect the checkbox " + checkbox.name)
            context.log.warn("Can't deselect the checkbox: " + str(checkbox.name))
            raise


@step('I take a screenshot with name {name}')
def take_the_screenshot(context, name):
    context.screenshot.take_screenshot(name)


@step('I wait {seconds} seconds for animation stops')
def wait(context, seconds):
    time.sleep(int(seconds))


@step('I enter {text} in the {text_field}')
def filling_the_text_field(context, text, text_field):
    page = set_page
    text_field = getattr(page, text_field.replace(" ", "_"))
    try:
        # text_field.clear()
        text_field.send_keys(text)
        context.log.info(text_field.name + " has been filled with " + text)
    except:
        context.log.warn(text_field.name + " doesn't filled with " + text)
        context.screenshot.take_screenshot("Can not enter the text in the " + text_field.name)
        raise


@step('I choose {value} in {selector}')
def choosing_value_in_selector(context, value, selector):
    page = set_page
    selector = getattr(page, selector.replace(" ", "_"))
    try:
        selector.select_by_value(value)
        context.log.info(value + " has been selected in " + selector.name)
    except:
        context.log.warn(value + " hasn't been selected in " + selector.name)
        context.screenshot.take_screenshot(value + " has not been selected in " + selector.name)
        raise


@step('I set focus to tab {value}')
def set_focus_to_tab(context, value):
    context.pages_and_tabs.set_focus_to_tab(value)


@step('I set focus to next tab')
def set_focus_to_next_tab(context):
    context.pages_and_tabs.set_focus_to_next_tab()


@step('I check {parameter} of the {element}')
def check_parameter(context, parameter, element):
    page = set_page
    element = getattr(page, element.replace(" ", "_"))
    try:
        value = element.get_attr(parameter)
        context.log.info(element + " have " + parameter + " = " + value)
    except:
        context.log.warn(element + " haven't " + parameter + " = " + value)
        context.screenshot.take_screenshot("Value has not been found in " + element)
        raise


@step('I refresh the page')
def refresh_page(context):
    context.driver.refresh()


@step('I restart browser and open a page {page}')
def restart_browser(context, page):
    x = context.driver.get_cookie('ALIUN')
    if x is not None:
        context.driver.get(Constants.aTUrl + page)
    elif x is None:
        context.driver.delete_all_cookies()
        context.driver.get(Constants.aTUrl + page)


@step('I restart browser and open actiPLANS page {page}')
def restart_browser(context, page):
    x = context.driver.get_cookie('ALIUN')
    if x is not None:
        context.driver.get(Constants.aPUrl + page)
    elif x is None:
        context.driver.delete_all_cookies()
        context.driver.get(Constants.aPUrl + page)


@step('Element with {text} should be displayed')
def element_with_text_is_displayed(context, text):
    element = Element("//table[@class='taskRowsTable']/tbody/tr[1]//*[text()=" + "'" + text + "'" + "]", "xpath",
                      "element")
    try:
        assert element.is_displayed()
        context.log.info(element.name + " is visible ")
    except:
        context.log.warn(element.name + " isn't visible!")
        context.screenshot.take_screenshot(element.name + " is not visible")
        raise


@step('I should see a web element {web_element}')
def assert_web_element_is_displayed(context, web_element):
    page = set_page
    web_element = getattr(page, web_element.replace(" ", "_"))
    try:
        assert web_element.is_displayed()
        context.log.info(web_element.name + " is visible ")
    except:
        context.log.warn(web_element.name + " isn't visible!")
        context.screenshot.take_screenshot(web_element.name + " is not visible")
        raise


# метод отрабатывает верно, если элемент был найден, но не виден для пользователя
# если же элемент вообще не найден, то пишется ошибка в консоль
@step('I should not see a web element {web_element}')
def assert_web_element_is_not_displayed(context, web_element):
    page = set_page
    web_element = getattr(page, web_element.replace(" ", "_"))
    if web_element.is_displayed():
        context.log.warn(web_element.name + " is visible!")
        context.screenshot.take_screenshot(web_element.name + " is visible!")
        raise Exception(web_element.name + " is found!")
    else:
        context.log.info(web_element.name + " isn't visible")
        pass


@step('I should see a text {text} on the page')
def assert_text_is_displayed(context, text):
    try:
        assert text in context.driver.page_source
        context.log.info(text + " is visible ")
    except:
        context.log.warn(text + " isn't visible!")
        context.screenshot.take_screenshot("Text is not visible")
        raise


@step('I should not see a text {text} on the page')
def assert_text_is_not_displayed(context, text):
    if text in context.driver.page_source:
        context.log.warn(text + " is visible!")
        context.screenshot.take_screenshot("Text is visible!")
        raise Exception(text + " is found!")
    else:
        context.log.info(text + " isn't visible")
        pass


@step('My current URL should contain {URL}')
def assert_url(context, URL):
    current_url = context.driver.current_url
    result = re.search(Constants.aTUrl + URL, current_url)
    try:
        assert result is not None
        context.log.info(Constants.aTUrl + URL + " is opened")
    except:
        context.log.warn(Constants.aTUrl + URL + " isn't opened!")
        context.screenshot.take_screenshot("URL isn't opened!")
        raise


@step('{element} should have {parameter} with {value}')
def parameter_contain_value(context, element, parameter, value):
    page = set_page
    element = getattr(page, element.replace(" ", "_"))
    value2 = element.get_attr(parameter)
    try:
        assert value2 == value
        context.log.info(element.name + " contain " + parameter + " with value " + value)
    except:
        context.log.warn(element.name + " doesn't contain " + parameter + " with value " + value)
        context.screenshot.take_screenshot("Value has not been found in " + element.name)
        raise


@step('{element} should contain {value}')
def parameter_contain_value(context, element, value):
    page = set_page
    element = getattr(page, element.replace(" ", "_"))
    x = element.get_attr('innerHTML')
    try:
        assert value == x
        context.log.info(element.name + " contain value " + value)
    except:
        context.log.warn(element.name + " doesn't contain value " + value)
        context.screenshot.take_screenshot("Text has not been found in " + element.name)
        raise


@step('Checking file with format {format}')
def file_is_present(context, format):
    path = os.environ['USERPROFILE'] + '/Downloads/'
    os.chdir(path)
    file_list = glob.glob("*" + '.' + format)
    try:
        if len(file_list) == 0:
            context.log.warn("File not found")
            raise Exception
        for file in file_list:
            context.log.info(file + " is found in downloads folder")
            os.remove(file)
    except FileNotFoundError:
        context.log.info("I can't find file in downloads folder: " + format)
        raise


@step('I upload {file} from {folder} in {element}')
def upload_file(context, file, folder, element):
    current_directory = os.path.dirname(__file__)
    directory = os.path.join(current_directory, '..', folder)
    page = set_page
    os.chdir(directory)
    element = getattr(page, element.replace(" ", "_"))
    try:
        element.send_keys(os.getcwd() + file)
    except:
        context.screenshot.take_screenshot("Can not upload" + file)
        raise
