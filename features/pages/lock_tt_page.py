from features.utility.element import *


class LockTTPage:

    def __init__(self):
        self.user_barber_robert = Button("//*[@title='Barber, Robert']", "xpath", "Barber, Robert user")

        self.lock_tt_button = Link("Lock Time-Track", "link text", "lock tt page")
        self.result_text = TextField("//*[@class='result-number']", "xpath", "result number")
        self.date_selector_button = Button("ext-gen32", "id", "date selector")
        self.user_selector_text = Button("ext-gen44", "id", "user selector text")
        self.user_selector_button = Button("usersSelector", "id", "user selector")
        self.all_staff_radiobutton = Button("//*[@class='x-form-cb-label'][contains(text(), 'All Staff')]",
                                            "xpath", "all staff radiobutton")
        self.selected_users_radiobutton = Button("//*[@class='x-form-cb-label'][contains(text(), 'Selected users')]",
                                                 "xpath", "selected users radiobutton")
        self.close_user_selector_button = Button("//*/span[contains(text(), 'Close')]",
                                                 "xpath", "Close users selector")
        self.clear_filter_button = Button("clearButton", "id", "Clear user filter")
        self.current_week_button = Button("//*[@class='rangeItemTitle'][contains(text(), 'Current week')]",
                                          "xpath", "Current week")
        self.task_backup_controlling = Button("//*[@class='lockTableEllipsis'][contains(text(), 'Backup controlling')]",
                                              "xpath", "task Backup controlling")
        self.date_cell = Button("//*[@class='dateCellNonWorking    ']", "xpath", "today")
        self.user_date_cell = Button("//*[contains(@class, 'userDayCell')]", "xpath", "one user day")
        self.lock_selected = Link("Lock Selected", "link text", "lock selected")
        self.unlock_selected = Link("Unlock Selected", "link text", "unlock selected")
        self.dates_till = Button("//*[contains(@class, 'runnerCell')]", "xpath", "dates till")
        self.lock_all = Button("//*[contains(text(), 'Lock all dates')]", "xpath", "lock all dates")
        self.unlock_all = Button("//*[contains(text(), 'Unlock dates after')]", "xpath", "unlock all dates")

        # Types of Work
        self.type_of_work_button = Button("//*[@class='typeOfWorkButton editable']",
                                          "xpath", "Type of work")
        self.type_programming = Button("//*[@class='typeLabel ellipsis'][contains(text(), 'programming')]",
                                       "xpath", "programming type")
        self.type_non_billable = Button("//*[@class='typeLabel ellipsis'][contains(text(), 'Non-Billable')]",
                                        "xpath", "Non-Billable type")

        # userTasksHeaderCell
        self.expand_all_button = Button("//*[@onclick='expandAllUserRows()']", "xpath", "expand all")
        self.collapse_all_button = Button("//*[@onclick='collapseAllUserRows()']", "xpath", "collapse all")
        self.sort_by_user_button = Button("//*[@data-sortby='ORDER_BY_USERNAME']", "xpath", "sort by username")
        self.sort_by_group_button = Button("//*[@data-sortby='ORDER_BY_USER_GROUP']", "xpath", "sort by group")
        self.sort_by_time_zone_button = Button("//*[@data-sortby='ORDER_BY_TIME_ZONE_GROUP']",
                                               "xpath", "sort by time zone")
