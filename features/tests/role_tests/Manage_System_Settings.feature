Feature: Manage System Settings Role

 Background:
    Given I am logged in as settingsat
    And general_page is visible
    And I click settings_button

  @role
  Scenario: Settings On/Off
    When I click features
    And features_page is visible
    And I click features_future_days
    And I wait 1 seconds for animation stops
    And I click features_leave_time
    And I click features_pto_balance
    And I click features_sick_balance
    And I click features_overtime
    And I click features_tt_approval
    And I click features_departments
    And I click features_tzg
    And I click features_task_estimates
    And I click features_task_workflow
    And I wait 1 seconds for animation stops
    And I click features_work_assignments
    And I click features_user_rates_cost
    And I click features_types_of_work
    And I should see a web element features_status_off
    And I click features_future_days
    And I click features_leave_time
    And I click features_pto_balance
    And I click features_sick_balance
    And I click features_overtime
    And I click features_tt_approval
    And I click features_departments
    And I click features_tzg
    And I click features_task_estimates
    And I click features_task_workflow
    And I wait 1 seconds for animation stops
    And I click features_work_assignments
    And I click features_user_rates_cost
    And I click features_types_of_work
    And I click features_hourly_billing
    Then I should see a web element features_status_on


  @role
  Scenario: General settings: customer naming
    When I click general_settings
    And general_settings_page is visible
    And i click gs_naming_customer
    And i click gs_naming_customer_custom_name
    And I enter Custom Customer in the gs_naming_customer_custom_name_singular
    And I enter Customs Customers in the gs_naming_customer_custom_name_plural
    And i click gs_save
    And i click gs_naming_customer
    And i click gs_naming_customer_default_name
    Then i click gs_save

  @role
  Scenario: General settings: project naming
    When I click general_settings
    And general_settings_page is visible
    And i click gs_naming_project
    And i click gs_naming_project_name_job
    And i click gs_save
    And i should see a text Job on the page
    And i click gs_naming_project
    And i click gs_naming_project_default_name
    Then i click gs_save

  @role
  Scenario: General settings: task naming
    When I click general_settings
    And general_settings_page is visible
    And i click gs_naming_task
    And i click gs_naming_task_name_subtask
    And i click gs_save
    And I should see a text Subtask on the page
    And i click gs_naming_task
    And i click gs_naming_task_default_name
    Then i click gs_save

  @role
  Scenario: General settings: user groups naming
    When I click general_settings
    And general_settings_page is visible
    And i click gs_naming_user_groups
    And i click gs_naming_user_groups_name_location
    And i click gs_save
    And I should see a text Location on the page
    And i click gs_naming_user_groups
    And i click gs_naming_user_groups_default_name
    Then i click gs_save

  @role
  Scenario: General settings: calendar layout
    And I click general_settings
    And general_settings_page is visible
    When i click gs_data_settings_calendar
    And i click gs_data_settings_calendar_sunday
    And i click gs_save
    And I should see a text Sunday on the page
    And i click gs_data_settings_calendar
    And i click gs_data_settings_calendar_default_name
    Then i click gs_save

  @role
  Scenario: General settings: time zone group
    When I click general_settings
    And general_settings_page is visible
    And I enter Boston in the gs_data_settings_tzg
    And i click gs_data_settings_tzg_boston
    And i click gs_save
    And i should see a text Boston on the page
    And i enter New York in the gs_data_settings_tzg
    And i click gs_data_settings_tzg_new_york
    And i click gs_save
    Then i should see a text New York on the page

  @role
  Scenario: General settings: maximum reported hours
    When I click general_settings
    And general_settings_page is visible
    And i click gs_work_schedule_hours_per_day_unlimited
    And i click gs_save
    And i click gs_work_schedule_hours_per_day_limit
    Then i click gs_save


  @role
  Scenario: General settings: work schedule
    When I click general_settings
    And general_settings_page is visible
    And I enter 8:30 in the gs_work_schedule
    And i click gs_save
    And i should see a text 8:30 on the page
    And i enter 8:00 in the gs_work_schedule
    Then i click gs_save

  @role
  Scenario: General settings: pto balance
    When I click general_settings
    And general_settings_page is visible
    And I enter 2.5 in the gs_pto_accrue
    And i click gs_save
    And i should see a text 2.5 on the page
    And i enter 2 in the gs_pto_accrue
    Then i click gs_save

  @role
  Scenario: General settings: sick balance
    And I click general_settings
    And general_settings_page is visible
    And I enter 1.5 in the gs_sick_accrue
    And i click gs_save
    And i should see a text 1.5 on the page
    And i enter 1 in the gs_sick_accrue
    Then i click gs_save

  @role
  Scenario: General settings: overtime settings
    When I click general_settings
    And general_settings_page is visible
    And I enter 1.5 in the gs_sick_accrue
    And i click gs_save
    And i should see a text 1.5 on the page
    And i enter 1 in the gs_sick_accrue
    Then i click gs_save

  @role
  Scenario: General settings: data access restrictions
    When I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_see_all_tt
    And i click gs_dar_see_all_tt_selector
    And i click gs_dar_see_all_tt_selector_entertt_role
    And i click gs_dar_see_all_tt_selector_apply
    And i click gs_save
    And I perform select in the gs_dar_hide_tt_lock_tt
    And I perform deselect in the gs_dar_hide_tt_from_managers
    And I perform select in the gs_dar_hide_not_assigned_users
    And I perform select in the gs_dar_allow_manager_modify_tt_users
    And I perform select in the gs_dar_see_all_tt
    And i click gs_dar_see_all_tt_selector
    And i click gs_dar_see_all_tt_selector_entertt_role
    And i click gs_dar_see_all_tt_selector_apply
    And i perform deselect in the gs_dar_see_all_tt
    And I perform deselect in the gs_dar_hide_tt_lock_tt
    And I perform select in the gs_dar_hide_tt_from_managers
    And I perform deselect in the gs_dar_hide_not_assigned_users
    And I perform deselect in the gs_dar_allow_manager_modify_tt_users
    Then i click gs_save

  @role
  Scenario: General settings: notification
    When I click general_settings
    And general_settings_page is visible
    And I enter test in the gs_message_footer
    And i click gs_send_test_message
    And I wait 2 seconds for animation stops
    And I should see a text Test message was successfully sent to demodata@actitime.com on the page
    Then i click gs_save

  @role
  Scenario: Workflow statuses for open tasks: create
    When I click workflow_settings
    And workflow_settings_page is visible
    And i click workflow_settings_add_open
    And i enter test_status in the workflow_settings_add_new_name
    And i click workflow_settings_apply
    Then i should see a web element workflow_settings_name_check

  @role
  Scenario: Workflow statuses for open tasks: move
    When I click workflow_settings
    And workflow_settings_page is visible
    And I wait 1 seconds for animation stops
    And I drag gs_workflow_settings_workflow_open_status by offset 0, -100
    And I wait 1 seconds for animation stops
    Then I drag gs_workflow_settings_workflow_open_status by offset 0, 100

  @role
  Scenario: Workflow statuses for open tasks: delete
    When I click workflow_settings
    And workflow_settings_page is visible
    And i click workflow_settings_delete_status
    And I wait 1 seconds for animation stops
    And i click workflow_settings_delete_status_apply
    And I wait 1 seconds for animation stops
    Then i should not see a web element workflow_settings_name_check

  @role
  Scenario: Workflow statuses for completed tasks: create
    When I click workflow_settings
    And workflow_settings_page is visible
    And i click workflow_settings_add_close
    And i enter test_status_completed in the workflow_settings_add_new_name
    And i click workflow_settings_apply
    Then i should see a web element workflow_settings_name_check

  @smoke
  Scenario: Workflow statuses for completed tasks: move
    When I click workflow_settings
    And workflow_settings_page is visible
    And I wait 1 seconds for animation stops
    And I drag gs_workflow_settings_workflow_completed_status by offset 0, -100
    Then I drag gs_workflow_settings_workflow_completed_status by offset 0, 100

  @role
  Scenario: Workflow statuses for completed tasks: delete
    When I click workflow_settings
    And workflow_settings_page is visible
    And i click workflow_settings_delete_completed_status
    And i click workflow_settings_delete_completed_status_apply
    And I wait 1 seconds for animation stops
    Then i should not see a web element workflow_settings_name_check


  @role
  Scenario: Types of Work: create
    When I click types_of_work
    And types_of_work_page is visible
    And  i click type_of_work_create
    And I enter test_type in the type_of_work_add_new_name
    And i click type_of_work_create_popup
    Then I should see a web element type_of_work_add_new_name_check

  @role
  Scenario: Types of Work: edit in table
    When I click types_of_work
    And types_of_work_page is visible
    And i click type_of_work_edit_status_to_archived
    And i click type_of_work_edit_status_to_active
    And i click type_of_work_edit_category
    And i click type_of_work_edit_order_up
    And I should see a web element type_of_work_edit_order_down
    Then i click type_of_work_edit_order_down

  @role
  Scenario: Filter status: active and nonbillable
    When I click types_of_work
    And types_of_work_page is visible
    And i click type_of_work_filter_active_only
    And i click type_of_work_filter_nonbillable_only
    And i click type_of_work_show_types_of_work
    Then I should not see a text design on the page

  @role
  Scenario: Types of Work: edit in popup
    When I click types_of_work
    And types_of_work_page is visible
    And i click type_of_work_edit_popup
    And I enter test_type2 in the type_of_work_add_new_name
    And I click type_of_work_edit_popup_status
    And i click type_of_work_popup_status_archived
    And i click type_of_work_popup_billable
    And I enter 50 in the type_of_work_popup_billing_input
    And i click type_of_work_popup_save_changes
    And I should see a text 50 on the page
    Then I should see a text test_type2 on the page

  @role
  Scenario: Filter status: archived and billable
    When I click types_of_work
    And types_of_work_page is visible
    And i click type_of_work_filter_archived_only
    And i click type_of_work_show_types_of_work
    And I should not see a text consulting on the page
    And i click type_of_work_filter_billable_only
    And i click type_of_work_show_types_of_work
    Then i should see a text test_type2 on the page

  @role
  Scenario: Types of Work: delete
    When I click types_of_work
    And types_of_work_page is visible
    And i click type_of_work_delete
    And i accept alert menu
    And I wait 1 seconds for animation stops
    Then I should not see a web element type_of_work_add_new_name_check_2

  @role
  Scenario: Create leave type
    When I click leave_types_button
    And leave_types_page is visible
    And I click create_leave_type_button
    And I wait 2 seconds for animation stops
    And I should see a web element leave_type_pop_up
    And I enter Leave Type Smoke in the leave_type_name
    And I click commit_create_button
    And I wait 2 seconds for animation stops
    Then I should see a text Leave Type Smoke on the page

  @role
  Scenario: Change leave type
    When I click leave_types_button
    And leave_types_page is visible
    When I click on leave type text Leave Type Smoke
    And I wait 2 seconds for animation stops
    And I enter Leave Type Smoke Changed in the input_name_field
    And I click apply_button
    And I wait 2 seconds for animation stops
    Then I should see a text Leave Type Smoke Changed on the page

  @role
  Scenario: Move leave type
    When I click leave_types_button
    And leave_types_page is visible
    And I click order_button
    And I wait 2 seconds for animation stops
    Then moved_order should contain 7

  @role
  Scenario: Delete leave type
    When I click leave_types_button
    And leave_types_page is visible
    And I remove leave type with name Leave Type Smoke Changed
    And I accept alert menu
    And I wait 2 seconds for animation stops
    And I refresh the page
    And I wait 2 seconds for animation stops
    Then I should not see a text Leave Type Smoke Changed on the page

  @role
  Scenario: Edit and import holidays
    When I click corp_work_schedule_button
    And work_schedule_page is visible
    And I click edit_day
    And I wait 2 seconds for animation stops
    And I should see a web element corp_day_check
    And I click import_button
    And I click set_usa
    And I should see a web element holiday_check
    And I click import_btn_2
    And I click close_panel
    Then I should see a web element holiday_check_2

  @role
  Scenario: Delete holidays
    When I click corp_work_schedule_button
    And work_schedule_page is visible
    And I click holiday_list
    And I click name_field
    And I click delete_holiday
    And I click cancel_delete
    And I wait 1 seconds for animation stops
    And I click delete_holiday
    And I click remove_holiday
    And I refresh the page
    Then I should not see a web element corp_day_check

   @role
  Scenario: Change year
    When I click corp_work_schedule_button
    And work_schedule_page is visible
    And I click year_selector
    And I click year_selector_2016
    And I wait 1 seconds for animation stops
    Then I should see a web element day_29_check

  @role
  Scenario: Change color scheme
    When I click logo_color_scheme_button
    And logo_color_scheme_page is visible
    And I click purple_color
    And  I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element selected_purple_color
    And I click default_color
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element selected_purple_color

  @role
  Scenario: Change logo
    When I click logo_color_scheme_button
    And logo_color_scheme_page is visible
    And I click custom_logo_radiobutton
    And I upload /gif.gif from resources in choose_logo_file
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element keep_logo_radiobutton
    And I click default_logo_radiobutton
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element keep_logo_radiobutton

  @role
  Scenario: Check license information
    When I click licenses_button
    And license_page is visible
    And I wait 2 seconds for animation stops
    Then I should see a web element active_license

  @role
  Scenario: Open Contact Support Team popup
    When I click licenses_button
    And license_page is visible
    And I wait 2 seconds for animation stops
    And I click contact_support_button
    And I wait 2 seconds for animation stops
    And I should see a web element contact_support_popup
    And I click contact_support_popup_close_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element contact_support_popup

  @role
  Scenario: Open integration actiPLANS popup
    When I click licenses_button
    And license_page is visible
    And I wait 2 seconds for animation stops
    And I click addons_button
    And I click integration_actiplans_button
    And I wait 2 seconds for animation stops
    Then I should see a web element integration_popup

  @role
  Scenario: Open integration actiPLANS popup
    When I click licenses_button
    And license_page is visible
    And I wait 2 seconds for animation stops
    And I click addons_button
    And I click integration_actiplans_button
    And I wait 2 seconds for animation stops
    Then I should see a web element integration_popup

   @role
   Scenario: Checking notifications with MA
    When I am logged in as admin
    And user_list_page is visible
    And I click settingsat_user
    And I click permissions_tab
    And I click ma_permission
    And I am logged in as settingsat
    And general_page is visible
    And I click settings_button
    And I click notifications_button
    Then notification_page is visible

   @role
   Scenario: Send notifications
    When I click notifications_button
    And notification_page is visible
    And I click send_notifications_button
    And I wait 2 seconds for animation stops
    Then I should see a web element success_send_notification_text

   @role
   Scenario Outline: Create notification rules pt.1
    When I click notifications_button
    And notification_page is visible
    Examples: Create <notification> rule
      | rule      | row         | field   | text | text_1 | notification   |
      | addRule_1 | ruleRow_1_1 | ttLimit | 160  | 20     | personal_tt    |
      | addRule_2 | ruleRow_2_1 | ttLimit | 160  | 20     | unsubmitted_tt |

    And I add notification rule <rule>
    And I enter text <text> in second rule field <field> row <row>
    And I enter text <text_1> in rule field <field> row <row>
    And I save row <row> notification <notification> rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

   @role
   Scenario: Create notification of worked out tasks estimate
    When I click notifications_button
    And notification_page is visible
    And I add notification rule addRule_4
    And I enter text 100 in second rule field estimate row ruleRow_4_3
    And I save row ruleRow_4_3 notification estimate rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

   @role
   Scenario Outline: Create notification rules pt.2
    When I click notifications_button
    And notification_page is visible
    Examples: Create <notification> rule
      | rule      | row         | field    | days | notification      |
      | addRule_3 | ruleRow_3_3 | deadline | 20   | deadline          |
      | addRule_6 | ruleRow_6_2 | money    | 100  | project_budget    |
      | addRule_7 | ruleRow_7_1 | money    | 100  | personal_earnings |

    And I add notification rule <rule>
    And I enter text <days> in rule field <field> row <row>
    And I save row <row> notification <notification> rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

   @role
   Scenario Outline: Pause/Resume rules
    When I click notifications_button
    And notification_page is visible
    Examples: Pause/Resume rule
      | row         |
      | ruleRow_1_1 |
      | ruleRow_2_1 |
      | ruleRow_3_3 |
      | ruleRow_4_3 |
      | ruleRow_6_2 |
      | ruleRow_7_1 |

    And I pause/resume row <row> notification rule
    And I wait 1 seconds for animation stops
    And I should see a web element paused_text
    And I pause/resume row <row> notification rule
    And I wait 1 seconds for animation stops
    Then I should not see a web element paused_text

   @role
   Scenario Outline: Remove rules
    When I click notifications_button
    And notification_page is visible
    Examples: Remove rule
      | row         |
      | ruleRow_1_1 |
      | ruleRow_2_1 |
      | ruleRow_3_3 |
      | ruleRow_4_3 |
      | ruleRow_6_2 |
      | ruleRow_7_1 |

    And I remove row <row> notification rule
    And I accept alert menu
    And I wait 2 seconds for animation stops
    Then I should not see a web element rule_row