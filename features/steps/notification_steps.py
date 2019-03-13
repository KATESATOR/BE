from behave import *
from features.utility.element import *
from features.pages.notification_page import NotificationPage


@step('I add notification rule {rule}')
def add_rule(context, rule):
    try:
        add_rule_button = Button("//*[@id='" + rule + "']//div", "xpath", "add rule")
        add_rule_button.click()
        context.log.info("I add notification rule")
    except:
        context.screenshot.take_screenshot("I can't add notification rule: " + rule)
        context.log.warn("I can't add notification rule")
        raise


@step('I enter text {text} in second rule field {field} row {row}')
def enter_limit_hours(context, text, field, row):
    try:
        limit_hours_field = TextField("//*[@id='" + row + "']//*[@class='controlBorder " + field + " rowLeadInput']",
                                      "xpath", "time-track is less than field")
        limit_hours_field.send_keys(text)
        context.log.info("I enter limit hours")
    except:
        context.screenshot.take_screenshot("I can't enter limit hours: " + text)
        context.log.warn("I can't enter limit hours")
        raise


@step('I enter text {text} in rule field {field} row {row}')
def enter_limit_days(context, text, field, row):
    try:
        limit_days_field = TextField("//*[@id='" + row + "']//*[@class='controlBorder " + field + "']", "xpath",
                                     "tt limit field")
        limit_days_field.send_keys(text)
        context.log.info("I enter limit days")
    except:
        context.screenshot.take_screenshot("I can't enter limit days: " + text)
        context.log.warn("I can't enter limit days")
        raise


@step('I save row {row} notification {notification} rule')
def save_notification_rule(context, row, notification):
    try:
        NotificationPage.rule_row = Element(row, "id", "rule row " + row)
        save_rule_button = Button("//*[@id='" + row + "']//*[@class='saveButton " + notification + "']",
                                  "xpath", "save personal tt rule button")
        save_rule_button.click()
        context.log.info("I save " + notification + " rule")
    except:
        context.screenshot.take_screenshot("I can't save notification rule")
        context.log.warn("I can't save notification rule")
        raise


@step('I pause/resume row {row} notification rule')
def resume_notification_rule(context, row):
    try:
        NotificationPage.paused_text = Element("//*[@id='" + row + "']//*[contains(@class, 'iconMessage')]",
                                               "xpath",
                                               "paused text")
        resume_button = Button("//*[@id='" + row + "']//*[contains(@class, 'rule-icon-button resume-button')]", "xpath",
                               "resume rule")
        resume_button.click()
        context.log.info("I pause/resume rule")
    except:
        context.screenshot.take_screenshot("I can't pause/resume rule")
        context.log.warn("I can't pause/resume rule")
        raise


@step('I remove row {row} notification rule')
def remove_notification_rule(context, row):
    try:
        NotificationPage.rule_row = Element(row, "id", "rule row " + row)
        delete_rule_button = Button("//*[@id='" + row + "']//*[contains(@class,'rule-icon-button remove-button')]",
                                    "xpath", "remove rule")
        delete_rule_button.click()
        context.log.info("I delete rule")
    except:
        context.screenshot.take_screenshot("I can't delete rule")
        context.log.warn("I can't delete rule")
        raise
