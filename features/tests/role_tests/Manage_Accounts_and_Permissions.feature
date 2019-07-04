Feature: Manage Accounts and Permissions Role

  Background:
    Given I am logged in as manage accounts
    And general_page is visible

  @Role
  Scenario: Login in aT
    When I wait 1 seconds for animation stops
    And I should not see a web element enter_tt
    And I should not see a web element settings_button
    And I should see a web element tasks
    And I should see a web element reports
    And I should see a web element switch_product
    Then I should see a web element user_list

  @Role
  Scenario: Tasks interface, customer
    When tasks_page is visible
    And I should not see a web element add new
    And I click our_company_left_panel
    And I click gear_left_panel
    And I wait 1 seconds for animation stops
    And I should not see a web element customer_actions
    And I click customer_status
    And I should not see a web element archive_customer
    And I click customer_users
    And I should not see a web element customer_users_assign
    And I click customer_managers
    And I click customer_managers_add
    And I click cruz_in_selector
    And I click close_selector
    And I wait 1 seconds for animation stops
    And deletable_manager_title should contain Gordman Cruz
    And I click delete_manager
    And I wait 1 seconds for animation stops
    And I should see a text Gordman Cruz no longer manages the customer but still has it in the personal work assignments. on the page
    Then I should not see a web element deletable_manager_title

  @Role
  Scenario: Tasks interface, project
    When tasks_page is visible
    And I click administration_left_panel
    And I wait 1 seconds for animation stops
    And I should not see a web element add_task
    And I click gear_left_panel
    And I wait 1 seconds for animation stops
    And I should not see a web element project_actions
    And I click project_status
    And I should not see a web element archive_project
    And I click project_users
    And I should not see a web element project_users_assign
    And I click project_managers
    And I click project_managers_add
    And I click cruz_in_selector
    And I click close_selector
    And I wait 1 seconds for animation stops
    And deletable_manager_title should contain Gordman Cruz
    And I click delete_manager
    And I wait 1 seconds for animation stops
    And I should see a text Gordman Cruz no longer manages the project but still has it in the personal work assignments. on the page
    Then I should not see a web element deletable_manager_title

  @Role
  Scenario: Tasks interface, task
    When tasks_page is visible
    And I click administration_left_panel
    And I wait 1 seconds for animation stops
    And I click first_task_status
    And I click first_open_status_list
    And I wait 1 seconds for animation stops
    And first_task_status should contain In Progress
    And I click first_task_in_list
    And I wait 1 seconds for animation stops
    And I should not see a web element task_actions
    And I click task_status_edit_panel
    And I click edit_task_2nd_status
    And I wait 1 seconds for animation stops
    And task_status_edit_panel should contain Ready for Review
    And I click edit_task_name
    And I should not see a web element task_name_field
    And I click task_users_tab
    And I should not see a web element task_users_assign
    And I click task_managers
    And I click task_managers_add
    And I click cruz_in_selector
    And I click close_selector
    And I wait 1 seconds for animation stops
    And deletable_manager_title should contain Gordman Cruz
    And I click delete_manager
    And I wait 1 seconds for animation stops
    And I should see a text Gordman Cruz no longer manages the task but still has it in the personal work assignments. on the page
    Then I should not see a web element deletable_manager_title
    
  @Role
  Scenario Outline: Reports interface, reports
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | staff_performance_button  | Staff Performance Smoke         | staffperformance.do  | staffperformanceresults.do  |
      | time_balance_button       | Time Balance and Overtime Smoke | overtime.do          | overtimeresults.do          |
      | leave_time_balance_button | Leave Time and Balances Smoke   | leaves.do            | leavesresults.do            |
      | time_track_detail_button  | Time Track In Detail Smoke      | commentsreport.do    | commentsreportresults.do    |
      | estimated_button          | Estimated vs. Actual Time Smoke | estimatedvsactual.do | estimatedvsactualresults.do |

    When I click reports
    And reports_page is visible
    And I click new_report_button
    And I wait 1 seconds for animation stops
    And I should not see a web element billing_summary_button
    And I should not see a web element invoice_export_button
    And I should not see a web element cost_of_work_button
    And I should not see a web element profit_loss_button
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<prev_report_url>
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<report_url>
    And I click add_to_dashboard_button
    And I enter <report_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    Then report_name should contain <report_name>

  @Role
  Scenario Outline: Reports interface, charts
    Examples: <chart_name>
      | chart                  | chart_name                   |
      | Total working hours    | Total working hours Smoke    |
      | Approved working hours | Approved working hours Smoke |
      | Leave hours            | Leave hours Smoke            |
      | PTO Balance            | PTO Balance Smoke            |
      | Sick Days Balance      | Sick Days Balance Smoke      |
      | Overtime hours         | Overtime hours Smoke         |

    When I click reports
    And reports_page is visible
    And I click create_chart_button
    And I wait 2 seconds for animation stops
    And I click show_selector_button
    And I wait 2 seconds for animation stops
    And I should not see a web element cost_of_work_chart_in_selector
    And I should not see a web element billable_amounts_chart_in_selector
    And I select <chart> in chart selector
    And I click add_to_dashboard_button
    And I enter <chart_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    And report_name should contain <chart_name>
    And I click close_chart_button
    And I wait 2 seconds for animation stops
    Then I should see a text <chart_name> on the page

  @Role
  Scenario: User List
    When I click user_list
    And user_list_page is visible
    And I should not see a web element pto_tab
    And I should not see a web element work_assignments_tab
    Then I should not see a web element sick_days_tab

  @Role
  Scenario: Creating and deleting new user
    When I click user_list
    And user_list_page is visible
    And I click new_user_button
    And I enter TestName in the first_name_field
    And I enter TestLastName in the last_name_field
    And I enter test@test in the email_field
    And I wait 1 seconds for animation stops
    And I click save_send_invitation_button
    And I wait 2 seconds for animation stops
    And I should see a text Account for TestName TestLastName has been created. on the page
    And I should see a text The invitation has been sent to the user's email address: test@test on the page
    And I click close_add_user_panel
    And I should see a web element new_test_user
    And I click new_test_user
    And I click delete_user_button
    And I accept alert menu
    And I wait 2 seconds for animation stops
    Then I should not see a web element new_test_user

  @Role
  Scenario: Edit user permissions
    When I click user_list
    And user_list_page is visible
    And I click user_cruz_gordman
    And I click permissions_tab
    And I click manage_accounts_edit_user
    And I wait 2 seconds for animation stops
    And manage_users_icon_selected should have class with icon manageUsers
    And team_scope_edit_user should have class with userPanelScopeCell all disabled highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell all disabled highlighted
    And team_scope_selected should contain All users
    And manage_scope_selected should contain Entire scope
    And I click manage_accounts_edit_user
    And I wait 2 seconds for animation stops
    And manage_users_icon_selected should have class with icon manageUsers inactive
    And manage_accounts_edit_user should have class with userPanel_permissionRow inactive
    And team_scope_edit_user should have class with userPanelScopeCell selected highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell selected highlighted
    And team_scope_selected should contain 3 users
    And manage_scope_selected should contain Part of scope
    And I click modify_tt_edit_user
    And I wait 2 seconds for animation stops
    And modify_tt_icon_selected should have class with icon modifyTT inactive
    And modify_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_scope_perm_edit_user
    And I wait 2 seconds for animation stops
    And manage_scope_icon_selected should have class with icon manageScope inactive
    And manage_scope_perm_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_cost_edit_user
    And I wait 2 seconds for animation stops
    And manage_cost_icon_selected should have class with icon costReports inactive
    And manage_cost_edit_user should have class with userPanel_permissionRow inactive
    And team_scope_edit_user should have class with userPanelScopeCell notAllowed disabled highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell notAllowed disabled highlighted
    And team_scope_selected should contain –
    And manage_scope_selected should contain –
    And I click enter_tt_edit_user
    And I wait 1 seconds for animation stops
    And enter_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click lock_tt_edit_user
    And I wait 1 seconds for animation stops
    And lock_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_balances_edit_user
    And I wait 1 seconds for animation stops
    And manage_balances_edit_user should have class with userPanel_permissionRow active
    And I click manage_settings_edit_user
    And I wait 1 seconds for animation stops
    And manage_settings_edit_user should have class with userPanel_permissionRow active
    And I click permission_info
    And I wait 1 seconds for animation stops
    And I should see a web element permission_info_popup
    And I click permission_info_popup_close
    And I wait 1 seconds for animation stops
    Then I should not see a web element permission_info_popup

  @Role
  Scenario: Edit user account settings
    When I click user_list
    And user_list_page is visible
    And I click user_cruz_gordman
    And I wait 1 seconds for animation stops
    And I send 123 without clear in the username_field_edit_user
    And I send 123 without clear in the email_field_edit_user
    And I click reset_password
    And I click confirm_reset_password
    And I wait 1 seconds for animation stops
    And I should see a text The password for Gordman Cruz has been reset. on the page
    And I click close_reset_password
    And I click access_at_switcher
    And I wait 1 seconds for animation stops
    And access_at_switcher should have class with components_switcher small animated off
    And I should see a web element gordman_inactive
    And I click access_at_switcher
    And I wait 1 seconds for animation stops
    And access_at_switcher should have class with components_switcher small animated on
    And I should not see a web element gordman_inactive
    And I click access_ap_switcher
    And I wait 1 seconds for animation stops
    And access_ap_switcher should have class with components_switcher small animated off
    And I should not see a web element gordman_ap_access_icon
    And I click access_ap_switcher
    And I wait 1 seconds for animation stops
    And access_ap_switcher should have class with components_switcher small animated on
    And I should see a web element gordman_ap_access_icon
    And I click dept_selector_edit_user
    And I click new_dept_in_selector
    And I enter Dept New in the new_dept_field_edit_user
    And I click create_dept_edit_user
    And I wait 1 seconds for animation stops
    And dept_selector_edit_user should contain Dept New
    And I click tzg_selector_edit_user
    And I click new_tzg_in_selector
    And I enter Moskva in the tzg_search_field_edit_user
    And I wait 1 seconds for animation stops
    And I click moskva_in_city_selector
    And I wait 1 seconds for animation stops
    And I click create_tzg_edit_user
    And I wait 1 seconds for animation stops
    And tzg_selector_edit_user should contain Moskva
    And gordman_time_zone should contain Moskva
    And I click hire_date_edit_user
    And I click hire_date_28_calendar
    And I wait 1 seconds for animation stops
    And I click confirm_hire_date
    And I wait 1 seconds for animation stops
    And hire_date_edit_user should contain Feb 28, 2019
    And I click release_date_edit_user
    And I click today_calendar
    And I wait 1 seconds for animation stops
    And I click delete_release_date_edit_user
    And I wait 1 seconds for animation stops
    And release_date_edit_user should contain Select date
    And I click tt_approval_switcher
    And I wait 1 seconds for animation stops
    And I click tt_approval_managers
    And I should see a web element approvers_pop_up
    And tt_approval_switcher should have class with components_switcher small animated on
    And I click tt_approval_switcher
    And I wait 1 seconds for animation stops
    And I should not see a web element tt_approval_managers
    And tt_approval_switcher should have class with components_switcher small animated off
    And I enter 1 in the work_schedule_first_cell
    And I wait 1 seconds for animation stops
    And total_cell_schedule_edit_user should contain 34:00
    And I click default_schedule_chkbx
    And I wait 1 seconds for animation stops
    And work_schedule_first_cell should have class with disabled
    And I click new_schedule
    And I wait 1 seconds for animation stops
    And I should see a web element current_schedule_edit_user
    And I click delete_schedule_edit_user
    And I click confirm_delete
    And I wait 1 seconds for animation stops
    And I should not see a web element current_schedule_edit_user
    And I click overtime_selector_edit_user
    And I click auto_hidden_overtime_selector
    And I wait 1 seconds for animation stops
    And overtime_selector_edit_user should contain automatically
#    Нужен шаг для скролла панели, чтобы элементы были видимы
#    And I click add_rate_edit_user
#    And I wait 1 seconds for animation stops
#    And I should see a web element second_rate_regular
#    And I click delete_second_row_rate
#    And I wait 1 seconds for animation stops
#    And I should not see a web element second_rate_regular
    And I send 123 without clear in the edit_first_name_field
    And I wait 1 seconds for animation stops
    And I send 123 without clear in the edit_last_name_field
    And I click close_panel_button
    And I wait 1 seconds for animation stops
    Then I should see a web element edited_cruz_gordman

  @Role
  Scenario: Bulk invitations
    When I click user_list
    And user_list_page is visible
    And I click bulk_invitations_button
    And I enter user1 in the bulk_first_name_field1
    And I enter user1 in the bulk_last_name_field1
    And I enter 1@1 in the bulk_email_field1
    And I enter user2 in the bulk_first_name_field2
    And I enter user2 in the bulk_last_name_field2
    And I enter 2@2 in the bulk_email_field2
    And I click send_invitations_button
    And I wait 2 seconds for animation stops
    And I should see a text Invitations have been sent to the following users: on the page
    And I should see a text user1 user1 (1@1) on the page
    And I should see a text user2 user2 (2@2) on the page
    And I click close_bulk_button
    And I should see a web element user1
    Then I should see a web element user2

  @Role
  Scenario: Editing access to users
    When I click user_list
    And user_list_page is visible
    And I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click access_to_users
    And I click access_to_all_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    And access_to_users should contain All users
    And I click access_to_users
    And I click no_access_to_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    And access_to_users should contain No Access
    And I click access_to_users
    And I wait 1 seconds for animation stops
    And I click custom_access_to_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    Then access_to_users should contain - Not selected -

  @Role
  Scenario: Editing access to scope of work
    When I click user_list
    And user_list_page is visible
    And I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I click access_to_scope
    And I wait 1 seconds for animation stops
    And I click no_access_to_scope
    And I click access_to_scope_back_button
    And I wait 2 seconds for animation stops
    And access_to_scope_label should contain No Access
    And I click access_to_scope_label
    And I wait 1 seconds for animation stops
    And I click entire_access_to_scope
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    And access_to_scope_label should contain Entire scope
    And I click access_to_scope_label
    And I wait 1 seconds for animation stops
    And I click custom_access_to_scope
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    Then I should see a web element tasks_counter_scope

    @Role
  Scenario: Creating and deleting new time zone group
    When I click user_list
    And user_list_page is visible
    And I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I enter Washington in the time_zone_search_field
    And I click first_city_in_selector
    And I wait 1 seconds for animation stops
    And I click add_time_zone_button
    And I should see a web element Washington_time_zone_group
    And I click delete_Washington_button
    And I click confirm_delete_group_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element Washington_time_zone_group

  @Role
  Scenario: Editing time zone group name
    When I click user_list
    And user_list_page is visible
    And I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click London_time_zone_group
    And I enter LONDON TEST in the London_time_zone_name_field
    And I click accept_edit_London_tzg_button
    And I wait 2 seconds for animation stops
    Then London_time_zone_group should have title with LONDON TEST

  @Role
  Scenario: Editing time zone group users
    When I click user_list
    And user_list_page is visible
    And I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click Sydney_office_group
    And I wait 1 seconds for animation stops
    And I click select_all_button_tzg
    And I click move_to_button
    And I click default_tzg_in_selector
    And I wait 2 seconds for animation stops
    And I should see a text There are no users in the "Sydney Office" time zone group on the page
    And I click first_tzg_in_group_list
    And I click select_all_button_tzg
    And I click move_to_button
    Then I click sydney_tzg_in_selector

  @Role
  Scenario: Creating and deleting new department
    When I click user_list
    And user_list_page is visible
    And I click manage_groups_selector
    And I click departments_in_selector
    And I enter Test Dept in the new_dept_textfield
    And I wait 2 seconds for animation stops
    And I click add_new_dept_button
    And I should see a web element test_dept
    And I click delete_test_dept_button
    And I click confirm_delete_group_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element test_dept

  @Role
  Scenario: Editing users in department
    When I click user_list
    And user_list_page is visible
    And I click manage_groups_selector
    And I click departments_in_selector
    And I click administration_dept
    And I wait 1 seconds for animation stops
    And I click select_all_button_depts
    And I click move_to_button
    And I click first_in_depts_move_to_selector
    And I wait 2 seconds for animation stops
    And I should see a text "Administration" department contains only users with disabled access on the page
    And I click users_wo_dept
    And I click select_all_button_depts
    And I click move_to_button
    Then I click first_in_depts_move_to_selector