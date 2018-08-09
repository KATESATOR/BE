from features.utility.element import *


class LockTTPage:

    def __init__(self):
        self.lock_tt_button = Link("Lock Time-Track", "link text", "tt_page")
        self.date_selector_button = Button("ext-gen32", "id", "date selector")
        self.current_week_button = Button("//*[@class='rangeItemTitle'][contains(text(), 'Current week')]",
                                          "xpath", "Current week")
        self.cur_and_prev_week_button = Button(
            "//*[@class='rangeItemTitle'][contains(text(), 'Current & previous weeks')]",
            "xpath", "Current & previous weeks")
        self.users_selector_button = Button("usersSelector", "id", "users selector")
        self.all_staff_button = Button("//*[@class='x-form-cb-label'][contains(text(), 'All Staff')]",
                                       "xpath", "selected users radio button")
        self.selected_users_button = Button("//*[@class='x-form-cb-label'][contains(text(), 'Selected users')]",
                                            "xpath", "selected users radio button")
        self.user_barber_robert = Button("//*[@title='Barber, Robert']", "xpath", "Barber, Robert user")
        self.close_users_selector_button = Button("//*/span[contains(text(), 'Close')]",
                                                  "xpath", "Close users selector")
        self.clear_filter_button = Button("clearButton", "id", "Clear user filter")

        self.task_name = Button("//*[@class='lockTableEllipsis'][contains(text(), 'Backup controlling')]",
                                "xpath", "task")

        self.type_of_work_button = Button("//*[@class='typeOfWorkCell']/div[2]/div",
                                          "xpath", "Type of work")
        self.type_programming = Button("//*[@class='typeOfWorkRow']/div[contains(text(), 'programming')]",
                                       "xpath", "programming type")

        self.type_non_billable = Button("//*[@class='typeOfWorkRow']/div[contains(text(), 'Non-Billable')]",
                                        "xpath", "Non-Billable type")

        self.date_cell = Button("//*[@class='dateCellNonWorking    ']", "xpath", "today")
        self.lock_selected = Link("Lock Selected", "link text", "Lock selected")
        self.unlock_selected = Link("Unlock Selected", "link text", "Unlock selected")

        # userTasksHeaderCell
        self.expand_all_button = Button("//*[@onclick='expandAllUserRows()']", "xpath", "expand all")
        self.collapse_all_button = Button("//*[@onclick='collapseAllUserRows()']", "xpath", "collapse all")
        self.sort_by_user_button = Button("//*[@data-sortby='ORDER_BY_USERNAME']", "xpath", "sort by username")
        self.sort_by_group_button = Button("//*[@data-sortby='ORDER_BY_USER_GROUP']", "xpath", "sort by group")
        self.sort_by_time_zone_button = Button("//*[@data-sortby='ORDER_BY_TIME_ZONE_GROUP']",
                                               "xpath", "sort by time zone")
