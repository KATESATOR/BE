from features.utility.element import *


class ViewTTPage:

    def __init__(self):
        self.view_charts = Button("//span[@class='selectorLink']", "xpath", "view_charts")
        self.view_charts_days = Button("//div[@class='type'][contains(text(),'Days')]", "xpath", "view_charts_days")
        self.view_charts_customers = Button("//div[@class='type'][contains(text(),'Customers')]", "xpath",
                                            "view_charts_customers")
        self.view_charts_projects = Button("//div[@class='type'][contains(text(),'Projects')]", "xpath",
                                           "view_charts_projects")
        self.date_range_current_month = Selector(
            "//a[@id='ext-gen151']//div[contains(@class,'rangeItemTitle')][contains(text(),'Current month')]", "xpath",
            "date_range_current_month")
        self.calendar_to = Button("//span[contains(@class,'toDate')]//td[@class='date-text-td']", "xpath",
                                  "calendar_to")
        self.calendar_user = Button("//tr[@id='ext-gen27']", "xpath", "calendar_user")
        self.calendar_from = Button("tr td.x-table-layout-cell:nth-child(2)", "CSS", "calendar_from")
        self.calendar_month = Button(".x-date-middle", "CSS", "Choose month")
        self.calendar_month_march = Button("tr:nth-child(3) td.x-date-mp-month:nth-child(1) > a:nth-child(1)", "CSS",
                                           "Choose march in calendar")
        self.calendar_month_ok = Button(".x-date-mp-ok", "CSS", "Ok calendar button")
        self.calendar_day_from = Button("div.x-date-picker.x-unselectable.atap-base-date-picker.atap-date-picker "
                                        "table.x-date-inner tr:nth-child(1) td.x-date-active:nth-child(5) "
                                        "a.x-date-date em:nth-child(1) > span:nth-child(1)", "css",
                                        "calendar_day_from")
        self.calendar_day_to = Button("//a[contains(@class,'x-date-date')]//span[contains(text(),'15')]", "xpath",
                                      "calendar_day_to")
        self.calendar_today = Button("//em[contains(@class,'x-btn')]//button[contains(text(),'today')]", "xpath",
                                     "calendar_today")
        self.calendar_next = Button("//a[@title='Next Month (Control+Right)'][1]", "xpath", "calendar next")
        self.pto_check = Button("//span[@class='ptoValue']", "xpath", "pto_check")
        self.user_selector = Button("//span[@class='dashedLink']", "xpath", "user_selector")
        self.user_selector_timmers_brian = Button("//span[contains(text(),'Timmers, Brian')]", "xpath",
                                                  "user_selector_timmers_brian")
        self.user_selector_user_pto = Button("//span[contains(text(),'User for, pto test')]", "xpath",
                                             "user_selector_user_pto")
        # Filter
        self.filter = Button("//div[contains(text(),'Filters')]", "xpath", "filter")
        self.filter_cp_selector = Button("//td[@class='middle-left-cell contents']", "xpath", "filter_cp_selector")
        self.filter_cp_selector_user = Button("//span[@id='ext-gen44']", "xpath", "filter_cp_selector")
        self.filter_cp_selector_1 = Button("//label[text()='All projects of all customers (active and archived)']",
                                           "xpath",
                                           "filter_cp_selector_1")
        self.filter_cp_selector_2 = Button("//label[text()='All active projects of all active customers']", "xpath",
                                           "filter_cp_selector_2")
        self.filter_cp_selector_3 = Button("//label[text()='Selected customers and projects']", "xpath",
                                           "filter_cp_selector_3")
        self.filter_close = Button("//div[contains(@class,'close-button')]//span[text()='Close']", "xpath",
                                   "filter_close")
        self.filter_close_user = Button("//span[@id='ext-gen183']", "xpath", "filter_close_user")
        self.filter_apply = Button("//input[@id='applyFilterEdit']", "xpath", "filter_apply")
        self.filter_select_all = Button("//div[contains(@class, 'selectAllButton')]", "xpath", "filter_select_all")
        self.filter_deselect_all = Button("//div[contains(@class,'clearAllButton')]", "xpath", "filter_deselect_all")
        self.filter_keep_selected = Button("//div[contains(@class,'hideNonSelectedButton')]", "xpath",
                                           "filter_keep_selected")
        self.filter_open_arrow = Button("//div[contains(@class, 'expandAllButton')]", "xpath", "filter_open_arrow")
        self.filter_close_arrow = Button("//div[contains(@class, 'collapseAllButton')]", "xpath", "filter_close_arrow")
        self.filter_find = Button("//div[contains(@class, 'filterButton')]//a", "xpath", "filter_all_find")
        self.filter_field = TextField("//div[@class='filterUsersPopup']//*[@class='filterTable']//input[@type='text']"
                                      , "xpath", "filter_field")
        self.filter_customer_checked = CheckBox("//span[contains(@class,'ellipsisLabel')][1]", "xpath",
                                                "filter_customer_checked")
        self.filter_hide_show_customers = Button("//span[@class='label']", "xpath", "filter_show_customers")
        self.filter_reset = Button("//span[contains(text(),'reset filter')]", "xpath", "filter_reset")
        self.filter_clear = Button("//div[contains(text(),'Clear filter')]", "xpath", "filter_clear")
        self.filter_cp_selector_3_customer = CheckBox("// span[ @ title = 'Boston Chocolate']", "xpath", "filter3")
        self.filter_tt_status_approved = CheckBox("//input[@id='viewTTStatusCheckboxId_0']", "xpath",
                                                  "filter_tt_status_approved")
        self.filter_tt_status_ready_for_approval = CheckBox("//input[@id='viewTTStatusCheckboxId_1']", "xpath",
                                                            "filter_tt_status_ready_for_approval")
        self.filter_tt_status_not_ready_and_rejected = CheckBox("//input[@id='viewTTStatusCheckboxId_2']", "xpath",
                                                                "filter_tt_status_not_ready_and_rejected")
        self.filter_tt_status_not_ready_checked = Element(".notReadyLabel", "css", "Not ready checked")
        self.filter_tt_status_approved_checked = Element(".approvedLabel", "css", "Approved checked")
        self.filter_tt_status_ready_checked = Element(".readyLabel", "css", "Approved checked")
        self.filter_find_customer_checked = Button("//span[@title='Architects Bureau']", "xpath", "Customer check")
        self.ourcompany_checked = Element("*//div[contains(text(), 'Our Company')]", "xpath", "Customer check")
        self.archived_checked = Element("*//div[contains(text(), 'Mobile Phone Internet Shop')]", "xpath", "Customer "
                                                                                                           "check")
        self.filter_archived_checked = Element("//span[@title='Mobile Phone Internet Shop']", "xpath", "Customer "
                                                                                                       "check")
        self.no_tt_in_period_checked = Element("//div[@class='noDayRowsLabel']", "xpath", "No time-track check")
        # Export
        self.export_pdf = Button("//td[contains(@class,'generatePDF headerFooterCell activeButton cellWithBorder')]",
                                 "xpath", "export_pdf ")
        self.export_pdf_download = Button("//div[@id='viewTTPdfPreviewLightbox_downloadPdfBtn']//div[contains(@class,"
                                          "'buttonIcon')]", "xpath", "export_pdf_download")
        self.export_pdf_checked = Element("//div[@id='pdfPage_1']//canvas[contains(@height,'589')]", "xpath",
                                          "export_pdf__hecked")
        # Edit Task
        self.ttdetails_show_tasks = CheckBox("//div[contains(@class,'showTasksContainer')]//input[contains"
                                             "(@type,'checkbox')]", "xpath", "ttdetails_show_tasks")
        self.ttdetails_edit_task = Button("tr.taskRow.nonLast.task60.available:nth-child(3) div.subContainer "
                                          "div.iconNameContainer > div.name ",
                                          "css",
                                          "ttdetails_edit_task")
        self.ttdetails_edit_task_other = Button(
            "tr.taskRow.nonLast.task27.available:nth-child(2) td.nameColumn div.subContainer div.iconNameContainer > "
            "div.name",
            "css",
            "ttdetails_edit_task")
        self.ttdetails_edit_task_other_roy = Button("table.dayRows.display-for-print "
                                                    "tr.taskRow.task29.available:nth-child(3) td.nameColumn "
                                                    "div.subContainer div.iconNameContainer > div.name", "css",
                                                    "ttdetails_edit_task")
        self.ttdetails_edit_task_enterhours = TextField("//div[contains(@class,'estimatedTimeWrapper')]//div", "xpath",
                                                        "ttdetails_edit_task_enterhours")
        self.ttdetails_edit_task_description_again = Button("//div[@class='scrollableContainer "
                                                            "descriptionScrollableWrapper']", "xpath",
                                                            "edit_description_again")
        self.ttdetails_edit_task_description = TextField("//textarea[@placeholder='Enter task description...']",
                                                         "xpath", "edit_description")
        self.description_text_checked = Element("//div[@class='components_linkifiedText' and contains(text(), "
                                                "'testtest')]", "xpath", "Description test check")
        self.ttdetails_edit_task_close = Button("//div[@class='hideButton_panelContainer']", "xpath", "close_task")
        self.empty_space = Button("//table[@class='viewTTHeader noprint']", "xpath", "Empty")
        self.open_status_selector = Button("//div[@class='detailsRow withTypeOfWork']//div[@class='taskStatusButton "
                                           "editable']", "xpath", "Open status selector")
        self.complete_status = Button("//div[contains(@class,'grouped')]//div[contains(@class,'workflowStatus "
                                      "statusType_completed statusColor_yellow statusTypeIcon_yellow')]", "xpath",
                                      "Open status selector")
        self.complete_status_checked = Element("//div[@class='workflowStatus statusType_completed statusColor_yellow "
                                               "statusTypeIcon_yellow withPrefix showArrow']//div[@class='name']["
                                               "contains(text(),'Released')]" "xpath", "Complete status check")
        self.open_status = Button("//div[contains(@class,'grouped')]//div[contains(@class,'workflowStatus "
                                  "statusType_open statusColor_violet statusTypeIcon_violet')]//div[contains(text(),"
                                  "'In Progress')]", "xpath" "Status In Progress")
        self.ttdetails_days = Button("//span[@class='titleLabel'][contains(text(),'Days')]", "xpath", "ttdetails_days")
        self.ttdetails_cpt = Button("//span[contains(text(),'Customers, Projects and Tasks')]", "xpath",
                                    "ttdetails_cpt")
        self.ttdetails_cpt_check = Button("//div[@class='viewByCPContainer']", "xpath", "ttdetails_cpt_check")
        self.ttdetails_date_check_min = Element(
            "*//td[@class='date-text-td']//span[contains(text(),'Mar 01, 2019')]",
            "xpath", "date_check_min")
        self.ttdetails_date_check_max = Element(
            "*//td[@class='date-text-td']//span[contains(text(),'Mar 15, 2019')]",
            "xpath",
            "date_check_max")
        self.balance_as = Button("//button[contains(@class,'x-btn-text') and contains( text(),'today')]", "xpath",
                                 "balance_as")
        self.back_to_me = Button("//a[@class='backToMyTtText link']", "xpath", "back_to_me")
        self.calendar_range = Button("//td[@id='dateRangeSelectorCell']", "xpath", "calendar_range")
