from features.utility.element import *


# TODO: Придумать новые названия для локаторовк которые подходят к чартам и репортам
class ReportsPage:
    def __init__(self):
        self.reports_dashboard = Link("Reports Dashboard", "link text", "reports page")
        self.create_chart_button = Button("createChartButton", "id", "create chart button")
        self.new_report_button = Button("createReportButton", "id", "new report button")
        self.add_to_dashboard_button = Button("//*[@class='addToDashboard']", "xpath", "add to dashboard button")
        self.report_name_text_field = TextField("//*[@class='reportNameEdit inputFieldWithPlaceholder']", "xpath",
                                                "report name text field")
        self.save_report_name_button = Button("//*[@class='saveNewConfigButton greyButton']", "xpath",
                                              "save report name text field")
        self.save_report_changes_button = Button("//*[@class='saveCurrentConfigButton greyButton']", "xpath",
                                                 "open save menu button")
        self.save_changes_button = Button("//*[@class='ui-button-text'][contains(text(), 'Save')]", "xpath",
                                          "save changes button")
        self.report_name = Button("div.reportName", "css", "report name")
        self.edit_configuration_button = Button("//*[contains(text(), 'Edit Configuration')]", "xpath",
                                                "edit configuration button")

        # Charts
        self.month_selector_from = Button("ext-gen60", "id", "month selector date from")
        self.month_selector_from_calendar = Button('.fromDate .date-text', 'css', 'month selector date from calendar')
        self.month_selector_calendar = Button('.x-date-middle .x-btn-text', 'css', 'month selector in calendar')
        self.Jan_in_calendar = Button('.x-date-mp tr:first-of-type .x-date-mp-month:first-of-type', 'css',
                                      'Jan in calendar')
        self.calendar_month_ok = Button('.x-date-mp-ok', 'css', 'ok button in month calendar')
        self.calendar_ok_button = Button('.x-date-at-ok-cancel-cell em:first-child', 'css', 'calendar ok button')
        self.previous_month = Button("//*[@class='rangeItemTitle'][contains(text(), 'Previous month')]", "xpath",
                                     "previous month")
        self.show_selector_button = Button("createChartLightbox_chartTypeListSelectorPlaceholder", "id",
                                           "open 'Show' selector")
        self.by_selector_button = Button("createChartLightbox_groupingLevelListSelectorPlaceholder", "id",
                                         "open 'By' selector")
        self.include_other_users_data = Button("input.checkbox.checkboxInput", "css",
                                               "include data of not assigned users checkbox")
        self.export_chart_button = Button("createChartLightbox_commitBtn", "id", "export to pdf chart")
        self.download_chart_button = Button("createChartLightbox_downloadPdfBtn", "id", "download to pdf chart")
        self.download_chart = Button("#createChartLightbox_downloadPdfBtn", "css", "download to pdf chart")
        self.close_chart_button = Button("closeCreateChartLightboxButton", "id", "close chart button")
        self.cost_of_work_chart_in_selector = Button('Cost of work', 'link', 'cost of work in chart selector')
        self.billable_amounts_chart_in_selector = Button('Billable amounts', 'link',
                                                         'billable amounts in chart selector')
        self.leave_hours_chart_in_selector = Button('Leave hours', 'link', 'Leave hours in chart selector')
        self.pto_balance_chart_in_selector = Button('PTO Balance', 'link', 'PTO Balance in chart selector')
        self.sick_days_balance_chart_in_selector = Button('Sick Days Balance', 'link',
                                                          'Sick Days Balance in chart selector')
        self.overtime_hours_chart_in_selector = Button('Overtime hours', 'link', 'Overtime hours in chart selector')

        # Choose Report to Create Window
        self.choose_report_window = Button("createReportLightBox", "id", "choose report to create window")
        self.configure_report_button = Button("//*[@class='configureButton components_button']", "xpath",
                                              "configure report parameters button")

        # Time Reports Button's
        self.staff_performance_button = Button("//*[@class='timeReports']//div[contains(text(), 'Staff Performance')]",
                                               "xpath", "staff performance button")
        self.time_balance_button = Button("//*[@class='timeReports']//div[contains(text(), 'Time Balance')]",
                                          "xpath", "time balance button")
        self.leave_time_balance_button = Button("//*[@class='timeReports']//div[contains(text(), "
                                                "'Leave Time & Balances')]", "xpath", "leave time balance button")
        self.time_track_detail_button = Button("//*[@class='timeReports']//div[contains(text(), "
                                               "'Time-Track In Detail')]", "xpath", "tt in detail button")
        self.estimated_button = Button("//*[@class='timeReports']//div[contains(text(), 'Estimated vs. Actual Time')]",
                                       "xpath", "estimated vs. actual button")
        # Cost & Billing Reports
        self.billing_summary_button = Button("//*[@class='billingReports']//div[contains(text(), 'Billing Summary')]",
                                             "xpath", "billing summary button")
        self.invoice_export_button = Button("//*[@class='billingReports']//div[contains(text(), 'Invoice Export')]",
                                            "xpath", "invoice export button")
        self.create_pdf_invoice_button = Button("createPDFInvoiceButton", "id", "create PDF Invoice button")
        self.invoice_number_text_field = TextField("//textarea[@name='invoiceNumber']", "xpath",
                                                   "invoice number text field")
        self.invoice_description_field = TextField('#itemsTableBody .leftMost textarea', 'css',
                                                   'invoice description field')
        self.invoice_item_field = TextField('#itemsTableBody td:nth-of-type(2) textarea', 'css', 'invoice item field')
        self.invoice_qty_field = TextField('#itemsTableBody td:nth-of-type(3) input', 'css', 'invoice qty field')
        self.invoice_rate_field = TextField('#itemsTableBody td:nth-of-type(4) input', 'css', 'invoice rate field')
        self.cost_of_work_button = Button("//*[@class='billingReports']//div[contains(text(), 'Cost of Work')]",
                                          "xpath", "cost of work button")
        self.profit_loss_button = Button("//*[@class='billingReports']//div[contains(text(), 'Profit / Loss')]",
                                         "xpath", "profit/loss button")

        # Create Reports Preview
        self.csv_preview_button = Button("csvPreviewTab", "id", "export report to csv file preview button")
        self.html_preview_button = Button("htmlPreviewTab", "id", "generate html report preview button")
        self.export_to_csv_button = Button("genCSVReportConfiguration", "id", "export to csv file button")
        self.generate_html_button = Button("applyReportConfiguration", "id", "generate html report button")
