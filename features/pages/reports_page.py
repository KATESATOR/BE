from features.utility.element import *


# TODO: Придумать новые названия для локаторовк которые подходят к чартам и репортам
class ReportsPage:
    def __init__(self):
        self.reports_page_button = Button("//a[@href='/cur/reports/reports.do']", "xpath", "reports page")
        self.reports_dashboard = Link("Reports Dashboard", "link text", "reports page")
        self.create_chart_button = Button("ext-gen38", "id", "create chart button")
        self.new_report_button = Button("ext-gen18", "id", "new report button")
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
        self.show_selector_button = Button("createChartLightbox_chartTypeListSelectorPlaceholder", "id",
                                           "open 'Show' selector")
        self.by_selector_button = Button("createChartLightbox_groupingLevelListSelectorPlaceholder", "id",
                                         "open 'By' selector")
        self.export_chart_button = Button("createChartLightbox_commitBtn", "id", "export to pdf chart")
        self.download_chart_button = Button("createChartLightbox_downloadPdfBtn", "id", "download to pdf chart")
        self.close_chart_button = Button("closeCreateChartLightboxButton", "id", "close chart button")

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
        self.cost_of_work_button = Button("//*[@class='billingReports']//div[contains(text(), 'Cost of Work')]",
                                          "xpath", "cost of work button")
        self.profit_loss_button = Button("//*[@class='billingReports']//div[contains(text(), 'Profit / Loss')]",
                                         "xpath", "profit/loss button")

        # Create Reports Preview
        self.csv_preview_button = Button("csvPreviewTab", "id", "export report to csv file preview button")
        self.html_preview_button = Button("htmlPreviewTab", "id", "generate html report preview button")
        self.export_to_csv_button = Button("genCSVReportConfiguration", "id", "export to csv file button")
        self.generate_html_button = Button("applyReportConfiguration", "id", "generate html report button")
