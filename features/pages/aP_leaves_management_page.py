from features.utility.element import *


class ApLeavesManagement:

    def __init__(self):
        self.leaves_management = Button(".content.corporate_schedule", "css", "leaves management tab")
        self.lt_requests_tab = Button(".customHeaderTabs a", "css", "leave time requests tab")
        self.request_10th_row = Element(".actualContent>tr:nth-of-type(10)", "css", "10th row in requests list")
        self.next_page_button = Button("a.next", "css", "next page button on requests list")
        self.next_week_button = Button("//*[@class='spanUnderlined' and text()='Next week']", "xpath",
                                       "next week button")
        self.return_to_cur_week = Button("backToCurrentWeekButton", "id", "return to current week button")
        self.user_filter = Button(".userGroupsFilterPlaceholder.filterBlock span", "css", "user filter button")
        self.selected_users = Button("*//b[text()='Show Selected Users']", "xpath", "selected users in user filter")
        self.qc_in_user_filter = CheckBox("*//label[text()='Quality Control']", "xpath",
                                          "Quality Control in user filter")
        self.apply_filter = Button("*//span[text()='Apply']", "xpath", "apply button in user filter")
        self.first_row_name_chart = Element(".firstRow .userNameCell>div", "css", "name in first row in planning chart")
        self.first_row_balance_chart = Element(".firstRow .timeTotalCell", "css",
                                               "balance in first row in planning chart")
        self.all_users = Button("*//b[text()='Show All Users']", "xpath", "all users in user filter")
        self.first_day_cell = Button(".firstRow .dayCell.weekStartDay.first", "css",
                                     "first day in future cell in first row")
        self.first_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:first-of-type", "css",
                                            "first row in pop-up menu list")
        self.second_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(2)", "css",
                                             "second element in pop-up menu list")
        self.third_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(3)", "css",
                                            "third element in pop-up menu list")
        self.fourth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(4)", "css",
                                             "fourth element in pop-up menu list")
        self.sixth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(6)", "css",
                                            "sixth element in pop-up menu list")
        self.lt_edit_menu = Button(".leaveTimeRequestDialog button", "css", "menu in leave time edit pop-up")
        self.lt_time_field = TextField("#leaveTimeRequestDialog_firstDayDuration", "css", "leave time duration field")
        self.save_lt_edit = Button(".greyButton.saveButton.noIcon", "css", "save button in leave time edit pop-up")
        self.reject_button = Button(".greyButton.rejectButton>span", "css", "reject button")
        self.user_filter_table = Button("#requestsTableContainer_userGroupFilter span", "css",
                                        "user filter in request table")
        self.first_row_name_table = Element(".actualContent>tr:first-of-type .user.name", "css",
                                            "first name in requests table")
        self.sort_users = Button("tipLTRSorting", "id", "sorting by users")
        self.sort_groups = Button("sortByUserGroupLink", "id", "sorting by departments")
        self.sort_leave_type = Button(".leaveType .sortButton", "css", "sorting by leave type")
        self.sort_status = Button(".status .sortButton", "css", "sorting by status")
        self.sort_period = Button(".period .sortButton", "css", "sorting by period")
        self.leave_type_filter = Button(".leaveTypeFilter.filterBlock span", "css", "leave type filter")
        self.selected_ltype_in_filter = Button("*//b[text()='Selected']", "xpath", "selected leave type in filter")
        self.vacation_in_filter = CheckBox("*//label[text()='Vacation']/../img", "xpath",
                                           "vacation in leave type filter")
        self.time_off_in_filter = CheckBox("*//label[text()='Time Off']/../img", "xpath",
                                           "time off in leave type filter")
        self.first_row_leave_type = Button(".actualContent>tr:first-of-type .leaveTypeName", "css",
                                           "leave type in first row")
        self.status_filter = Button(".status a", "css", "status filter in request table")
        self.first_row_status = Button(".actualContent>tr:first-of-type .statusText", "css", "status in first row")
        self.assigned_users_chkbx = CheckBox("displayOnlyAssignedToMeUsersChBox", "id", "assigned to me checkbox")
        self.all_statuses_in_filter = Button("//*[text()='All statuses']", "xpath", "all statuses in status filter")
        self.first_row_checkbox = CheckBox(".actualContent>tr:first-of-type .applicableLabel input", "css",
                                           "first row checkbox")
        self.approve_bulk = Button(".acctionButton.greyButton.approve.enabled", "css", "bulk approve button")
        self.reject_bulk = Button(".acctionButton.greyButton.reject.enabled", "css", "bulk reject button")
        self.reject_ok_button = Button("#rejectDialogDiv .greyButton.okButton", "css", "reject dialogue ok")
        self.delete_bulk = Button(".acctionButton.greyButton.delete.enabled", "css", "bulk delete button")
        self.delete_ok_button = Button("#deleteDialogDiv .greyButton.okButton", "css", "delete dialog ok button")
        self.rejected_status_filter = Button("//li/a[text()='Rejected']", "xpath", "rejected status in filter")
        self.first_row_request_date = Button(".actualContent>tr:first-of-type .dateText", "css",
                                             "request date in first row")
        self.request_duration_field = TextField("#leaveTimeRequestDialog_firstDayDuration", "css",
                                                "request duration field")
        self.save_changes = Button(".greyButton.saveButton.noIcon", "css", "save changes button")
        self.first_row_period = Element(".actualContent>tr:first-of-type .timeRequested", "css", "period in first row")
