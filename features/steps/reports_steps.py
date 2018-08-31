from behave import *
import os
import glob
from selenium import webdriver
from features.utility.element import Button


@step('I search report {report_name} with the extension {extension} in downloads folder')
def search_report_in_folder(context, report_name, extension):
    path = os.environ['USERPROFILE'] + '/Downloads/'
    os.chdir(path)
    try:
        if len(glob.glob("*" + report_name + "*." + extension)) == 0:
            raise FileNotFoundError
        for i in glob.glob("*" + report_name + "*." + extension):
            os.path.exists(i)
            os.remove(i)
    except FileNotFoundError:
        context.log.info("I can't find file in downloads folder: " + report_name)
        raise

@step('I accept alert menu')
def click_context_menu(context):
    context.driver.switch_to_alert().accept()

@step('I remove {report_name} report from dashboard')
def remove_report_from_dashboard(context, report_name):
    try:
        remove_report = Button(
            "//*[@class='config-name'][contains(text(),'" + report_name +
            "')]/../../../../..//*[@class='configHeaderRemoveCell']",
            "xpath", "remove report button")
        remove_report.click()
    except:
        context.log.info("I can't find file in downloads folder:")
        raise
