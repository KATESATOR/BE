from features.utility.element import *


class ApproveTTPage:

    def __init__(self):
        self.user_checkbox = CheckBox('.data:nth-child(4)>tr:nth-of-type(2) input', 'css',
                                      'user checkbox on approve tt')
        self.approve_tt_button = Button('approveButton', 'id', 'approve tt button')
        self.reject_tt_button = Button('rejectButton', 'id', 'reject tt button')
        self.reject_tt_comment = TextField('rejectWeekCommentTextArea', 'id', 'reject tt comment field')
        self.reject_tt_pop_button = Button('//*[@class="ui-button-text" and text()[contains(., "Reject")]]', 'xpath',
                                           'reject tt button on pop-up')
        self.revoke_approved = Button('tr.childRow.operationWasApplied.approved a.revokeLink', 'css',
                                      'revoke approved tt')
        self.revoke_rejected = Button('tr.childRow.operationWasApplied.rejected a.revokeLink', 'css',
                                      'revoke approved tt')
        self.status_selector = Button('.statusApprovalSelectorButtonTitle', 'css', 'status selector')
        self.ready_for_approval_cbx = CheckBox('readyForApprovalCbx', 'id',
                                               'ready for approval checkbox in status selector')
        self.not_ready_for_approval_cbx = CheckBox('notReadyForApprovalCbx', 'id',
                                                   'not ready for approval checkbox in status selector')
        self.rejected_cbx = CheckBox('rejectedCbx', 'id', 'rejected checkbox in status selector')
        self.status_selector_apply_button = Button('//*[@class="ui-button-text" and text()="Apply"]',
                                                   'xpath', 'apply status selector')
        self.user_selector = Button('.usersSelectorCell span', 'css', 'user selector')
        self.selected_users_filter = Button('//*[text()="Selected"]', 'xpath', 'selected users in user selector')
        self.all_users_filter = Button('*//ul//*[text()="All users"]', 'xpath', 'all users in user selector')
        self.moss_checkbox_in_selector = CheckBox('//*[@class="ellipsisLabel" and text()="Moss, Bruno"]',
                                                  'xpath', 'user Moss Bruno checkbox in user selector')
        self.development_in_selector = CheckBox('//*[@class="ellipsisLabel" and text()="Development"]', 'xpath',
                                                'Development checkbox in user selector')
        self.apply_user_filter_button = Button('//*[contains(@id,"ext") and text()="Apply"]', 'xpath',
                                               'apply user filter button')
        self.moss_att_record = TextField('//*[@id="approveTTTable"]//*/a[@href and text()[contains(., "Moss")]]',
                                         'xpath', 'Moss Bruno att record')
        self.venson_att_record = TextField('//*[@id="approveTTTable"]//*/a[@href and text()[contains(., "Venson")]]',
                                           'xpath', 'Venson Ronald att record')
        self.month_selector_button = Button('monthSelectorStatusText', 'class', 'month selector button')
        self.mar_month_button = Button('//*[@class="monthDiv notApproved"]/span[text()="Mar"]', 'xpath',
                                       'March in select month')
        self.month_selector_reset = Button('monthSelectorResetButton', 'class', 'month selector reset button')
        self.sort_by_users = Button('sortByNameLink', 'id', 'sort by users')
        self.sort_by_weeks = Button('sortByWeekLink', 'id', 'sort by weeks')
        self.one_user_group = Button('//*[@class="groupingRowTitleCell"]/div/div[@class="userNameInfo"]', "xpath",
                                     "one user group of records")
        self.history_button = Button('ttaHistoryButton', 'id', 'approve tt history button')
        self.show_more_history_button = Button('showMoreHistoryRecordsButton', 'id', 'show more records in history')
        self.collapse_all_button = Button('collapseButton', 'id', 'collapse all button')
        self.expand_all_button = Button('expandButton', 'id', 'expand all button')
        self.select_all_button = Button('selectAllButton', 'id', 'select all button')
        self.deselect_all_button = Button('deselectAllButton', 'id', 'deselect_all_button')
        self.first_row_tt_status = TextField('tbody:nth-of-type(2) tr:nth-of-type(2) td.statusCell span', 'css',
                                             'time track status in first row')
        self.first_row_date_link = Button('tbody:nth-of-type(2) tr:nth-of-type(2) .submitTTLinkCell a', 'css',
                                          'first row date link')
        self.last_row_tt_status = TextField('tbody:nth-of-type(2) tr:last-of-type td.statusCell span', 'css',
                                            'time track status in last row')
        self.first_row_username = Element('tbody:nth-of-type(2) .userNameInfo', 'css', 'first row username')
        self.first_row_week = Element('tbody:nth-of-type(2) .groupingRowTitleCell', 'css', 'first row week')
        self.first_row_search_result = Element('tbody:nth-of-type(2) .userNameInfo span', 'css',
                                               'first row search result')
        self.first_row_collapse = Button('tbody:nth-of-type(2) .collapseIcon', 'css', 'first row collapse button')
        self.user_search_field = TextField('.filterFieldInput', 'css', 'user search field')
        self.clear_search_button = Button('.clearFilterButton', 'css', 'clear search button')
        self.empty_data_row = Element('.data .noRecordsRow', 'css', 'no record row')
        self.first_row_common_chkbx = CheckBox('tbody:nth-of-type(2) .groupingRow input', 'css',
                                               'first row common checkbox')
        self.first_row_common_revoke = Button('.groupingRow.operationWasApplied .revokeLink', 'css',
                                              'first row common revoke')
        self.last_row_history_date = Element('.ttaHistoryRow.lastRow .dateCell', 'css', 'last row history date')
        self.last_row_history_comment = Element('.ttaHistoryRow.lastRow .commentText', 'css',
                                                'last row history comment')
