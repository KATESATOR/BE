
Feature: aP Manage PTO & Sick Days Settings Role

 Background:
    Given I am logged in actiPLANS as leavebalanceap

 @Smoke
  Scenario: 'Balances as of' changing
    When ap_my_schedule is visible
    And I click calendar
    And I click month_in_calendar
    And I click april_in_calendar
    And I click calendar_ok_button
    And I click date_calendar
    And I wait 2 seconds for animation stops
    And calendar should contain Apr 30, 2019
    And pto_value should contain 4.4d
    And sick_value should contain 1.3d
    And I click calendar
    And I click calendar_today
    And I wait 1 seconds for animation stops
    Then calendar should contain today

  @Smoke
  Scenario: Creating, editing, deleting leave request
    When ap_my_schedule is visible
    And I click week_start_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType1 approved fullLeave
    And I click week_start_day_cell
    And I click edit_request
    And I click leave_type_selector
    And I click third_leave_type
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 approved fiftyPercentLeave
    And I click week_start_day_cell
    And I click delete_request
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click third_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click third_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click last_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click sixth_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click last_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    Then I should see a web element leave_last_day_cell

  @Smoke
  Scenario: Switching weeks
    When ap_my_schedule is visible
    And I click next_week
    And I click return_to_cur_week
    And I should see a web element current_week
    And I click previous_week
    And I click return_to_cur_week
    And I should see a web element current_week
    And I click date_selector
    And I click first_week_date_selector
    And I wait 1 seconds for animation stops
    And I should see a web element return_to_cur_week
    And I click date_selector
    And I click current_week_date_selector
    And I wait 1 seconds for animation stops
    Then I should not see a web element return_to_cur_week

  @Smoke
  Scenario: Filtering and searching users
    When ap_my_schedule is visible
    And I click user_selector
    And I click selected_users
    And I click entertt_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Enter TT, Role
    And colleague_first_row should contain Enter TT, Role
    And I click user_selector
    And I click selected_users
    And I click users_wo_department_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Users without department
    And colleague_first_row should contain Enter TT, Role
    And I click user_selector
    And I click all_users
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    And colleague_first_row should contain Barber, Robert
    And I enter Moss in the users_search_field
    And I wait 1 seconds for animation stops
    And search_result_first_row should contain Moss
    And I enter 123 in the users_search_field
    And I wait 1 seconds for animation stops
    And colleague_first_row should contain There are no users found
    And I click clear_search
    And I wait 1 seconds for animation stops
    Then colleague_first_row should contain Barber, Robert

  @Smoke
  Scenario: Sorting and filter in table
    When ap_my_schedule is visible
    And I click requests_tab
    And I click sorting_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Sick Leave
    And I click sorting_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And I click sorting_status
    And I should see a web element status_sorting_asc
    And I click sorting_period
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    And I should see a web element period_sorting_asc
    And I click balances_filter
    And I click sick_days_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And balances_filter should contain Sick Days Balance
    And I click balances_filter
    And I click pto_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    And balances_filter should contain PTO Balance
    And I click balances_filter
    And I click all_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    Then balances_filter should contain All balances

  @Smoke
  Scenario: Editing and deleting request in table
    When ap_my_schedule is visible
    And I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And first_row_balance_after should contain 5.8d
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I enter Test in the comment_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And first_row_balance_after should contain 1.8d
    And I should see a web element first_row_sd_balance
    And I should see a web element leave_comment
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_comment
    And I should not see a web element first_row_sd_balance
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 2 seconds for animation stops
    Then empty_data_row should contain You have no leave time requests

  @Smoke
  Scenario: Editing My profile
    When ap_my_schedule is visible
    And I click my_profile
    And I enter Test in the profile_first_name
    And I enter T in the profile_middle_name
    And I enter Smith in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Test on the page
    And I should see a text Smith on the page
    And I should see a text T. on the page
    And I click my_profile
    And I enter Role in the profile_first_name
    And I enter   in the profile_middle_name
    And I enter Manage Leave Balance aP in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Role on the page
    Then I should see a text Manage Leave Balance aP on the page

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
    And I click sick_robert_change_balance
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
    And I click leavebalanceap_in_user_selector
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
    Then I search report Past-Leaves-Calendar-Manage_Leave_Balance_aP-Role with the extension pdf in downloads folder

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