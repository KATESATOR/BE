from behave import *
from features.utility.element import *


@step('I remove leave type with name {leave_name}')
def remove_leave_type(context, leave_name):
    try:
        rm_leave_type = Button(
            "//span[@class='leaveTypeNameText'][contains(text(), '" + leave_name +
            "')]//ancestor::*/*[contains(@class, 'leaveTypeDeleteCell')]",
            "xpath", "remove leave type button")
        rm_leave_type.click()
        context.log.info("I remove leave type")
    except:
        context.screenshot.take_screenshot("I can't remove leave type: " + leave_name)
        context.log.warn("I can't remove leave type")
        raise


@step('I click on leave type text {text}')
def click_on_leave_type_text(context, text):
    try:
        rm_leave_type = Button(
            "//span[@class='leaveTypeNameText'][contains(text(), '" + text +
            "')]", "xpath", "remove leave type button")
        rm_leave_type.click()
        context.log.info("I click on leave type text")
    except:
        leave_type_text = Button(
            "//span[@class='leaveTypeNameText'][contains(text(), '" + text +
            "')]", "xpath", "leave type text")
        leave_type_text.click()
        context.log.info("I click on leave type text")
    except:
        context.screenshot.take_screenshot("I can't click on leave type text: " + text)
        context.log.warn("I can't click on leave type text")
        raise
