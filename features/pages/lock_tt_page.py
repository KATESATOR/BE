from features.utility.element import *


class LockTTPage:

    def __init__(self):
        self.user_white_jane = Button("//*[@title='White, Jane']", "xpath", " White, Jane user")

        self.result_text = Element("//*[@class='result-number']", "xpath", "result number")
        self.date_selector_button = Button("ext-gen32", "id", "date selector")
        self.user_selector_text = Element("ext-gen44", "id", "user selector text")
        self.user_selector_button = Button("usersSelectorLabel", "id", "user selector")
        self.all_staff_radiobutton = Button("//*[@class='x-form-cb-label'][contains(text(), 'All Staff')]",
                                            "xpath", "all staff radiobutton")
        self.selected_users_radiobutton = Button("//*[@class='x-form-cb-label'][contains(text(), 'Selected users')]",
                                                 "xpath", "selected users radiobutton")
        self.close_user_selector_button = Button("ext-comp-1021", "id", "Close users selector")
        self.clear_filter_button = Button("clearButton", "id", "Clear user filter")
        self.current_week_button = Button("//*[@class='rangeItemTitle'][contains(text(), 'Current week')]",
                                          "xpath", "Current week")
        self.cur_prev_week_button = Button("//*[@class='rangeItemTitle'][contains(text(), 'Current & previous week')]",
                                           "xpath", "Current week")
        self.task = Button("//*[@class='lockTableEllipsis'][contains(text(), 'CV review')]",
                           "xpath", "task Backup controlling")
        self.date_cell = Button("//*[@class='dateCellNonWorking    ']", "xpath", "today")
        self.user_date_cell = Button("//*[contains(@class, 'userDayCell')]", "xpath", "one user day")
        self.user_date_cell_locked = Button("//*[contains(@class, 'userDayCell')][1][contains(@class, 'Locked')]",
                                            "xpath", "locked user day")
        self.lock_selected = Link("Lock Selected", "link text", "lock selected")
        self.unlock_selected = Link("Unlock Selected", "link text", "unlock selected")
        self.dates_till = Button("//*[contains(@class, 'runnerCell')]", "xpath", "dates till")
        self.lock_all = Button("//*[contains(text(), 'Lock all dates')]", "xpath", "lock all dates")
        self.unlock_all = Button("//*[contains(text(), 'Unlock dates after')]", "xpath", "unlock all dates")
        self.lock_arrow = Button("//*[contains(@class, 'lockArrowDayoffBg')]", "xpath", "lock arrow")

        # Types of Work
        self.type_of_work_button = Button("//*[@class='typeOfWorkButton editable']",
                                          "xpath", "Type of work")
        self.type_testing = Button("//*[@class='typeLabel ellipsis'][contains(text(), 'testing')]",
                                   "xpath", "programming type")
        self.type_non_billable = Button("//*[@class='typeLabel ellipsis'][contains(text(), 'non-billable')]",
                                        "xpath", "Non-Billable type")

        # userTasksHeaderCell
        self.sort_text = Element("//*[@class='sortByCaption']", "xpath", "name of sorting")
        self.expand_all_button = Button("//*[@onclick='expandAllUserRows()']", "xpath", "expand all")
        self.collapse_all_button = Button("//*[@onclick='collapseAllUserRows()']", "xpath", "collapse all")
        self.sort_by_user_button = Button("//*[@data-sortby='ORDER_BY_USERNAME']", "xpath", "sort by username")
        self.sort_by_group_button = Button("//*[@data-sortby='ORDER_BY_USER_GROUP']", "xpath", "sort by group")
        self.sort_by_time_zone_button = Button("//*[@data-sortby='ORDER_BY_TIME_ZONE_GROUP']",
                                               "xpath", "sort by time zone")
        self.scroll_7_days_back = Button("//*[@title='7 days back']", "xpath", "7 days back")
        self.scroll_7_days_forward = Button("//*[@title='7 days forward']", "xpath", "7 days back")
