from features.utility.element import *


class ApMySchedule:

    def __init__(self):
        self.calendar = Button('.calendarPlaceholder em>button', 'css', 'balances calendar')
        self.month_in_calendar = Button('.x-date-middle button', 'css', 'month in calendar')
        self.March_in_calendar = Button('.x-date-mp tbody>tr:nth-of-type(3)>td:first-of-type a', 'css',
                                        'March in calendar')
        self.april_in_calendar = Button('.x-date-mp tbody>tr:nth-of-type(4)>td:first-of-type a', 'css',
                                        'April in calendar')
        self.calendar_ok_button = Button('.x-date-mp-ok', 'css', 'calendar ok button')
        self.first_date_calendar = Button('*//td[@class="x-date-active"]/*//span[text()="1"]', 'xpath',
                                          'first day in calendar')
        self.date_calendar = Button('*//td[@class="x-date-active"]/*//span[text()="30"]', 'xpath',
                                    '30 day in calendar')
        self.calendar_today = Button('.x-date-at-today-cell', 'css', 'calendar today button')
        self.pto_value = Element('.ptoValue', 'css', 'PTO balance value')
        self.sick_value = Element('.sickValue', 'css', 'SD balance value')
        self.today_cell = Button('#myScheduleTable .dayCell.today', 'css', 'my schedule today cell')
        self.week_start_day_cell = Button('.firstRow .weekStartDay:not(.pastDay):not(.today)', 'css', 'week start day')
        self.week_start_day_no_leave = Button('.firstRow .weekStartDay.noLeave:not(.pastDay):not(.today)', 'css',
                                              'week start day no leave')
        self.today_cell_no_leave = Button('#myScheduleTable .dayCell.today.noLeave', 'css',
                                          'my schedule today no leave cell')
        self.no_leave_cell = Button('.firstRow .noLeave:not(.pastDay)', 'css', 'day cell without leave')
        self.last_day_cell = Button('#myScheduleTable .firstRow>td:last-of-type', 'css', 'my schedule last day cell')
        self.leave_last_day_cell = Button('#myScheduleTable .fullLeave.last', 'css',
                                          'leave in last day cell in my schedule')
        self.today_cell_full_leave = Button('#myScheduleTable .dayCell.today.fullLeave', 'css',
                                            'my schedule today full leave cell')
        self.today_cell_leavetype3_halfday = Button('#myScheduleTable .dayCell.today.leaveType3.fiftyPercentLeave',
                                                    'css', 'my schedule today cell leave type3 half day')
        self.submit_request = Button('//*[text()="Submit Request"]', 'xpath', 'submit request button')
        self.edit_request = Button('body>div.leaveRequestContextMenu:last-of-type .editContextButton', 'css',
                                   'edit request in context menu')
        self.delete_request = Button('body>div.leaveRequestContextMenu:last-of-type .deleteContextButton', 'css',
                                     'delete request in context menu')
        self.leave_type_selector = Button('#leaveTimeRequestDialog_leaveTypeSelector button', 'css',
                                          'leave type selector in edit pop-up')
        self.third_leave_type = Button('.leave-type-selector-menu:last-of-type>ul>li:nth-of-type(3)', 'css',
                                       'third leave type in selector')
        self.sixth_leave_type = Button('.leave-type-selector-menu:last-of-type>ul>li:nth-of-type(6)', 'css',
                                       'sixth leave type in selector')
        self.last_leave_type = Button('.leave-type-selector-menu:last-of-type>ul>li:last-of-type', 'css',
                                      'last leave type in selector')
        self.day_duration_field = TextField('#leaveTimeRequestDialog_firstDayDuration', 'css',
                                            'day duration field in edit pop-up')
        self.save_changes = Button('//*[text()="Save Changes"]', 'xpath', 'save changes button')
        self.next_week = Button('//*[text()="Next week"]', 'xpath', 'next week button')
        self.previous_week = Button('//*[text()="Previous week"]', 'xpath', 'previous week button')
        self.return_to_cur_week = Button('//*[text()="return to current week"]', 'xpath', 'return to current week')
        self.current_week = Element('//*[text()="(current week)"]', 'xpath', 'current week')
        self.date_selector = Button('fromDateSelector', 'id', 'date selector in leave time chart')
        self.first_week_date_selector = Button('.x-date-inner>tbody>tr:first-of-type>td', 'css',
                                               'first week date selector')
        self.current_week_date_selector = Button('.x-date-bottom a', 'css', 'current week in date selector')
        self.user_selector = Button('#usersSelectorId .ellipsis', 'css', 'user selector')
        self.users_search_field = TextField('colleaguesSearchField', 'id', 'search users field')
        self.selected_users = Button('//*[text()="Selected users"]', 'xpath', 'selected users option in selector')
        self.all_users = Button('//*[text()="All users"]', 'xpath', 'all users option in selector')
        self.stivers_in_selector = Button('//*[@class="content"]//*[text()="Stivers, Melanie"]', 'xpath',
                                          'Stivers in user selector')
        self.design_in_selector = Button('//*[@class="content"]//*[text()="Design"]', 'xpath',
                                         'Design in user selector')
        self.entertt_in_selector = Button("//span[@title='Enter TT, Role']", 'xpath', 'Enter TT Role in user selector')
        self.users_wo_department_in_selector = Button('//*[@class="content"]//*[text()="Users Without Department"]',
                                                      'xpath', 'Users Without Department in user selector')
        self.apply_user_selector = Button('//*[text()="Apply"]', 'xpath', 'apply button in user selector')
        self.colleague_first_row = Element('.firstRow .colleagueNameContainer', 'css', 'colleague first row')
        self.colleague_last_row = Element("//div[contains(text(),'Modify & Approve TT, Role')]", 'xpath', 'colleague '
                                                                                                          'last row')
        self.search_result_first_row = Element('.firstRow .colleagueNameContainer span', 'css',
                                               'colleague search result first row')
        self.clear_search = Button('.searchFieldWrap .filterIcon', 'css', 'clear search field button')
        self.requests_tab = Button('//*[text()="Requests"]', 'xpath', 'requests tab')
        self.comment_field = TextField('.leaveRequestUserComment', 'css', 'comment field')
        self.leave_comment = Element('.leaveTypeInfo .comment', 'css', 'leave time comment')
        self.first_row_sd_balance = Element('tr.requestRow:first-of-type .sickSpan', 'css',
                                            'sick days balance in first row')
        self.empty_data_row = Element('.dataTables_empty', 'css', 'empty row request table')
        self.first_row_leave_name = Button('tbody>tr.requestRow:first-of-type .leaveTypeName', 'css',
                                           'leave name in first row of table')
        self.show_past_leaves_chkbx = Button('filterPastRequestsCheckbox', 'id', 'show past leaves checkbox')
        self.past_leave_row = Element('.pastRequest', 'css', 'past leave row')
        self.first_row_edit_period = Button('tbody>tr.requestRow:first-of-type .editButton', 'css',
                                            'edit period in first row of table')
        self.first_row_requested_time = Element('tbody>tr.requestRow:first-of-type .timeRequested', 'css',
                                                'requested time in first row of table')
        self.first_row_balance_after = Element('tr.requestRow:first-of-type .after', 'css',
                                               'balance after request in first row')
        self.first_row_delete = Button('tbody>tr.requestRow:first-of-type .deleteButton', 'css',
                                       'delete button in first row of table')
        self.sorting_leave_type = Button('//*[@class="sortingLink" and text()="Leave Type"]', 'xpath',
                                         'sorting by leave type')
        self.sorting_period = Button('//*[@class="sortingLink" and text()="Period"]', 'xpath', 'sorting by Period')
        self.sorting_status = Button('//*[@class="sortingLink" and text()="Status"]', 'xpath', 'sorting by status')
        self.period_sorting_asc = Element('.periodCell.sorting_asc', 'css', 'period sorting ascending')
        self.status_sorting_asc = Element('.statusCell.sorting_asc', 'css', 'status sorting ascending')
        self.balances_filter = Button('.balanceTypeFilterBlock a', 'css', 'balances filter')
        self.sick_days_balances_filter = Button('.x-menu-list>li:last-of-type', 'css', 'sick days in balances filter')
        self.pto_balances_filter = Button('.x-menu-list>li:nth-of-type(2)', 'css', 'pto in balances filter')
        self.all_balances_filter = Button('.x-menu-list>li:first-of-type', 'css', 'all balances in balances filter')
        self.my_profile = Button('.userProfileLink', 'css', 'my profile')
        self.profile_first_name = TextField('userProfilePopup_firstNameField', 'id', 'user first name in profile')
        self.profile_middle_name = TextField('userProfilePopup_middleNameField', 'id', 'user middle name in profile')
        self.profile_last_name = TextField('userProfilePopup_lastNameField', 'id', 'user last name in profile')
        self.profile_email = TextField('userProfilePopup_emailField', 'id', 'user email in profile')
        self.profile_username = TextField('userProfilePopup_usernameField', 'id', 'username in profile')
        self.profile_save = Button('userProfilePopup_commitBtn', 'id', 'save changes button in profile')
