from behave import *
import re
import time


#  Шаги для всех тестов

#  открытие страницы и запуск конфигов
@step('I open a page {page}')
def open_a_page(context, page):
    try:
        context.pages_and_tabs.open_page(page)
        cookies = context.driver.get_cookies()
        if len(cookies) != 0:
            context.driver.delete_all_cookies()
            context.driver.refresh()
        context.log.info("I have opened a page: " + str(page))
    except:
        context.log.warn("I can't open a page: " + str(page))
        context.screenshot.take_screenshot("I can't open a page")
        raise


@given('I am logged in as admin')
def login_as_admin(context):
    context.execute_steps(f"""
           Given I open a page {'http://rdbuild-agent:8080/cur/login.do'}
           When {'at_login_page'} is visible
           And I enter {'admin'} in the {'username_field'}
           And I enter {'manager'} in the {'password_field'}
           And I click {'login_button'}
       """)


@given('I am logged in as user')
def login_as_user(context):
    context.execute_steps(f"""
           Given I open a page {'http://rdbuild-agent:8080/cur/login.do'}
           When {'at_login_page'} is visible
           And I enter {'user'} in the {'username_field'}
           And I enter {'user'} in the {'password_field'}
           And I click {'login_button'}
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


@step('I {select|deselect} the {checkbox}')
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


@when('I take a screenshot with name {name}')
def take_the_screenshot(context, name):
    context.screenshot.take_screenshot(name)


@when('I wait {seconds} seconds for animation stops')
def wait(context, seconds):
    time.sleep(int(seconds))


@when('I enter {text} in the {text_field}')
def filling_the_text_field(context, text, text_field):
    page = set_page
    text_field = getattr(page, text_field.replace(" ", "_"))
    try:
        text_field.send_keys(text)
        context.log.info(text_field.name + " has been filled with " + text)
    except:
        context.log.warn(text_field.name + " doesn't filled with " + text)
        context.screenshot.take_screenshot("Can not enter the text in the " + text_field.name)
        raise


@when('I choose {value} in {selector}')
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


@when('I set focus to tab {value}')
def set_focus_to_tab(context, value):
    context.pages_and_tabs.set_focus_to_tab(value)


@when('I set focus to next tab')
def set_focus_to_next_tab(context):
    context.pages_and_tabs.set_focus_to_next_tab()


@then('I can see a web element {web_element}')
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


@then('I can see a text {text} on the page')
def assert_text_is_displayed(context, text):
    try:
        assert text in context.driver.page_source
        context.log.info(text + " is visible ")
    except:
        context.log.warn(text + " isn't visible!")
        context.screenshot.take_screenshot("Text is not visible")
        raise


@then('My current URL contains {URL}')
def assert_url(context, URL):
    current_url = context.driver.current_url
    result = re.search(URL, current_url)
    try:
        assert result is not None
        context.log.info(URL + " is opened")
    except:
        context.log.warn(URL + " isn't opened!")
        context.screenshot.take_screenshot("URL isn't opened!")
        raise
