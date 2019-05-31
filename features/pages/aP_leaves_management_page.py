from features.utility.element import *


class ApLeavesManagement:

    def __init__(self):
        self.leaves_management = Button(".content.corporate_schedule", "css", "leaves management tab")
        self.sort_users_chart = Button('sortByUserButton', 'id', 'sorting by users in chart')
        self.lt_requests_tab = Button(".customHeaderTabs a", "css", "leave time requests tab")
        self.request_10th_row = Element(".actualContent>tr:nth-of-type(10)", "css", "10th row in requests list")
        self.next_page_button = Button("a.next", "css", "next page button on requests list")
        self.previous_page_button = Button("a.prev", "css", "previous page button on requests list")
        self.selected_page = Element('span.page', 'css', 'selected page on request list')
        self.page_selector = Button('recordsPerPageSelector', 'id', 'page selector')
        self.twenty_fifth_row = Element('.actualContent>tr:nth-of-type(25)', 'css', '25th row in request table')
        self.twelfth_row = Element('.actualContent>tr:nth-of-type(12)', 'css', '12th row in request table')
        self.second_option_page_selector = Button('#recordsPerPageSelector>option:nth-of-type(2)', 'css',
                                                  '25 in page selector')
        self.first_option_page_selector = Button('#recordsPerPageSelector>option:first-of-type', 'css',
                                                 '10 in page selector')
        self.next_week_button = Button("//*[@class='spanUnderlined' and text()='Next week']", "xpath",
                                       "next week button")
        self.previous_week_button = Button("//*[@class='spanUnderlined' and text()='Previous week']", "xpath",
                                           "previous week button")
        self.return_to_cur_week = Button("backToCurrentWeekButton", "id", "return to current week button")
        self.date_selector = Button('fromDateSelector', 'id', 'date selector in leave time chart')
        self.first_week_date_selector = Button('.x-date-inner>tbody>tr:first-of-type>td', 'css',
                                               'first week date selector')
        self.current_week_date_selector = Button('.x-date-bottom a', 'css', 'current week in date selector')
        self.user_filter = Button(".userGroupsFilterPlaceholder.filterBlock span", "css", "user filter button")
        self.selected_users = Button("*//b[text()='Show Selected Users']", "xpath", "selected users in user filter")
        self.design_in_user_filter = CheckBox("*//label[text()='Design']", "xpath", "Design department in user filter")
        self.wo_dept_in_user_filter = CheckBox("*//label[text()='Users Without Department']", "xpath",
                                               "Users Without Department in user filter")
        self.administration_in_user_filter = CheckBox("*//label[text()='Administration']", "xpath",
                                                      "Administration department in user filter")
        self.apply_filter = Button("*//span[text()='Apply']", "xpath", "apply button in user filter")
        self.first_row_name_chart = Element(".firstRow .userNameCell>div", "css", "name in first row in planning chart")
        self.first_row_planned_lt = Element(".firstRow .timeTotalCell", "css",
                                            "planned leave time in first row in chart")
        self.all_users = Button("*//b[text()='Show All Users']", "xpath", "all users in user filter")
        self.week_start_day_cell = Button(".firstRow .weekStartDay:not(.pastDay):not(.today)",
                                          "css", "week start day cell in first row")
        self.week_start_day_cell_leave = Button(".firstRow .weekStartDay:not(.pastDay):not(.today):not(.noLeave)",
                                                "css", "week start day cell in first row with leave")
        self.week_start_day_cell_no_leave = Button('.firstRow .weekStartDay.noLeave:not(.pastDay):not(.today)', 'css',
                                                   'week start day cell in first row with no leave')
        self.week_second_day_cell_no_leave = Button('.firstRow .weekStartDay.noLeave:not(.pastDay):not(.today)+td',
                                                    'css', 'week start day cell in first row with no leave')
        self.week_third_user_day_cell_no_leave = Button('table#leaveTimePlanningTable tr:nth-child(6) > td:nth-child('
                                                        '12)', 'css', "third user leave")
        self.today_cell = Button('.firstRow .dayCell.today', 'css', 'today cell in first row')
        self.first_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:first-of-type", "css",
                                            "first row in pop-up menu list")
        self.second_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(2)", "css",
                                             "second element in pop-up menu list")
        self.third_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(3)", "css",
                                            "third element in pop-up menu list")
        self.fourth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(4)", "css",
                                             "fourth element in pop-up menu list")
        self.fifth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(5)", "css",
                                            "fifth element in pop-up menu list")
        self.sixth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(6)", "css",
                                            "sixth element in pop-up menu list")
        self.seventh_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(7)", "css",
                                              "seventh element in pop-up menu list")
        self.ninth_element_in_menu = Button("div:last-of-type>ul.x-menu-list>li:nth-of-type(9)", "css",
                                            "9th element in pop-up menu list")
        self.submit_request_button = Button('//*[text()="Submit Request"]', 'xpath', 'submit request button')
        self.lt_edit_menu = Button(".leaveTimeRequestDialog button", "css", "menu in leave time edit pop-up")
        self.lt_time_field = TextField("#leaveTimeRequestDialog_firstDayDuration", "css", "leave time duration field")
        self.lt_comment_field = TextField('leaveTimeRequestDialog_userComment', 'id', 'lt dialog comment field')
        self.save_lt_edit = Button(".greyButton.saveButton.noIcon", "css", "save button in leave time edit pop-up")
        self.reject_button = Button(".greyButton.rejectButton>span", "css", "reject button")
        self.search_field_chart = TextField('employeesSearchField', 'id', 'search field in chart')
        self.clear_search = Button('.filterIcon', 'css', 'clear search field')
        self.search_result_chart = Element('.firstRow .userNameCell>div .highlightToken', 'css', 'first search result')
        # Leave Time Requests tab
        self.no_leave_time_row = Element('.actualContent .emptyRequest td', 'css', 'empty row in table')
        self.first_group_in_table = Element('.request.firstInGroup .user.group', 'css', 'first group in table')
        self.user_filter_table = Button("#requestsTableContainer_userGroupFilter span", "css",
                                        "user filter in request table")
        self.first_row_name_table = Element(".actualContent>tr:first-of-type .user.name", "css",
                                            "first name in requests table")
        self.past_leaves_chkbx = CheckBox('showPastApprovedRejectedRequestsChBox', 'id', 'past leaves checkbox')
        self.past_request = Element('.request.pastRequest', 'css', 'past request row')
        self.request_comment_button = Button('.requestCommentButton', 'css', 'request comment button')
        self.request_comment = Element('commentDialogDiv', 'id', 'request comment')
        self.sort_users = Button("tipLTRSorting", "id", "sorting by users")
        self.sort_groups = Button("sortByUserGroupLink", "id", "sorting by departments")
        self.sort_by_time_zone = Button('sortByTimeZoneGroupLink', 'id', 'sorting by time zone')
        self.sort_leave_type = Button(".leaveType span", "css", "sorting by leave type")
        self.sort_status = Button(".status>span", "css", "sorting by status")
        self.sort_period = Button(".period>span", "css", "sorting by period")
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
        self.all_statuses_in_filter = Button("//li//*[text()='All statuses']", "xpath", "all statuses in status filter")
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
        self.balances_filter = Button('.balanceTypeFilterBlock a', 'css', 'balances filter in table')
        self.common_chkbx = CheckBox('.select .spacer+label input', 'css', 'select all checkbox in table')
        self.search_field_table = TextField('requestsTableContainer_userNameFilter', 'id', 'search field in table')
        self.search_result_table = Element('.actualContent>tr:first-of-type .user.name .highlightToken', 'css',
                                           'first search result in table')