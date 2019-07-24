Feature: Manage Cost and Billing Data Role

  Background:
    Given I am logged in as manage cost and billing data role
    And general_page is visible

  @Role
  Scenario: Login in aT
    When I wait 1 seconds for animation stops
    And I should not see a web element enter_tt
    And I should not see a web element settings_button
    And I should see a web element tasks
    And I should see a web element reports
    Then I should see a web element user_list

  @Role
  Scenario: Tasks interface, customer
    When tasks_page is visible
    And scope_label should contain My Tasks
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
    Then I should not see a web element customer_managers_add
    
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
    Then I should not see a web element project_managers_add
    
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
    And I click type_of_work
    And I click non_billable_in_selector
    And I wait 1 seconds for animation stops
    And type_of_work should have title with Non-Billable
    And I click task_reported_time_tab
    And I wait 1 seconds for animation stops
    And I click other_users_reported_time_tab
    And I should not see a web element other_user_row_reported_time_tab
    And I should see a web element no_data_reported_time_tab
    And I click task_users_tab
    And I wait 1 seconds for animation stops
    And I should not see a web element task_users_assign
    And I click task_managers
    And I wait 1 seconds for animation stops
    Then I should not see a web element task_managers_add

  @Role
  Scenario: Task interface, task in WA
    When I am logged in as admin
    And general_page is visible
    And I click user_list
    And user_list_page is visible
    And I click user_manage_cost_role
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click enter_tt_edit_user
    And I wait 1 seconds for animation stops
    And I am logged in as manage cost and billing data role
    And general_page is visible
    And I click tasks
    And tasks_page is visible
    And I click architects_bureau_left_panel
    And I wait 1 seconds for animation stops
    And I click first_task_in_list
    And I wait 1 seconds for animation stops
    And I should not see a web element task_actions
    And I click task_status_edit_panel
    And I click edit_task_2nd_status
    And I wait 1 seconds for animation stops
    And task_status_edit_panel should contain Ready for Review
    And I click edit_task_name
    And I should not see a web element task_name_field
    And I click type_of_work
    Then I should not see a web element non_billable_in_selector
    And I am logged in as admin
    And general_page is visible
    And I click user_list
    And user_list_page is visible
    And I click user_manage_cost_role
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click enter_tt_edit_user

  @Role
  Scenario Outline: Reports interface, reports
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | staff_performance_button  | Staff Performance Smoke         | staffperformance.do  | staffperformanceresults.do  |
      | time_track_detail_button  | Time Track In Detail Smoke      | commentsreport.do    | commentsreportresults.do    |
      | estimated_button          | Estimated vs. Actual Time Smoke | estimatedvsactual.do | estimatedvsactualresults.do |
      | billing_summary_button    | Billing Summary Smoke           | billingsummary.do    | billingsummaryresults.do    |
      | invoice_export_button     | Invoice Smoke                   | invoice.do           | invoiceresults.do           |
      | cost_of_work_button       | Cost of Work Smoke              | cost.do              | costresults.do              |
      | profit_loss_button        | Profit Loss Smoke               | profitloss.do        | profitlossresults.do        |
    
    When I click reports
    And reports_page is visible
    And I click new_report_button
    And I wait 1 seconds for animation stops
    And I should see a web element choose_report_window
    And I should not see a web element leave_time_balance_button
    And I should not see a web element time_balance_button
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
      | Cost of work           | Cost of work Smoke           |
      | Billable amounts       | Billable amounts Smoke       |

    When I click reports
    And reports_page is visible
    And I click create_chart_button
    And I wait 2 seconds for animation stops
    And I click show_selector_button
    And I wait 2 seconds for animation stops
    And I should not see a web element leave_hours_chart_in_selector
    And I should not see a web element pto_balance_chart_in_selector
    And I should not see a web element sick_days_balance_chart_in_selector
    And I should not see a web element overtime_hours_chart_in_selector
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
  Scenario: User list, user panel permissions
    When I click user_list
    And user_list_page is visible
    And I should not see a web element pto_tab
    And I should not see a web element work_assignments_tab
    And I should not see a web element sick_days_tab
    And I click user_cruz_gordman
    And I wait 1 seconds for animation stops
    And I should not see a web element email_field_edit_user
    And I click user_entertt_role
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click manage_accounts_edit_user
    And manage_accounts_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click modify_tt_edit_user
    And modify_tt_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click manage_scope_perm_edit_user
    And manage_scope_perm_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click manage_cost_edit_user
    And manage_cost_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click enter_tt_edit_user
    And enter_tt_edit_user should have class with userPanel_permissionRow disabled active
    And I click lock_tt_edit_user
    And lock_tt_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click manage_balances_edit_user
    And manage_balances_edit_user should have class with userPanel_permissionRow inactive disabled
    And I click manage_settings_edit_user
    Then manage_settings_edit_user should have class with userPanel_permissionRow inactive disabled

  @Role
  Scenario: User list, edit user
    When I click user_list
    And user_list_page is visible
    And I click user_entertt_role
    And I wait 1 seconds for animation stops
    And I should not see a web element reset_password
    And I click access_at_switcher
    And I wait 1 seconds for animation stops
    And access_at_switcher should have class with components_switcher small disabled on animated
    And I should not see a web element dept_selector_edit_user
    And I should not see a web element tzg_selector_edit_user
    And I should not see a web element hire_date_edit_user
    And I should not see a web element release_date_edit_user
    And I should not see a web element delete_release_date_edit_user
    And I click tt_approval_switcher
    And tt_approval_switcher should have class with components_switcher small disabled on animated
    And I should not see a web element default_schedule_chkbx
    And I should not see a web element new_schedule
    And I should not see a web element delete_schedule_edit_user
    And I should not see a web element overtime_selector_edit_user
    And I click add_rate_edit_user
    And I wait 1 seconds for animation stops
    And I click cost_rate_table
    And I should see a web element first_rate_regular
    And I click add_rate_edit_user
    And I wait 1 seconds for animation stops
    And I click delete_second_row_rate
    And I wait 1 seconds for animation stops
    Then I should not see a web element second_rate_regular

  @Role
  Scenario: Accounting features are off
    When I wait 1 seconds for animation stops
    And I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible
    And I click features_user_rates_cost
    And I click features_types_of_work
    And I wait 1 seconds for animation stops
    And I am logged in as manage cost and billing data role
    And general_page is visible
    And My current URL should contain /accessdenied.jsp
    And I should not see a web element time_track
    And I should not see a web element settings_button
    And I should not see a web element tasks
    And I should not see a web element reports
    And I click user_list
    And user_list_page is visible
    And I wait 2 seconds for animation stops
    And I should not see a web element pto_tab
    And I should not see a web element work_assignments_tab
    And I should not see a web element sick_days_tab
    And I click user_entertt_role
    And I wait 1 seconds for animation stops
    Then I should not see a web element email_field_edit_user

  @Role
  Scenario: User list unavailable
    When I wait 1 seconds for animation stops
    And I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_hide_not_assigned_users
    And I click gs_save
    And I wait 1 seconds for animation stops
    And I am logged in as manage cost and billing data role
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

  @Role
  Scenario: Tasks interface, DAR 1st checkbox is selected
    When I wait 1 seconds for animation stops
    And I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_see_all_tt
    And I wait 1 seconds for animation stops
    And I click gs_dar_see_all_tt_selector
    And I click gs_dar_see_all_tt_selector_manage_cost_role
    And I click gs_dar_see_all_tt_selector_apply
    And I click gs_save
    And I wait 1 seconds for animation stops
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible
    And I click features_user_rates_cost
    And I click features_hourly_billing
    And I wait 1 seconds for animation stops
    And I am logged in as manage cost and billing data role
    And general_page is visible
    And I click tasks
    And tasks_page is visible
    And I click administration_left_panel
    And I wait 1 seconds for animation stops
    And I click first_task_in_list
    And I wait 1 seconds for animation stops
    And I click task_reported_time_tab
    And I wait 1 seconds for animation stops
    And I click other_users_reported_time_tab
    Then I should see a web element other_users_reported_time_tab
