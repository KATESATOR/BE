from features.utility.element import *


class ApMySchedule:

    def __init__(self):
        self.today_cell = Button('#myScheduleTable .dayCell.today', 'css', 'my schedule today cell')
        self.week_start_day_cell = Button('.firstRow .weekStartDay:not(.pastDay):not(.today)', 'css', 'week start day')
        self.today_cell_no_leave = Button('#myScheduleTable .dayCell.today.noLeave', 'css',
                                          'my schedule today no leave cell')
        self.last_day_cell = Button('#myScheduleTable .firstRow>td:last-of-type', 'css', 'my schedule last day cell')
        self.approved_last_day_cell = Button('#myScheduleTable .approved.last', 'css',
                                             'approved last day cell in my schedule')
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
        self.day_duration_field = TextField('#leaveTimeRequestDialog_firstDayDuration', 'css',
                                            'day duration field in edit pop-up')
        self.save_changes = Button('//*[text()="Save Changes"]', 'xpath', 'save changes button')
        self.next_week = Button('//*[text()="Next week"]', 'xpath', 'next week button')
        self.previous_week = Button('//*[text()="Previous week"]', 'xpath', 'previous week button')
        self.return_to_cur_week = Button('//*[text()="return to current week"]', 'xpath', 'return to current week')
        self.current_week = Element('//*[text()="(current week)"]', 'xpath', 'current week')
        self.user_selector = Button('#usersSelectorId .ellipsis', 'css', 'user selector')
        self.selected_user = Button('//*[text()="Selected users"]', 'xpath', 'selected users option in selector')
        self.meyers_in_selector = Button('//*[@class="content"]//*[text()="Meyers, Allison"]', 'xpath',
                                         'Meyers in user selector')
        self.apply_user_selector = Button('//*[text()="Apply"]', 'xpath', 'apply button in user selector')
        self.colleague_first_row = Element('.firstRow .colleagueNameContainer', 'css', 'colleague first row')
        self.requests_tab = Button('//*[text()="Requests"]', 'xpath', 'requests tab')
        self.first_row_leave_name = Button('tbody>tr.requestRow:first-of-type .leaveTypeName', 'css',
                                           'leave name in first row of table')
        self.show_past_leaves_chkbx = Button('filterPastRequestsCheckbox', 'id', 'show pask leaves checkbox')
        self.past_leave_row = Element('.pastRequest', 'css', 'past leave row')
        self.first_row_edit_period = Button('tbody>tr.requestRow:first-of-type .editButton', 'css',
                                            'edit period in first row of table')
        self.first_row_requested_time = Element('tbody>tr.requestRow:first-of-type .timeRequested', 'css',
                                                'requested time in first row of table')
        self.first_row_delete = Button('tbody>tr.requestRow:first-of-type .deleteButton', 'css',
                                       'delete button in first row of table')
        self.sorting_leave_type = Button('//*[@class="sortingLink" and text()="Leave Type"]', 'xpath',
                                         'sorting by leave type')
        self.sorting_period = Button('//*[@class="sortingLink" and text()="Period"]', 'xpath', 'sorting by Period')
        self.period_sorting_asc = Element('.periodCell.sorting_asc', 'css', 'period sorting ascending')
        self.my_profile = Button('.userProfileLink', 'css', 'my profile')
        self.profile_first_name = TextField('userProfilePopup_firstNameField', 'id', 'user first name in profile')
        self.profile_middle_name = TextField('userProfilePopup_middleNameField', 'id', 'user middle name in profile')
        self.profile_last_name = TextField('userProfilePopup_lastNameField', 'id', 'user last name in profile')
        self.profile_email = TextField('userProfilePopup_emailField', 'id', 'user email in profile')
        self.profile_username = TextField('userProfilePopup_usernameField', 'id', 'username in profile')
        self.profile_save = Button('userProfilePopup_commitBtn', 'id', 'save changes button in profile')
