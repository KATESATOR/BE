from features.utility.element import *


class aPreportsPage:

    def __init__(self):
        self.reports = Button("//div[contains(text(),'REPORTS')]", "XPATH", "Reports tab")
        self.ltb_report_tab = Button('leaveTimeReportTab', 'id', 'leave time & balances report tab')
        self.ltb_total_section_header = Button('#leaveTimeAndBalancesChartSectionContainer .headerLabel', 'css',
                                               'total section header in ltb report')
        self.leave_time_selector = Button('.selectorLinkText', 'css', 'leave time selector')
        self.pto_in_selector = Button('.row.pto', 'css', 'pto in leave time selector')
        self.leave_time_in_selector = Button('.row.leaveTime', 'css', 'leave time in selector')
        self.chart_sort_a_z = Button('.sortButton.alphabetically>span', 'css', 'sorting by alphabet in chart')
        self.chart_sort_by_value = Button('.sortButton.value', 'css', 'sorting by value in chart')
        self.first_column_in_chart = Element('.amcharts-category-axis .amcharts-axis-label:first-of-type>tspan', 'css',
                                             'first column in chart')
        self.last_column_in_chart = Element('.amcharts-category-axis .amcharts-axis-label:last-of-type>tspan', 'css',
                                            'last column in chart')
        self.date_range_selector = Button('.dateRangeDropdownSelector span', 'css', 'date range selector')
        self.custom_from_date = Button('.calendarButton.fromDate .date-text', 'css', 'custom "from" date')
        self.month_selector = Button('.x-menu-date-item .x-btn-center button', 'css', 'custom month selector')
        self.feb_in_month_selector = Button('//a[text()="Feb"]', 'xpath', 'February in month selector')
        self.apr_in_month_selector = Button('//a[text()="Apr"]', 'xpath', 'April in month selector')
        self.calendar_ok_button = Button('.x-date-mp-ok', 'css', 'OK button in calendar')
        self.first_date_calendar = Button('//*[@class="x-date-inner"]//*[text()="1"]', 'xpath', '1st date in calendar')
        self.thirtieth_date_calendar = Button('//*[@class="x-date-inner"]//*[text()="30"]', 'xpath',
                                              '30th date in calendar')
        self.custom_to_date = Button('.calendarButton.toDate .date-text', 'css', 'custom "to" date')
        self.current_week = Button('.rangesListMenu:last-of-type li:nth-of-type(9)', 'css',
                                   'current week in date range selector')
        self.current_month = Button('.rangesListMenu:last-of-type li:first-of-type', 'css',
                                    'current month in date range selector')
        self.last_21_days = Button('.rangesListMenu:last-of-type li:nth-of-type(15)', 'css',
                                   'last 21 days in date range selector')
        self.current_year = Button('.rangesListMenu:last-of-type li:nth-of-type(17)', 'css',
                                   'year month in date range selector')
        self.edit_configuration = Button('.editConfiguration', 'css', 'edit configuration button')
        self.edit_second_grouping_level = Button('#reportGroupingSelector_treeRow2 button', 'css',
                                                 '2nd grouping level in edit configuration')
        self.depts_in_second_lvl_selector = Button('.at-dropdown-list-btn-menu li:nth-of-type(4)', 'css',
                                                   'departments in 2nd grouping level selector')
        self.no_second_level_in_selector = Button('.tree-cell-text li:first-of-type', 'css',
                                                  'do not use 2nd level in 2nd grouping level selector')
        self.edit_columns_type_selector = Button('#columnsTypeSelector button', 'css',
                                                 'columns type selector in edit configuration')
        self.pto_in_columns_type_selector = Button('.columnsFormatMenu li:last-of-type', 'css',
                                                   'pto balance only in columns type selector')
        self.leave_time_in_columns_type_selector = Button('.columnsFormatMenu li:nth-of-type(2)', 'css',
                                                          'leave time only in colums type selector')
        self.lt_and_pto_in_columns_type_selector = Button('.columnsFormatMenu li:first-of-type', 'css',
                                                          'leave time & pto in columns type selector')
        self.apply_configuration = Button('applyReportConfiguration', 'id', 'apply configuration button')
        self.first_second_lvl_row_in_table = Element('//*[@class="dataRow secondLevelRow"][1]', 'xpath',
                                                     'first second level row in table')
        self.table_ltb_reports = Button('.tableContainer', 'css', 'table in ltb report')
        self.collapse_chart = Button('.collapseButton', 'css', 'collapse chart button')
        self.export_button = Button('.exportButton', 'css', 'export selector button')
        self.export_csv = Button('//*[@class="row toCSV"]', 'xpath', 'export to csv')
        self.export_pdf = Button('//*[@class="row toPDF"]', 'xpath', 'export to pdf')
        self.download_pdf = Button('//*[text()="Download PDF"]', 'xpath', 'download pdf button')
        self.past_leaves_calendar_tab = Button('pastLeavesCalendarTab', 'id', 'past leaves calendar tab')
        self.collapse_leave_time_details = Button('.sliderText', 'css', 'leave time details')
        self.leave_time_table = Element('leaveTimeTable', 'id', 'leave time table in past leaves calendar')
        self.leave_time_data = Element('.leaveTimeData', 'css', 'leave time data section')
        self.single_month_calendar = Element('.singleCalendar', 'css', 'single month calendar')
        self.three_month_calendar = Element('.threeCalendar', 'css', 'three month calendar')
        self.user_selector_past_leaves = Button('#leaveHistorySelector_userSelector span', 'css',
                                                'user selector in past leaves')
        self.sort_by_users_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="By Users"]',
                                                     'xpath', 'sort by users in user selector')
        self.stivers_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Stivers, Melanie"]',
                                               'xpath', 'Long Michelle in user selector')
        self.barber_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Barber, Robert"]',
                                              'xpath', 'Doe John in user selector')
        self.entertt_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Enter TT, Role"]',
                                               'xpath', 'Enter TT Role in user selector')
        self.manageptorole_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Manage PTO & '
                                                     'Sick Days Settings, Role"]', 'xpath', 'Manage PTO&Sick in user '
                                                                                            'selector')
        self.leavebalanceap_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Manage '
                                                      'Leave Balance aP, Role"]', 'xpath', 'Manage PTOSD in ''selector')
        self.managerequestsap_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Manage '
                                                        'Requests aP, Role"]', 'xpath', 'Manage requests in ''selector')
        self.locktt_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Lock TT, Role"]',
                                              "xpath", "Lock TT, Role in selector")
        self.barbara_in_user_selector = Button('*//div[contains(@class,"userForLeave")]//*[text()="Kloss, Barbara"]',
                                               "xpath", "Barbara in selector")
        self.barbara_in_ltb = Element("//td[contains(text(),'Kloss, Barbara')]", "xpath", "Barbara in LTB report")
        self.locktt_in_ltb = Element("//td[contains(text(),'Kloss, Barbara')]", "xpath", "Barbara in LTB report")
        self.past_leaves_time_table = Element('leaveTimeTable', 'id', 'past leaves leave time table')
        self.calendar = Element('calendarContainer', 'id', 'past leaves report calendar')
        self.date_range_selector_plc = Button('.monthYearSelectorButton>span', 'css', 'date range selector in plc')
        self.feb_in_month_selector_plc = Button('.yearBlock.last .firstMonthsRow>td:nth-of-type(2)', 'css',
                                                'February in month selector past leaves calendar')
        self.last_three_month_range = Button('.threeMonthsRange', 'css', '3 month range')
        self.current_month_range = Button('.currentMonthRange>span', 'css', 'current month range')
        self.apply_date_range_plc = Button('[class*="monthYearSelector"] button:nth-of-type(1)', 'css',
                                           'apply date range in plc')
        self.leave_types_filter = Button('#leaveTypeFilter span', 'css', 'leave types filter')
        self.selected_in_lt_filter = Button('//*[text()="Selected"]', 'xpath', 'selected in leave types filter')
        self.sick_leave_in_lt_filter = Button('//*[contains(@class,"groupingSelectorTree")]//*[text()="Sick Leave"]',
                                              'xpath', 'vacation in leave types filter')
        self.apply_lt_filter = Button('//*[contains(@class,"selector-panel")]//*[text()="Apply"]', 'xpath',
                                      'apply leave time filter')
        self.first_leave_type_in_list = Element('#calendarLeaveTypesWrap .leaveTypeName', 'css',
                                                'first leave type in list')
        self.balance_history_tab = Button('balanceHistoryTab', 'id', 'balance history tab')
        self.balance_history_user_selector = Button('#balanceHistory_userSelector span', 'css',
                                                    'user selector in balance history')
        self.calendar_balance_history = Button('.calendar button', 'css', 'calendar in balance history')
        self.date_sixteen_calendar = Button('//*[@class="x-date-inner"]//*[text()="16"]', 'xpath',
                                            '16th in balance history calendar')
        self.today_in_calendar = Button('.x-date-at-today-cell button', 'css',
                                        'today button in balance history calendar')
        self.balance_history_type_selector = Button('#balanceHistory_typeSelector button', 'css',
                                                    'balance history type selector')
        self.sick_days_in_type_selector = Button('#balanceTypeSelectorPlaceholder ul li:last-of-type', 'css',
                                                 'sick days in balance history type selector')
        self.pto_in_type_selector = Button('#balanceTypeSelectorPlaceholder ul li:first-of-type', 'css',
                                           'pto in balance history type selector')
        self.first_row_in_balance_history_table = Element(
            '.balanceHistoryTable>tbody tr:first-of-type .descriptionTitle', 'css',
            'first row description cell in balance history table')
        self.asc_sort_by_value = Element('.sortButton.value .ascSortIndicator', 'css', 'ascending sort by value')
