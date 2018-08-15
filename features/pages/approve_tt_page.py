from features.utility.element import *

class ApproveTTPage:

    def __init__(self):
        self.approve_tt_tab = Button('Approve Time-Track', 'link', 'approve tt tab')
        self.user_checkbox = CheckBox('//tbody[@class="data"]/tr[2]//*[@class="selectionCell"]/input', 'xpath',
                                      'user checkbox on approve tt')
        self.approve_tt_button = Button('approveButton', 'id', 'approve tt button')
        self.reject_tt_button = Button('rejectButton', 'id', 'reject tt button')
        self.reject_tt_comment = TextField('rejectWeekCommentTextArea', 'id', 'reject tt comment field')
        self.reject_tt_pop_button = Button('//*[@class="ui-button-text" and text()[contains(., "Reject")]]', 'xpath',
                                           'reject tt button on pop-up')
        self.revoke_att = Button('//tbody[@class="data"]/tr[2]//*[@class="revokeLink"]', 'xpath', 'revoke approved tt')
        self.status_selector_button = Button('//*[@class="statusApprovalSelectorButton"]', 'xpath',
                                             'status selector button')
        self.ready_for_approval_cbx = CheckBox('readyForApprovalCbx', 'id',
                                               'ready for approval checkbox in status selector')
        self.status_selector_apply_button = Button('//*[@class="ui-button-text" and text()="Apply"]',
                                                   'xpath', 'apply status selector')
        self.user_selector_button = Button('//*[@id="approveTTUsersSelectorButton"]/table/tbody', 'xpath',
                                           'user selector button')
        self.selected_users_filter = Button('//*[text()="Selected"]', 'xpath', 'selected users in user selector')
        self.user_checkbox_in_selector = CheckBox('//*[contains(@class,"x-table-layout-cell details")]',
                                                  'xpath', 'user checkbox in user selector')
        self.apply_user_filter_button = Button('//*[contains(@id,"ext") and text()="Apply"]', 'xpath',
                                               'apply user filter button')
        self.month_selector_button = Button('monthSelectorStatusText', 'class', 'month selector button')
        self.select_month_button = Button('//*[@class="monthDiv notApproved"]/span', 'xpath', 'select month')
        self.month_selector_reset = Button('monthSelectorResetButton', 'class', 'month selector reset button')
        self.sort_by_users = Button('sortByNameLink', 'id', 'sort by users')
        self.sort_by_weeks = Button('sortByWeekLink', 'id', 'sort by weeks')
        self.history_button = Button('ttaHistoryButton', 'id', 'approve tt history button')
        self.show_more_history_button = Button('showMoreHistoryRecordsButton', 'id', 'show more records in history')
        self.collapse_all_button = Button('collapseButton', 'id', 'collapse all button')
        self.expand_all_button = Button('expandButton', 'id', 'expand all button')
        self.select_all_button = Button('selectAllButton', 'id', 'select all button')
        self.deselect_all_button = Button('deselectAllButton', 'id', 'deselect_all_button')



