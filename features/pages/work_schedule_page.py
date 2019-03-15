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
