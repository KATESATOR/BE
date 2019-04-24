
Feature: aP Manage PTO & Sick Days Settings Role

 Background:
    Given I am logged in actiPLANS as managebalancesat

 @Smoke
  Scenario: PTO days edit
    When users_page is visible
    And I click users
    And I click pto_settings
    And I wait 2 seconds for animation stops
    And I click pto_change_balance
    And I wait 1 seconds for animation stops
    And I enter 79 in the pto_balance_field
    And I wait 1 seconds for animation stops
    And I click pto_balance_apply
    And I wait 1 seconds for animation stops
    And I should see a text 79 on the page
    And I click pto_change_balance
    And I enter -1.3 in the pto_balance_field
    And I click pto_balance_apply
    And I should see a text -1.3 on the page
    And I click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 811 in the pto_max_limit
    And I click pto_save_changes
    And I wait 1 seconds for animation stops
    And I should see a text 811 on the page
    And I click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 15 in the pto_max limit
    And I click pto_save_changes
    And I wait 1 seconds for animation stops
    Then I should not see a web element pto_limit_check

  @Smoke
  Scenario: Sick days edit
    When users_page is visible
    And I click users
    And I click sick_settings
    And I wait 2 seconds for animation stops
    And I click sick_change_balance
    And I wait 1 seconds for animation stops
    And I enter 14.9 in the sick_balance_field
    And I wait 1 seconds for animation stops
    And I click sick_balance_apply
    And I wait 1 seconds for animation stops
    And I should see a text 14.9 on the page
    And I click sick_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 812 in the sick_max_limit
    And I click sick_save_changes
    And I wait 1 seconds for animation stops
    And I should see a text 812 on the page
    And i click sick_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 15 in the sick_max limit
    And I click sick_save_changes
    And I wait 1 seconds for animation stops
    Then I should not see a web element sick_limit_check

  @Smoke
  Scenario: Create Time Balance Report
    When aP_reports_page is visible
    And I click reports
    And I click ltb_report_tab
    And I click custom_from_date
    And I click month_selector
    And I click feb_in_month_selector
    And I wait 1 seconds for animation stops
    And I click calendar_ok_button
    And I wait 1 seconds for animation stops
    And I click first_date_calendar
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I wait 1 seconds for animation stops
    And I click custom_to_date
    And I click month_selector
    And I click apr_in_month_selector
    And I click calendar_ok_button
    And I wait 1 seconds for animation stops
    And I click thirtieth_date_calendar
    And I wait 1 seconds for animation stops
    And date_range_selector should contain Custom date range
    And I wait 2 seconds for animation stops
    And custom_from_date should contain Feb 01, 2019
    And I wait 2 seconds for animation stops
    And custom_to_date should contain Mar 30, 2019
    And I wait 1 seconds for animation stops
    And I should see a web element table_ltb_reports
    And I should see a web element ltb_total_section_header
    And I click leave_time_selector
    And I click pto_in_selector
    And ltb_total_section_header should contain Total PTO Balance (days):
    And I click collapse_chart
    And I wait 1 seconds for animation stops
    And I should not see a web element ltb_total_section_header
    And I click leave_time_selector
    And I click leave_time_in_selector
    And I wait 1 seconds for animation stops
    And I should see a web element ltb_total_section_header
    Then ltb_total_section_header should contain Total Leave Time:

  @Smoke
  Scenario: Sorting in Leave Time & Balances chart
    When aP_reports_page is visible
    And I click reports
    And I click ltb_report_tab
    And I click chart_sort_a_z
    And I wait 2 seconds for animation stops
    And first_column_in_chart should contain Venson, Ronald
    And I click chart_sort_by_value
    And I wait 1 seconds for animation stops
    And I should see a web element asc_sort_by_value
    And first_column_in_chart should contain Timmers, Brian
    And I click chart_sort_a_z
    And I wait 1 seconds for animation stops
    Then first_column_in_chart should contain Barber, Robert

  @Smoke
  Scenario: Modifying Leave time & balances report
    When aP_reports_page is visible
    And I click reports
    And I click ltb_report_tab
    And I click edit_configuration
    And I click edit_second_grouping_level
    And I click depts_in_second_lvl_selector
    And I click edit_columns_type_selector
    And I click leave_time_in_columns_type_selector
    And I click apply_configuration
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_time_selector
    And I should see a web element first_second_lvl_row_in_table
    And I click edit_configuration
    And I click edit_second_grouping_level
    And I click no_second_level_in_selector
    And I click edit_columns_type_selector
    And I click lt_and_pto_in_columns_type_selector
    And I click apply_configuration
    And I wait 1 seconds for animation stops
    And I should not see a web element first_second_lvl_row_in_table
    And I should see a web element leave_time_selector
    And I click leave_time_selector
    And I click leave_time_in_selector
    Then ltb_total_section_header should contain Total Leave Time:

  @Smoke
  Scenario: Past leaves calendar report displaying
    When aP_reports_page is visible
    And I click reports
    And I click past_leaves_calendar_tab
    And I click date_range_selector_plc
    And I click feb_in_month_selector_plc
    And I click apply_date_range_plc
    And I wait 1 seconds for animation stops
    And I should see a web element leave_time_table
    And I should see a web element leave_time_data
    And I should see a web element single_month_calendar
    And I click collapse_leave_time_details
    And I wait 2 seconds for animation stops
    And I should not see a web element leave_time_table
    And I click collapse_leave_time_details
    And I wait 1 seconds for animation stops
    Then I should see a web element leave_time_table

  @Smoke
  Scenario: Modifying Past leaves calendar report
    When aP_reports_page is visible
    And I click reports
    And I click past_leaves_calendar_tab
    And I click user_selector_past_leaves
    And I click sort_by_users_in_user_selector
    And I click barber_in_user_selector
    And I wait 1 seconds for animation stops
    And user_selector_past_leaves should contain Barber, Robert
    And I click user_selector_past_leaves
    And I click sort_by_users_in_user_selector
    And I click manageptorole_in_user_selector
    And I wait 1 seconds for animation stops
    And user_selector_past_leaves should contain Me
    And I click date_range_selector_plc
    And I click last_three_month_range
    And I click apply_date_range_plc
    And I wait 1 seconds for animation stops
    And I should see a web element three_month_calendar
    And I click date_range_selector_plc
    And I click current_month_range
    And I click apply_date_range_plc
    And I wait 1 seconds for animation stops
    And I should see a web element single_month_calendar
    And I click date_range_selector_plc
    And I click feb_in_month_selector_plc
    And I click apply_date_range_plc
    And I wait 1 seconds for animation stops
    And I click leave_types_filter
    And I click selected_in_lt_filter
    And I click sick_leave_in_lt_filter
    And I click apply_lt_filter
    And I wait 1 seconds for animation stops
    And leave_types_filter should contain Sick Leave
    And first_leave_type_in_list should contain Sick Leave
    And I click leave_types_filter
    And I click selected_in_lt_filter
    And I click sick_leave_in_lt_filter
    And I click apply_lt_filter
    And I wait 1 seconds for animation stops
    Then leave_types_filter should contain All leave types

  @Smoke
  Scenario: Modifying Balance history report
    When aP_reports_page is visible
    And I click reports
    And I click balance_history_tab
    And I click balance_history_user_selector
    And I click sort_by_users_in_user_selector
    And I click entertt_in_user_selector
    And I wait 1 seconds for animation stops
    And balance_history_user_selector should contain Enter TT, Role
    And I click balance_history_user_selector
    And I click sort_by_users_in_user_selector
    And I click barber_in_user_selector
    And I wait 1 seconds for animation stops
    And balance_history_user_selector should contain Barber, Robert
    And I click balance_history_type_selector
    And I click sick_days_in_type_selector
    And I wait 1 seconds for animation stops
    And I should see a text Sick Leave Completed on the page
    And I click balance_history_type_selector
    And I click pto_in_type_selector
    And I wait 1 seconds for animation stops
    And balance_history_type_selector should contain PTO
    And I click calendar_balance_history
    And I click date_sixteen_calendar
    And I wait 1 seconds for animation stops
    And I should see a text 16 on the page
    And I click calendar_balance_history
    And I click today_in_calendar
    And I wait 1 seconds for animation stops
    Then calendar_balance_history should contain today

  @Smoke
  Scenario: Export Balance history
    When aP_reports_page is visible
    And I click reports
    And I click balance_history_tab
    And I refresh the page
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    Then I search report PTO-History-Barber-Robert with the extension pdf in downloads folder

  @Smoke
  Scenario: Export Past leaves calendar report
    When aP_reports_page is visible
    And I click reports
    And I click past_leaves_calendar_tab
    And I refresh the page
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    Then I search report Past-Leaves-Calendar-Manage_PTO___Sick_Days_Settings-Role with the extension pdf in downloads folder

  @Smoke
  Scenario: Export Leave time & balances report
    When aP_reports_page is visible
    And I click reports
    And I click ltb_report_tab
    And I refresh the page
    And I click export_button
    And I click export_csv
    And I wait 2 seconds for animation stops
    And I search report actiPLANS - Leave Time and with the extension csv in downloads folder
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    And I click download_pdf
    And I wait 2 seconds for animation stops
    Then I search report actiPLANS - Leave Time and with the extension pdf in downloads folder

  @Smoke
  Scenario: Only User List
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I wait 1 seconds for animation stops
    And I click pto_switcher
    And I wait 1 seconds for animation stops
    And I click sick_switcher
    And I wait 1 seconds for animation stops
    And I click save_button_top
    And I am logged in actiPLANS as managebalancesat
    And users_page is visible
    And I click users
    And I should not see a web element pto_settings
    And I should not see a web element sick_settings
    Then I should see a web element user_list_title