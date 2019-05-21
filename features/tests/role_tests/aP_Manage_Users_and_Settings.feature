
Feature: Manage Users and Settings aP Role

  Background:
    Given I am logged in actiPLANS as usersettingsap
    And ap_my_schedule is visible

  @Role
  Scenario: Manage requests on My Schedule
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
    And I click submit_request
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType1 approved fullLeave
    And I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And first_row_balance_after should contain 0.5d
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I enter Test in the comment_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And I should see a web element leave_comment
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_comment
    And I should not see a web element first_row_sd_balance
    Then empty_data_row should contain You have no leave time requests

#    Manage User List

  @Role
  Scenario: Manage users on User List
    When users_page is visible
    And I click users
#    Из-за бага ATBO-357 есть проблемы
#    And I should not see a web element pto_settings
#    And I should not see a web element sick_settings
    And I click add_users
    And I wait 2 seconds for animation stops
    And I click new_user_profile
    And I wait 2 seconds for animation stops
    And I enter A in the first_name
    And I enter A1 in the last_name
    And I enter test@test in the email
    And I click save_send_invitation
    And I wait 2 seconds for animation stops
    And I click close_add_user_panel
    And I wait 2 seconds for animation stops
    And I should see a text A1 on the page
    And I refresh the page
    And I wait 2 seconds for animation stops
    And I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I should not see a text Name, Last on the page
    And I click add_users
    And I wait 1 seconds for animation stops
    And I click invite_several_users
    And I wait 2 seconds for animation stops
    And I enter AA1 in the first_name_several
    And I enter AA in the last_name_several
    And I enter Name@name in the email_several
    And I enter AA2 in the first_name_several_2
    And I enter AA in the last_name_several_2
    And I enter Name@name in the email_several_2
    And I click save_send_invitation_several
    And I click close_invite_several_users_panel
    And I refresh the page
    And I wait 1 seconds for animation stops
    And I should see a text AA1 on the page
    And I should see a text AA2 on the page
    And I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I enter AA11 in the first_name
    And I enter A in the last_name
    And I enter Name@namename in the email
    And I click edit_user_panel_save_changes
    And I wait 2 seconds for animation stops
    And I should see a text AA11 on the page
    And I should see a text A on the page
    And I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And  I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And I refresh the page
    And I should not see a text AA11 on the page
    And I should not see a text AA2 on the page
    And I wait 1 seconds for animation stops
    And I click edit_user_permission_leave_balance
    And I wait 1 seconds for animation stops
    And I click edit_user_permission_system
    And I wait 1 seconds for animation stops
    And I click edit_user_permission_requests
    And I should see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should see a web element system_check
    And I wait 2 seconds for animation stops
    And I should see a web element requests_check
    And I click edit_user_permission_leave_balance
    And I click edit_user_permission_system
    And I click edit_user_permission_requests
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should not see a web element system_check
    And I wait 1 seconds for animation stops
    Then I should not see a web element requests_check

  @Role
  Scenario: Manage Departments
    When users_page is visible
    And I click users
    And I click departments
    And I enter Active_department in the new_department
    And I click new_department_add
    And I wait 1 seconds for animation stops
    And I should see a text Active_department on the page
    And I click delete_department
    And I wait 1 seconds for animation stops
    And I click confirm_delete
    And I wait 1 seconds for animation stops
    Then I should not see a text Active_department on the page

  @Role
  Scenario: Manage Time-zone groups
    When users_page is visible
    And I click users
    And I click tzg
    And I wait 1 seconds for animation stops
    And I click tzg_field
    And I enter Atlanta in the tzg_search_field
    And I wait 1 seconds for animation stops
    And I click tzg_first_city_in_selector
    And I wait 1 seconds for animation stops
    And I click add_tzg
    And I wait 1 seconds for animation stops
    And I should see a text Atlanta on the page
    And I click tzg_delete
    And I wait 1 seconds for animation stops
    And I click confirm_delete_tzg
    And I wait 1 seconds for animation stops
    Then I should not see a web element city_check

#    Manage Settings

  @Role
  Scenario: Check all settings blocks
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I should see a web element user_groups_settings_block
    And I should see a web element tz_groups_settings_block
    And I should see a web element pto_and_sick_settings_block
    And I should see a web element work_schedule_settings_block
    And I should see a web element schedule_visibility_settings_block
    And I should see a web element ltm_access_settings_block
    Then I should see a web element format_settings_block

  @Role
  Scenario: Select Department Group
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I should see a web element user_group_naming_selector
    And I choose 15 in user_group_naming_selector
    And I click save_button_top
    And I wait 2 seconds for animation stops
    Then I should see a text Location on the page
    And I choose 13 in user_group_naming_selector
    And I click save_button_top

  @Role
  Scenario: Change TZG
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I should see a web element tz_group_selector_textfield
    And I enter Saint Petersburg in the tz_group_selector_textfield
    And I wait 2 seconds for animation stops
    And I click tz_group_search_first_cell
    And I enter Saint-Petersburg in the tz_group_name_field
    And I wait 2 seconds for animation stops
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And tz_group_name_field should have value with Saint-Petersburg
    And I enter New York in the tz_group_selector_textfield
    And I wait 2 seconds for animation stops
    And I click tz_group_search_first_cell
    And I enter New York in the tz_group_name_field
    And I wait 2 seconds for animation stops
    And I click save_button_top
    And I wait 2 seconds for animation stops
    Then tz_group_name_field should have value with New York

  @Role
  Scenario: Select Calendar layout
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I should see a web element tz_group_week_start_day_selector
    And I choose 1 in tz_group_week_start_day_selector
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I choose 2 in tz_group_week_start_day_selector
    And I click save_button_top

  @Role
  Scenario: Change Pto Settings
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I click pto_show_in_hours_radiobutton
    And I click pto_round_balance_checkbox
    And I click pto_rule_reset_balance_checkbox
    And I enter 10 in the pto_rule_reset_balance_textfield
    And I enter 3.5 in the pto_rule_accrue_balance_textfield
    And I enter 100 in the pto_rule_cap_balance_textfield
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And pto_rule_reset_balance_textfield should have value with 10
    And pto_rule_accrue_balance_textfield should have value with 3.5
    And pto_rule_cap_balance_textfield should have value with 100
    And I wait 2 seconds for animation stops
    And I click pto_show_in_days_radiobutton
    And I click pto_round_balance_checkbox
    And I click pto_rule_reset_balance_checkbox
    And I click pto_rule_accrue_balance_checkbox
    And I click pto_rule_cap_balance_checkbox
    And I click pto_default_control_mode_checkbox
    And I click save_button_top

  @Role
  Scenario: Change Sick Settings
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I click sick_show_in_hours_radiobutton
    And I click sick_round_balance_checkbox
    And I enter 10 in the sick_rule_reset_balance_textfield
    And I enter 3.5 in the sick_rule_accrue_balance_textfield
    And I click sick_rule_cap_balance_checkbox
    And I enter 100 in the sick_rule_cap_balance_textfield
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And sick_rule_reset_balance_textfield should have value with 10
    And sick_rule_accrue_balance_textfield should have value with 3.5
    And sick_rule_cap_balance_textfield should have value with 100
    And I wait 2 seconds for animation stops
    And I click sick_show_in_days_radiobutton
    And I click sick_round_balance_checkbox
    And I click sick_rule_reset_balance_checkbox
    And I click sick_rule_accrue_balance_checkbox
    And I click sick_rule_cap_balance_checkbox
    And I click sick_default_control_mode_checkbox
    And I click save_button_top

  @Role
  Scenario: Change work schedule
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I enter 9 in the default_workday_duration_textfield
    And I click save_button_top
    Then default_workday_duration_textfield should have value with 9:00
    And I enter 8 in the default_workday_duration_textfield
    And I click save_button_top

  @Role
  Scenario: Change Access options for LTM
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I click ltm_show_auto_approved_checkbox
    And I click ltm_edit_auto_approved_checkbox
    And I click ltm_show_other_assigned_checkbox
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And ltm_show_auto_approved_checkbox should have checked with true
    And ltm_edit_auto_approved_checkbox should have checked with true
    And ltm_show_other_assigned_checkbox should have checked with true
    And I click ltm_edit_auto_approved_checkbox
    And I click ltm_show_auto_approved_checkbox
    And I click ltm_show_other_assigned_checkbox
    And I click save_button_top
    Then I wait 2 seconds for animation stops

  @Role
  Scenario: Change General settings
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I click user_group_switcher
    And I click tz_group_switcher
    And I click pto_switcher
    And  I click sick_switcher
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I should see a web element save_message_success_text
    And user_group_switcher_value should have value with false
    And tz_group_switcher_value should have value with false
    And pto_switcher_value should have value with false
    And sick_switcher_value should have value with false
    And I click user_group_switcher
    And I click tz_group_switcher
    And I click pto_switcher
    And I click sick_switcher
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I should see a web element save_message_success_text
    And user_group_switcher_value should have value with true
    And tz_group_switcher_value should have value with true
    And pto_switcher_value should have value with true
    Then sick_switcher_value should have value with true

  @Role
  Scenario: Change Number Formats
    When general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible
    And I should see a web element decimal_separator_selector
    And I choose -custom_value- in decimal_separator_selector
    And I enter ' in the decimal_separator_textfield
    And I choose -custom_value- in digit_grouping_symbol_selector
    And I enter ; in the digit_grouping_symbol_textfield
    And I click save_button_top
    Then I wait 2 seconds for animation stops
    And pto_rule_accrue_balance_textfield should have value with 0'44
    And I choose . in decimal_separator_selector
    And I choose   in digit_grouping_symbol_selector
    And I click save_button_top

  @Role
  Scenario: Manage Leave Types
    When general_page is visible
    And I click settings_button
    And I click leave_types_button
    And leave_types_page is visible
    And I wait 1 seconds for animation stops
    And I click create_leave_type_button
    And I should see a web element leave_type_pop_up
    And I enter Leave Type Smoke in the leave_type_name
    And I click commit_create_button
    And I wait 2 seconds for animation stops
    And I should see a text Leave Type Smoke on the page
    And I click on leave type text Leave Type Smoke
    And I wait 2 seconds for animation stops
    And I enter Leave Type Smoke Changed in the input_name_field
    And I click apply_button
    And I wait 2 seconds for animation stops
    And I should see a text Leave Type Smoke Changed on the page
    And I refresh the page
    And I click order_button
    And I wait 2 seconds for animation stops
    And moved_order should contain 7
    And I remove leave type with name Leave Type Smoke Changed
    And I accept alert menu
    And I wait 2 seconds for animation stops
    And I refresh the page
    And I wait 2 seconds for animation stops
    Then I should not see a text Leave Type Smoke Changed on the page

  @Role
  Scenario: Manage email notifications
    When general_page is visible
    And I click settings_button
    And I click ap_notifications_button
    And ap_notification_page is visible
    And I enter 3 in the reminder_days_textfield
    And I enter 12:00 PM in the reminder_at_textfield
    And I enter aP Prefix in the message_prefix_textfield
    And I enter aP Footer in the message_footer_textfield
    And I enter rd_dev@actimind.com in the admin_mail_address_textfield
    And I click save_button_bottom
    And I wait 2 seconds for animation stops
    And notify_new_ltr_checkbox should have checked with true
    And notify_modified_ltr_checkbox should have checked with true
    And notify_deleted_ltr_checkbox should have checked with true
    And notify_status_changed_ltr_checkbox should have checked with true
    And notify_waiting_ltr_checkbox should have checked with true
    And reminder_days_textfield should have value with 3
    And reminder_at_textfield should have value with 12:00 PM
    And notify_users_on_ltr_changed_checkbox should have checked with true
    And notify_users_on_ltr_new_or_deleted_checkbox should have checked with true
    And message_prefix_textfield should have value with aP Prefix
    And message_footer_textfield should have value with aP Footer
    And admin_mail_address_textfield should have value with rd_dev@actimind.com
    And I wait 2 seconds for animation stops
    And I click notify_new_ltr_checkbox
    And I click notify_modified_ltr_checkbox
    And I click notify_deleted_ltr_checkbox
    And I click notify_status_changed_ltr_checkbox
    And I click notify_waiting_ltr_checkbox
    And I click notify_users_on_ltr_changed_checkbox
    And I click notify_users_on_ltr_new_or_deleted_checkbox
    And I click save_button_bottom
    Then I wait 2 seconds for animation stops

  @Role
  Scenario: Manage Logo and color scheme
    When general_page is visible
    And I click settings_button
    And I click logo_color_scheme_button
    And logo_color_scheme_page is visible
    And I click purple_color
    And  I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element selected_purple_color
    And I click default_color
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should not see a web element selected_purple_color
    And I click custom_logo_radiobutton
    And I upload /gif.gif from resources in choose_logo_file
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element keep_logo_radiobutton
    And I click default_logo_radiobutton
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element keep_logo_radiobutton

  @Role
  Scenario: Manage Licenses
    When general_page is visible
    And I click settings_button
    And I click licenses_button
    And license_page is visible
    And I wait 2 seconds for animation stops
    And I should see a web element active_license
    And I wait 2 seconds for animation stops
    And I click contact_support_button
    And I wait 2 seconds for animation stops
    And I should see a web element contact_support_popup
    And I click contact_support_popup_close_button
    And I wait 2 seconds for animation stops
    And I should not see a web element contact_support_popup
    And I wait 2 seconds for animation stops
    And I click addons_button
    And I click integration_actitime_button
    And I wait 2 seconds for animation stops
    Then I should see a web element integration_popup

#    Reports interface

  @Role
  Scenario: Reports
    When general_page is visible
    And I am on reports page
    And aP_reports_page is visible
    And I click past_leaves_calendar_tab
    And I refresh the page
    And I should see a web element leave_time_table
    And I should see a web element single_month_calendar
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    And I search report Past-Leaves-Calendar-Manage_Users_and_Settings_aP-Role with the extension pdf in downloads folder
    And I click balance_history_tab
    And I refresh the page
    And I click export_button
    And I click export_pdf
    And I wait 2 seconds for animation stops
    Then I search report PTO-History-Manage_Users_and_Settings_aP-Role with the extension pdf in downloads folder
