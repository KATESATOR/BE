from features.utility.element import *


class WorkSchedulePage:

    def __init__(self):
        # Work Schedule
        self.current_working_day = Button("//*[@class='calendarWorkingDay calendarCurrentDay']", "xpath",
                                          "current work day")
        self.current_weekend_day = Button("//*[@class='calendarWeekendDay calendarCurrentDay']", "xpath",
                                          "current weekend day")
        self.format_selector = Button("formatSelectorElm", "id", "number of mounths to view selector")
        self.show_3 = Button("format3", "id", "full format")
        self.show_5 = Button("format5", "id", "full format")
        self.last_month_table = Element("tbody>tr:nth-of-type(5) #calendar_table", "css", "last table")
        self.year_selector = Button("div.simpleListMenuButton.emptyList.notEmpty > div.title", "css", "year selector")
        self.year_selector_2016 = Button("//div[contains(text(),'2016')]", "xpath", "set 2016 year in selector")
        self.edit_day = Button("//div[contains(@class,'monthsContainer')]//div[1]//div[3]//div[2]", "xpath", "edit day")
        self.corp_day_check = Element("div.components_day.monthDay.corporateHoliday:nth-child(2)", "css", "corp day")
        self.day_29_check = Element("//div[@class='calendar']//div[2]//div[3]//div[29]", "xpath", "check 29 feb 2016")
        self.import_button = Button("div.importHolidaysButton > div.components_button.import", "css", "import button")
        self.set_usa = Button("//div[contains(@class,'defaultTimeZoneCountry')]", "xpath", "choose USA in selector")
        self.holiday_check = Element("//div[contains(text(),'Veterans Day')]", "xpath", "Veteran holiday check")
        self.holiday_check_2 = Element("div#container div:nth-child(11) > div.monthDays > div:nth-child(15)", "css",
                                       "corp day 11 november")
        self.import_btn_2 = Button("div.footer div.importButton > div.components_button.import", "css", "import btn 2")
        self.close_panel = Button("//div[contains(@class,'holidayListPanel components_panelContainer')]//div["
                                  "contains(@class,'hideButton_panelContainer')]", "xpath", "close panel")
        self.holiday_name = Button("div#container div:nth-child(1) > div.nameContainer > div.nameColumn > div > "
                                   "div.nameLabel", "css", "holiday name field")
        self.holiday_list = Button("//div[contains(@class,'components_button list')]", "xpath", "holiday list")
        self.name_field = Button("//div[contains(text(),'Corporate Holiday')]", "xpath", "field for delete icon")
        self.delete_holiday = Button("div.list div.holidayInfo:nth-child(1) div.nameContainer > div.deleteIcon", "css",
                                     "delete")
        self.cancel_delete = Button("div.holidayInfo.deleteConfirmation:nth-child(1) div.deleteHolidayContainer > "
                                    "div.cancelDelete", "css", "cancel delete")
        self.remove_holiday = Button("div.holidayInfo.deleteConfirmation:nth-child(1) div.deleteHolidayContainer "
                                     "div.confirmDelete > div.components_button", "css", "remove holiday")
