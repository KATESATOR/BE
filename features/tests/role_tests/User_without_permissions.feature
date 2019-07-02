Feature: User without Permissions Role

  Background:
    Given  I am logged in actiPLANS as user without permissions role
    And general_page is visible

  @Role
  Scenario: Login to aP
    When I should see a web element my_schedule
    And I should see a web element ap_reports
    And I should see a web element ap_users
    Then I should not see a web element settings_button

  @Role
  Scenario: My Schedule creating, editing, deleting requests
    When ap_my_schedule is visible
    And I click week_start_day_cell
    And I wait 2 seconds for animation stops
    And I click submit_request
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType1 fullLeave
    And I click week_start_day_cell
    And I click edit_request
    And I click leave_type_selector
    And I click third_leave_type
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 fiftyPercentLeave
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
  Scenario: My Schedule, only users from the same time zone
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I click schedule_visibility_tz_group_radiobutton
    And I click save_button_top
    And I wait 1 seconds for animation stops
    And I am logged in actiPLANS as user without permissions role
    And ap_my_schedule is visible
    And I enter Cruz in the users_search_field
    And I wait 1 seconds for animation stops
    Then colleague_first_row should contain There are no users found

  @Role
  Scenario: Past leaves calendar report displaying
    When I am on ap_reports page
    And aP_reports_page is visible
    And I should not see a web element ltb_report_tab
    And I should not see a web element user_selector_past_leaves
    And I should see a text My Past Leaves Calendar on the page
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
  Scenario: Balance history report
    When I am on ap_reports page
    And aP_reports_page is visible
    And I click balance_history_tab
    And I should see a text My Balance History on the page
    And I should not see a web element balance_history_user_selector
    Then I should not see a web element ltb_report_tab

  @Role
  Scenario: aP User List
    When I click ap_users
    And users_page is visible
    And I should not see a web element pto_settings
    And I should not see a web element sick_settings
    And I should not see a web element add_users
    And I should not see a web element departments
    And I should not see a web element tzg
    And I click edit_user_panel
    Then I should not see a web element first_name

  @Role
  Scenario: Editing and deleting request in table
    When ap_my_schedule is visible
    And I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I enter Test in the comment_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And I should see a web element first_row_sd_balance
    And I should see a web element leave_comment
    And I click first_row_delete
    And I accept alert menu
    And I wait 2 seconds for animation stops
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
  Scenario: Editing My profile
    When ap_my_schedule is visible
    And I click my_profile
    And I enter Test in the profile_first_name
    And I enter T in the profile_middle_name
    And I enter Smith in the profile_last_name
    And I wait 2 seconds for animation stops
    And I click profile_save
    And I wait 2 seconds for animation stops
    And I refresh the page
    And I wait 2 seconds for animation stops
    And I should see a text Test on the page
    And I should see a text Smith on the page
    And I should see a text T. on the page
    And I click my_profile
    And I enter Role in the profile_first_name
    And I enter   in the profile_middle_name
    And I enter No Permission in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Role on the page
    Then I should see a text No Permission on the page

  @Role
  Scenario: Login in aT, User List available
    When I click switch_product
    And I should see a web element user_list
    And I should not see a web element time_track
    And I should not see a web element tasks
    And I should not see a web element reports
    And I should not see a web element settings_button
    And user_list_page is visible
    And I should not see a web element pto_tab
    And I should not see a web element sick_days_tab
    And I should not see a web element work_assignments_tab
    And I click user_cruz_gordman
    Then I should not see a web element edit_first_name_field

  @Role
  Scenario: Contact Support
    When I click switch_product
    And I click help button
    And I wait 1 seconds for animation stops
    And I click contact support
    And I enter Text for support in the support field
    And I click submit support
    And I wait 3 seconds for animation stops
    Then I should see a text Your question was successfully submitted on the page
    And I click close_contact_support

  @Role
  Scenario: Login in aT, User List not available
    When I click switch_product
    And I click logout_button
    And I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_hide_not_assigned_users
    And I click gs_save
    And I wait 1 seconds for animation stops
    And I am logged in as user without permissions role
    And general_page is visible
    And I should see a web element no_permission_warning
    And I click close_profile
    And I wait 1 seconds for animation stops
    And I should not see a web element time_track
    And I should not see a web element tasks
    And I should not see a web element reports
    And I should not see a web element user_list
    And I should not see a web element settings_button
    And My current URL should contain /accessdenied.jsp
    Then I should see a text You no longer have the permission to access this functionality. on the page
