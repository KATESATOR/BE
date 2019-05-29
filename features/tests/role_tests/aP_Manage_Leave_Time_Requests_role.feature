Feature: Manage Leave Time Requests role

  Background:
    Given I am logged in actiPLANS as requestsap
    And ap_my_schedule is visible

  @Role
  Scenario: 'Balances as of' changing
    When I click calendar
    And I click month_in_calendar
    And I click March_in_calendar
    And I click calendar_ok_button
    And I click first_date_calendar
    And I wait 1 seconds for animation stops
    And calendar should contain Mar 01, 2019
    And pto_value should contain 0d
    And sick_value should contain 0d
    And I click calendar
    And I click calendar_today
    And I wait 1 seconds for animation stops
    Then calendar should contain today

  @Role
  Scenario: Creating, editing, deleting leave request
    When I click week_start_day_cell
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

  @Role
  Scenario: Switching weeks
    When I click next_week
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

  @Role
  Scenario: Filtering and searching users
    When I click user_selector
    And I click selected_users
    And I click filter_in_user_selector
    And I enter Stivers in the search_in_user_selector
    And I perform select in the stivers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Stivers, Melanie
    And colleague_first_row should contain Stivers, Melanie
    And I click user_selector
    And I click selected_users
    And I click collapse_all_in_user_selector
    And I click design_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Design
    And I wait 1 seconds for animation stops
    And colleague_first_row should contain Gibson, Maurice
    And I click user_selector
    And I click all_users
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    And colleague_first_row should contain Barber, Robert
    And I click user_selector
    And I click selected_users
    And I click design_in_selector
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

  @Role
  Scenario: Sorting and filter in table
    When I click requests_tab
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

  @Role
  Scenario: Editing and deleting request in table
    When I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And first_row_balance_after should contain 3.4d
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I enter Test in the comment_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And first_row_balance_after should contain 1.5d
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
    And I wait 1 seconds for animation stops
    Then empty_data_row should contain You have no leave time requests

  @Role
  Scenario: Changing weeks in chart
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click previous_week_button
    And I click return_to_cur_week
    And I wait 1 seconds for animation stops
    And I should not see a web element return_to_cur_week
    And I click next_week_button
    And I click return_to_cur_week
    And I wait 1 seconds for animation stops
    And I should not see a web element return_to_cur_week
    And I click date_selector
    And I click first_week_date_selector
    And I wait 1 seconds for animation stops
    And I should see a web element return_to_cur_week
    And I click date_selector
    And I click current_week_date_selector
    And I wait 1 seconds for animation stops
    Then I should not see a web element return_to_cur_week

  @Role
  Scenario: Creating and deleting leave requests in chart
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click sort_users_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Barber, Robert
    And I click week_start_day_cell_no_leave
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell_leave should have class with dayCell weekStartDay leaveType1 approved fullLeave
    And I click week_start_day_cell_leave
    And I click sixth_element_in_menu
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I refresh the page
    And I click week_start_day_cell_no_leave
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And I click week_start_day_cell_no_leave
    And I click fourth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fifth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click sixth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click seventh_element_in_menu
    And I click sort_users_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Wooster, Jennifer
    And I click week_start_day_cell_no_leave
    And I click ninth_element_in_menu
    And I wait 1 seconds for animation stops
    And I click lt_edit_menu
    And I click third_element_in_menu
    And I enter 4 in the lt_time_field
    And I enter Test comment in the lt_comment_field
    And I click submit_request_button
    And I wait 1 seconds for animation stops
    And week_start_day_cell_leave should have class with dayCell weekStartDay leaveType3 approved fiftyPercentLeave
    And I click week_start_day_cell_no_leave
    And I click second_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click third_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fourth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fifth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click sixth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And I click sort_users_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Barber, Robert
    Then first_row_planned_lt should contain 35

  @Role
  Scenario: Pager on requests list
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click lt_requests_tab
    And I click page_selector
    And I click second_option_page_selector
    And I wait 1 seconds for animation stops
    And I should see a web element twelfth_row
    And I click page_selector
    And I click first_option_page_selector
    And I wait 1 seconds for animation stops
    And I should not see a web element twenty_fifth_row
    And I click next_page_button
    And I wait 1 seconds for animation stops
    And selected_page should contain 2
    And I click previous_page_button
    And I wait 1 seconds for animation stops
    Then selected_page should contain 1

  @Role
  Scenario: Sorting and filtering in requests table
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click lt_requests_tab
    And I click sort_period
    And I wait 1 seconds for animation stops
    And sort_period should have class with descending
    And first_row_name_table should contain Wooster, Jennifer
    And I click user_filter_table
    And I click selected_users
    And I perform select in the admin_in_user_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And user_filter_table should contain 1 department
    And first_row_name_table should contain Wooster, Jennifer
    And I click user_filter_table
    And I click selected_users
    And I perform select in the design_in_user_filter
    And I perform select in the admin_in_user_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And no_leave_time_row should contain There are no leave time requests to process
    And I click user_filter_table
    And I click all_users
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And user_filter_table should contain All Users
    And I click sort_users
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Barber, Robert
    And I click sort_groups
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Barber, Robert
    And first_group_in_table should have title with Administration
    And I click sort_by_time_zone
    And I wait 1 seconds for animation stops
    And I click sort_by_time_zone
    And I wait 1 seconds for animation stops
    And sort_by_time_zone should have class with descending
    And first_row_name_table should contain Cruz, Gordman
    And I click sort_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Sick Leave
    And I click sort_status
    And I wait 1 seconds for animation stops
    And sort_status should have class with ascending
    And I click sort_period
    And I wait 1 seconds for animation stops
    Then sort_period should have class with ascending

  @Role
  Scenario: User Filter in leave time planning chart
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click user_filter
    And I click selected_users
    And I perform select in the design_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter should contain 1 department
    And first_row_name_chart should contain Gibson, Maurice
    And I click user_filter
    And I click selected_users
    And I perform select in the design_in_user_filter
    And I click all_users
    And I click apply_filter
    And I wait 2 seconds for animation stops
    Then user_filter should contain All Users

  @Role
  Scenario: Modifying leave request in chart
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 fullLeave
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 approved fullLeave
    And I click week_start_day_cell
    And I click fourth_element_in_menu
    And I click lt_edit_menu
    And I click second_element_in_menu
    And I enter 2 in the lt_time_field
    And I click save_lt_edit
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 approved twentyFivePercentLeave
    And I click week_start_day_cell
    And I click second_element_in_menu
    And I click reject_button
    And I wait 1 seconds for animation stops
    Then week_start_day_cell should have class with dayCell weekStartDay noLeave

  @Role
  Scenario: Filtering by leave type and status, and edit request in table
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click lt_requests_tab
    And I click first_row_status
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I click first_row_request_date
    And I enter 2 in the request_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_period should contain 0.3d (2.03h)
    And I click leave_type_filter
    And I click selected_ltype_in_filter
    And I perform select in the vacation_in_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Vacation
    And leave_type_filter should contain Vacation
    And I click first_row_status
    And I click first_element_in_menu
    And I refresh the page
    And I click status_filter
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Approved
    And status_filter should contain Approved
    And I click first_row_leave_type
    And I click fourth_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Business Trip
    And I click first_row_status
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I click first_row_leave_type
    And I click third_element_in_menu
    And I click leave_type_filter
    And I perform select in the vacation_in_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And I click status_filter
    And I click all_statuses_in_filter
    And I wait 1 seconds for animation stops
    And status_filter should contain All statuses
    And I click balances_filter
    And I click second_element_in_menu
    And I wait 1 seconds for animation stops
    And balances_filter should contain PTO Balance
    And first_row_leave_type should contain Time Off
    And I click balances_filter
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And balances_filter should contain Sick Days Balance
    And first_row_leave_type should contain Medical Treatment
    And I click balances_filter
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    Then balances_filter should contain All balances

  @Role
  Scenario: Bulk actions in table
    When I am on leaves_management page
    And ap_leaves_management is visible
    And I click lt_requests_tab
    And I perform select in the first_row_checkbox
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I perform select in the first_row_checkbox
    And I click approve_bulk
    And I wait 1 seconds for animation stops
    And first_row_status should contain Approved
    And I perform select in the common_chkbx
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And I perform select in the common_chkbx
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And no_leave_time_row should contain There are no leave time requests to process
    Then I should not see a web element first_row_status

  @Role
  Scenario: Leave time & balances report displaying
    When I am on reports page
    And aP_reports_page is visible
    And I click ltb_report_tab
    And I click custom_from_date
    And I click month_selector
    And I click feb_in_month_selector
    And I click calendar_ok_button
    And I click first_date_calendar
    And I refresh the page
    And I click custom_to_date
    And I click month_selector
    And I click apr_in_month_selector
    And I click calendar_ok_button
    And I click thirtieth_date_calendar
    And I wait 1 seconds for animation stops
    And date_range_selector should contain Custom date range
    And custom_from_date should contain Feb 01, 2019
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

  @Role
  Scenario: Sorting in Leave Time & Balances chart
    When I am on reports page
    And aP_reports_page is visible
    And I click ltb_report_tab
    And I click chart_sort_a_z
    And I wait 1 seconds for animation stops
    And first_column_in_chart should contain Venson, Ronald
    And I click chart_sort_by_value
    And I wait 1 seconds for animation stops
    And I should see a web element asc_sort_by_value
    And first_column_in_chart should contain Timmers, Brian
    And I click chart_sort_a_z
    And I wait 1 seconds for animation stops
    Then first_column_in_chart should contain Barber, Robert

  @Role
  Scenario: Modifying Leave time & balances report
    When I am on reports page
    And aP_reports_page is visible
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


  @Role
  Scenario: Past leaves calendar report displaying
    When I am on reports page
    And aP_reports_page is visible
    And I click past_leaves_calendar_tab
    And I click date_range_selector_plc
    And I click feb_in_month_selector_plc
    And I click apply_date_range_plc
    And I wait 1 seconds for animation stops
    And I should see a web element leave_time_table
    And I should see a web element leave_time_data
    And I should see a web element single_month_calendar
    And I click collapse_leave_time_details
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_time_table
    And I click collapse_leave_time_details
    And I wait 1 seconds for animation stops
    Then I should see a web element leave_time_table

  @Role
  Scenario: Modifying Past leaves calendar report
    When I am on reports page
    And aP_reports_page is visible
    And I click past_leaves_calendar_tab
    And I click user_selector_past_leaves
    And I click sort_by_users_in_user_selector
    And I click barber_in_user_selector
    And I wait 1 seconds for animation stops
    And user_selector_past_leaves should contain Barber, Robert
    And I click user_selector_past_leaves
    And I click sort_by_users_in_user_selector
    And I click managerequestsap_in_user_selector
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

  @Role
  Scenario: Modifying Balance history report
    When I am on reports page
    And aP_reports_page is visible
    And I click balance_history_tab
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
    And I click balance_history_user_selector
    And I click sort_by_users_in_user_selector
    And I click managerequestsap_in_user_selector
    And I wait 1 seconds for animation stops
    And balance_history_user_selector should contain Me
    And I click calendar_balance_history
    And I click date_sixteen_calendar
    And I wait 1 seconds for animation stops
    And I should see a text 16 on the page
    And I click calendar_balance_history
    And I click today_in_calendar
    And I wait 1 seconds for animation stops
    Then calendar_balance_history should contain today

  @Role
  Scenario: Export Balance history
    When I am on reports page
    And aP_reports_page is visible
    And I click balance_history_tab
    And I refresh the page
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    Then I search report PTO-History-Manage_Requests_aP-Role with the extension pdf in downloads folder

  @Role
  Scenario: Export Past leaves calendar report
    When I am on reports page
    And aP_reports_page is visible
    And I click past_leaves_calendar_tab
    And I refresh the page
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    Then I search report Past-Leaves-Calendar-Manage_Requests_aP-Role with the extension pdf in downloads folder

  @Role
  Scenario: Export Leave time & balances report
    When I am on reports page
    And aP_reports_page is visible
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
    And I search report actiPLANS - Leave Time and with the extension pdf in downloads folder

  @Role
  Scenario: Access options: verification of another managers user and check auto approved user
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I perform select in the ltm_edit_auto_approved_checkbox
    And I perform select in the ltm_show_auto_approved_checkbox
    And I perform select in the ltm_show_other_assigned_checkbox
    And I wait 1 seconds for animation stops
    And I click save_button_top
    And I am logged in actiPLANS as requestsap
    And I am on leaves_management page
    And ap_leaves_management is visible
    And I click lt_requests_tab
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Kloss, Barbara
#    And I click sort_users
#    And I perform select in the first_row_checkbox
#    And I click reject_bulk
#    And I click reject_ok_button
#    And I wait 1 seconds for animation stops
#    Then first_row_status should contain Rejected

  @Role
  Scenario: Other user and auto approved in LTB report
    When I am on reports page
    And aP_reports_page is visible
    And I click ltb_report_tab
    And I should see a web element barbara_in_ltb
    Then I should see a web element locktt_in_ltb

  @Role
  Scenario: Other user and auto approved in past leave calendar
    When I am on reports page
    And aP_reports_page is visible
    And I click past_leaves_calendar_tab
    And I click user_selector_past_leaves
    And I click sort_by_users_in_user_selector
    And I wait 1 seconds for animation stops
    And I click barbara_in_user_selector
    And I wait 1 seconds for animation stops
    Then user_selector_past_leaves should contain Kloss, Barbara

  @Role
  Scenario: Other user and auto approved in balance history
    When I am on reports page
    And aP_reports_page is visible
    And I click balance_history_tab
    And I click balance_history_user_selector
    And I click sort_by_users_in_user_selector
    And I click locktt_in_user_selector
    Then balance_history_user_selector should contain Lock TT, Role

  @Role
  Scenario: Editing My profile
    When I click my_profile
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
    And I enter Robert in the profile_first_name
    And I enter   in the profile_middle_name
    And I enter Barber in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Robert on the page
    Then I should see a text Barber on the page