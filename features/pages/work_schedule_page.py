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
        self.year_selector = Button(".simpleListMenuButton .title", "css", "year selector")
        self.year_selector_2016 = Button("//div[text()='2016']", "xpath", "set 2016 year in selector")
        self.edit_day = Button("//div[contains(@class,'monthsContainer')]//div[1]//div[3]//div[2]", "xpath", "edit day")
        self.corp_day_check = Element("div.components_day.monthDay.corporateHoliday:nth-child(2)", "css", "corp day")
        self.day_29_check = Element("//div[@class='calendar']//div[2]//div[3]//div[29]", "xpath", "check 29 feb 2016")
        self.import_button = Button(".importHolidaysButton>div", "css", "import button on calendar")
        self.set_usa = Button(".defaultTimeZoneCountry", "css", "US in selector")
        self.holiday_check = Element("//div[contains(text(),'Veterans Day')]", "xpath", "Veteran holiday check")
        self.holiday_check_2 = Element("div#container div:nth-child(11) > div.monthDays > div:nth-child(15)", "css",
                                       "corp day 11 november")
        self.import_btn_2 = Button("div.footer div.importButton > div.components_button.import", "css", "import btn 2")
        self.close_panel = Button(".holidayListPanel .hideButton_panelContainer", "css", "close holiday list panel")
        self.holiday_name = Button("div#container div:nth-child(1) > div.nameContainer > div.nameColumn > div > "
                                   "div.nameLabel", "css", "holiday name field")
        self.holiday_list = Button(".holidayListButton", "css", "holiday list button")
        self.name_field = Button("//div[contains(text(),'Corporate Holiday')]", "xpath", "field for delete icon")
        self.delete_holiday = Button("div.list div.holidayInfo:nth-child(1) div.nameContainer > div.deleteIcon", "css",
                                     "delete")
        self.cancel_delete = Button("div.holidayInfo.deleteConfirmation:nth-child(1) div.deleteHolidayContainer > "
                                    "div.cancelDelete", "css", "cancel delete")
        self.remove_holiday = Button("div.holidayInfo.deleteConfirmation:nth-child(1) div.deleteHolidayContainer "
                                     "div.confirmDelete > div.components_button", "css", "remove holiday")
        self.emptyday_of_april_2020 = Element("//*[text()='APRIL']/..//*[text()='1']/preceding-sibling::div",
                                              "xpath", "empty day before 1st of April 2020")
        self.first_of_april = Button("//*[text()='APRIL']/..//*[text()='1']", "xpath", "1st of April on calendar")
        self.first_of_january = Button("//*[text()='JANUARY']/..//*[text()='1']", "xpath", "1st of January on calendar")
        self._25th_of_december = Button("//*[text()='DECEMBER']/..//*[text()='25']", "xpath",
                                        "25th of December on calendar")
        self.year_2020_in_selector = Button("//div[text()='2020']", "xpath", "2020 in year selector")
        self.year_2019_in_selector = Button("//div[text()='2019']", "xpath", "2019 in year selector")
        self.year_2018_in_selector = Button("//div[text()='2018']", "xpath", "2018 in year selector")
        self.holiday_pop_up_name_field = TextField('div.corporateHolidayEditor[style] input', 'css',
                                                   'name field in holiday pop-up')
        self.day_tool_tip = Element('.dayStatus', 'css', 'day tool-tip')
        self.delete_holiday_pop_up = Button('div.corporateHolidayEditor[style] .deleteIcon', 'css',
                                            'delete holiday pop-up')
        self.year_holiday_list = Element('.year', 'css', 'year on holiday list panel')
        self.first_date_holiday_list = Element('.list .holidayInfo:first-of-type .date', 'css',
                                               'first date in holiday list')
        self.first_name_holiday_list = Button('.list .holidayInfo:first-of-type .nameLabel', 'css',
                                              'first name in holiday list')
        self.first_name_field_holiday_list_button = Button('.holidayInfo .nameInput input', 'css',
                                                           'first name field in holiday list')
        self.first_name_field_holiday_list = TextField('.holidayInfo .nameInput input', 'css',
                                                       'first name field in holiday list')
        self.sorting_holiday_name = Button('.holidayName', 'css', 'sorting by holiday name')
        self.sorting_by_date = Button('.listHeader .date', 'css', 'sorting by date')
        self.first_date_delete_holiday_list = Button('.list .holidayInfo:first-of-type .deleteIcon', 'css',
                                                     'delete first date in holiday list')
        self.first_row_confirm_delete = Button('.list .holidayInfo:first-of-type .confirmDelete', 'css',
                                               'confirm delete first date in holiday list')
        self.no_holidays_panel = Element('.holidayPanelsEmptyList .title', 'css', 'empty holiday list')
        self.import_holiday_list = Button('.holidayListContainer .importButton>div', 'css',
                                          'import button on holiday list')
        self.next_year_holiday_list = Button('.incrementButton', 'css', 'next year on holiday list')
        self.warning_on_import_panel = Element('.listHeader .text', 'css', 'warning about past holidays')
        self.import_button_on_panel = Button('.footer .importButton>div', 'css', 'import button on panel')
        self.remove_all = Button('.removeAllButton', 'css', 'remove all')
        self.confirm_remove_all = Button('.submitBtn', 'css', 'confirm remove all')
        self.import_from_ical = TextField('.importLinkContainer input', 'css', 'import from iCal')
