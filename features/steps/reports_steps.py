from behave import *
import os
import glob
from features.utility.element import *


# TODO: Придумать новые названия для шагов и методов, т.к они уверсальны для чартов и репорторв.


@step('I search report {report_name} with the extension {extension} in downloads folder')
def search_report_in_folder(context, report_name, extension):
    path = os.environ['USERPROFILE'] + '/Downloads/'
    os.chdir(path)
    try:
        if len(glob.glob("*" + report_name + "*." + extension)) == 0:
            raise FileNotFoundError
        for I in glob.glob("*" + report_name + "*." + extension):
            os.path.exists(I)
            os.remove(I)
    except FileNotFoundError:
        context.screenshot.take_screenshot("I can't find file in downloads folder: " + report_name)
        context.log.warn("I can't find file in downloads folder: " + report_name)
        raise


@step('I remove {report_name} report from dashboard')
def remove_report_from_dashboard(context, report_name):
    try:
        remove_report = Button(
            "//*[@class='config-name'][contains(text(),'" + report_name +
            "')]//ancestor::*/*/*[@class='configHeaderRemoveCell']",
            "xpath", "remove report button")
        remove_report.click()
        context.log.info("I remove report from dashboard")
    except:
        context.screenshot.take_screenshot("I can't remove report: " + report_name + " from dashboard")
        context.log.warn("I can't remove report from dashboard:")
        raise


@step('I select {name} in chart selector')
def select_chart(context, name):
    try:
        chart = Link(name, "link", "remove report button")
        chart.click()
        context.log.info("I select" + name + "in chart selector")
    except:
        context.screenshot.take_screenshot("I can't select " + name + " in chart selector")
        context.log.warn("I can't select " + name + " in chart selector")
        raise


@step('I open report on dashboard with name {name}')
def open_report(context, name):
    try:
        report = Button("//*[@class='config-name'][contains(text(),'" + name + "')]", "xpath", "report name")
        report.click()
        context.log.info("I open report " + name + "on dashboard")
    except:
        context.screenshot.take_screenshot("I can't open report " + name + " on dashboard")
        context.log.warn("I can't open report " + name + " on dashboard")
        raise
