from features.utility.element import *


class ViewTTPage:

    def __init__(self):
        self.view_tt = Button ("//a[@href='/cur/user/view_tt.do']", "xpath", "viewtt_button")
        self.view_charts = Button ("//span[@class='selectorLink']", "xpath", "view_charts")
        self.view_charts_days = Button ("//div[@class='type'][contains(text(),'Days')]", "xpath", "view_charts_days")
        self.view_charts_customers = Button ("//div[@class='type'][contains(text(),'Customers')]", "xpath",
                                             "view_charts_customers")
        self.view_charts_projects = Button ("//div[@class='type'][contains(text(),'Projects')]", "xpath",
                                            "view_charts_projects")
        self.view_charts_check = Button ("//div[contains(@class,'viewTTChartSection')]","xpath","charts_check")
        self.date_range_current_month = Selector (
            "//a[@id='ext-gen151']//div[contains(@class,'rangeItemTitle')][contains(text(),'Current month')]", "xpath",
            "date_range_current_month")
        self.calendar_to = Button("//span[contains(@class,'toDate')]//td[@class='date-text-td']", "xpath", "calendar_to")

        self.calendar_user = Button ("//tr[@id='ext-gen27']", "xpath", "calendar_user")
        self.calendar_from = Button("tr td.x-table-layout-cell:nth-child(2)","CSS", "calendar_from")
        self.calendar_day_from = Button("//a[contains(@class,'x-date-date')]//span[contains(text(),'10')]", "xpath", "calendar_day_from")
        self.calendar_day_to = Button("//a[contains(@class,'x-date-date')]//span[contains(text(),'15')]", "xpath", "calendar_day_to")
        self.calendar_today = Button("//em[contains(@class,'x-btn')]//button[contains(text(),'today')]", "xpath", "calendar_today")
        self.calendar_next = Button("//a[@title='Next Month (Control+Right)'][1]", "xpath", "calendar next")
        self.pto_check = Button ("//span[@class='ptoValue']", "xpath", "pto_check")
        self.user_selector = Button ("//span[@class='dashedLink']", "xpath", "user_selector")
        self.user_selector_user = Button ("//span[contains(text(),'Timmers, Brian')]", "xpath", "user_selector_user")
        self.user_selector_user_pto = Button("//span[contains(text(),'User for, pto test')]", "xpath", "user_selector_user_pto")
        self.filter = Button ("//span[@class='dropDownIcon']", "xpath", "filter")
        self.filter_cp_selector = Button ("//td[@class='middle-left-cell contents']", "xpath", "filter_cp_selector")
        self.filter_cp_selector_user = Button ("//span[@id='ext-gen44']", "xpath", "filter_cp_selector")
        self.filter_cp_selector_1 = Button ("//label[text()='All projects of all customers (active and archived)']",
                                            "xpath",
                                            "filter_cp_selector_1")
        self.filter_cp_selector_2 = Button ("//label[text()='All active projects of all active customers']", "xpath",
                                            "filter_cp_selector_2")
        self.filter_cp_selector_3 = Button ("//label[text()='Selected customers and projects']", "xpath",
                                            "filter_cp_selector_3")
        self.filter_close = Button ("//div[contains(@class,'close-button')]//span[text()='Close']", "xpath",
                                    "filter_close")
        self.filter_close_user = Button ("//span[@id='ext-gen183']", "xpath", "filter_close_user")
        self.filter_apply = Button ("//input[@id='applyFilterEdit']", "xpath", "filter_apply")
        self.filter_select_all = Button ("//div[contains(@class, 'selectAllButton')]", "xpath", "filter_select_all")
        self.filter_deselect_all = Button ("//div[contains(@class,'clearAllButton')]", "xpath", "filter_deselect_all")
        self.filter_keep_selected = Button ("//div[contains(@class,'hideNonSelectedButton')]", "xpath",
                                            "filter_keep_selected")
        self.filter_open_arrow = Button ("//div[contains(@class, 'expandAllButton')]", "xpath", "filter_open_arrow")
        self.filter_close_arrow = Button ("//div[contains(@class, 'collapseAllButton')]", "xpath", "filter_close_arrow")
        self.filter_find = Button ("//div[contains(@class, 'filterButton')]//a", "xpath", "filter_all_find")
        self.filter_field = TextField ("//div[@class='filterUsersPopup']//*[@class='filterTable']//input[@type='text']"
                                       , "xpath", "filter_field")
        self.filter_customer_checked = CheckBox ("//span[contains(@class,'ellipsisLabel')][1]", "xpath",
                                                 "filter_customer_checked")
        self.filter_hide_show_customers = Button ("//span[@class='label']", "xpath", "filter_show_customers")
        self.filter_reset = Button ("//span[contains(text(),'reset filter')]", "xpath", "filter_reset")
        self.filter_clear = Button ("//div[contains(text(),'Clear filter')]", "xpath", "filter_clear")
        self.filter_cp_selector_3_customer = CheckBox ("// span[ @ title = 'Architects Bureau']", "xpath", "filter3")
        self.filter_tt_status_approved = CheckBox ("//input[@id='viewTTStatusCheckboxId_0']", "xpath",
                                                   "filter_tt_status_approved")
        self.filter_tt_status_ready_for_approval = CheckBox ("//input[@id='viewTTStatusCheckboxId_1']", "xpath",
                                                             "filter_tt_status_ready_for_approval")
        self.filter_tt_status_not_ready_and_rejected = CheckBox ("//input[@id='viewTTStatusCheckboxId_2']", "xpath",
                                                                 "filter_tt_status_not_ready_and_rejected")
        self.export_pdf = Button ("//td[contains(@class,'generatePDF headerFooterCell activeButton cellWithBorder')]",
                                  "xpath", "export_pdf ")
        self.export_pdf_download = Button ("//div[@id='viewTTPdfPreviewLightbox_downloadPdfBtn']//div[contains(@class,"
                                           "'buttonIcon')]", "xpath", "export_pdf_download")
        self.export_pdf_checked = Element ("//div[@id='pdfPage_1']//canvas[contains(@height,'589')]", "xpath",
                                           "export_pdf__hecked")

        self.ttdetails_show_tasks = CheckBox ("//div[contains(@class,'showTasksContainer')]//input[contains"
                                              "(@type,'checkbox')]", "xpath", "ttdetails_show_tasks")
        self.ttdetails_edit_task = Button("//div[@id='viewTTDetailsTableContainer']//tbody//tr[2]//td[1]",
                                          "xpath",
                                          "ttdetails_edit_task")
        self.ttdetails_edit_task_enterhours = TextField ("//div[contains(@class,'estimatedTimeWrapper')]//div", "xpath",
                                                         "ttdetails_edit_task_enterhours")
        self.ttdetails_edit_task_description = TextField ("//textarea[contains(@placeholder,'Enter task description...'"
                                                          ")]", "xpath", "edit_description")
        self.ttdetails_edit_task_close = Button ("//div[@class='hideButton_panelContainer']", "xpath", "close_task")
        self.ttdetails_days = Button ("//span[@class='titleLabel'][contains(text(),'Days')]", "xpath", "ttdetails_days")
        self.ttdetails_cpt = Button ("//span[contains(text(),'Customers, Projects and Tasks')]", "xpath",
                                     "ttdetails_cpt")
        self.ttdetails_cpt_check = Button ("//div[@class='viewByCPContainer']", "xpath", "ttdetails_cpt_check")
        self.ttdetails_date_check_min = Button ("//div[@id='viewTTDetailsTableContainer']//tbody//tr[1]","xpath","date_check_min")
        self.ttdetails_date_check_max = Button("//div[@id='viewTTDetailsTableContainer']//tbody//tr[6]", "xpath",
                                           "date_check_max")
        self.balance_as = Button ("//button[contains(@class,'x-btn-text') and contains( text(),'today')]", "xpath", "balance_as")
        self.back_to_me = Button ("//a[@class='backToMyTtText link']", "xpath", "back_to_me")
        self.calendar_range = Button ("//td[@id='dateRangeSelectorCell']","xpath","calendar_range")

