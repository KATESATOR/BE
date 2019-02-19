Feature: General settings interface by admin


  Background:
    Given I am logged in as admin
    And general_page is visible
    And i click settings_button
    And I click general_settings
    And general_settings_page is visible

  @smoke
  Scenario: General settings: customer naming
    When i click gs_naming_customer
    And i click gs_naming_customer_custom_name
    And I enter Custom Customer in the gs_naming_customer_custom_name_singular
    And I enter Customs Customers in the gs_naming_customer_custom_name_plural
    And i click gs_save
    And i click gs_naming_customer
    And i click gs_naming_customer_default_name
    Then i click gs_save

  @smoke
  Scenario: General settings: project naming
    When i click gs_naming_project
    And i click gs_naming_project_name_job
    And i click gs_save
    Then i should see a text Job on the page
    And i click gs_naming_project
    And i click gs_naming_project_default_name
    Then i click gs_save

  @smoke
  Scenario: General settings: task naming
    When i click gs_naming_task
    And i click gs_naming_task_name_subtask
    And i click gs_save
    Then I should see a text Subtask on the page
    And i click gs_naming_task
    And i click gs_naming_task_default_name
    Then i click gs_save

  @smoke
  Scenario: General settings: user groups naming
    When i click gs_naming_user_groups
    And i click gs_naming_user_groups_name_location
    And i click gs_save
    And I should see a text Location on the page
    And i click gs_naming_user_groups
    And i click gs_naming_user_groups_default_name
    Then i click gs_save

  @smoke
  Scenario: General settings: calendar layout
    When i click gs_data_settings_calendar
    And i click gs_data_settings_calendar_sunday
    And i click gs_save
    And I should see a text Sunday on the page
    And i click gs_data_settings_calendar
    And i click gs_data_settings_calendar_default_name
    Then i click gs_save

  @smoke
  Scenario: General settings: time zone group
    When I enter Boston in the gs_data_settings_tzg
    And i click gs_data_settings_tzg_boston
    And i click gs_save
    And i should see a text Boston on the page
    And i enter New York in the gs_data_settings_tzg
    And i click gs_data_settings_tzg_new_york
    And i click gs_save
    Then i should see a text New York on the page

  @smoke
  Scenario: General settings: maximum reported hours
    When i click gs_work_schedule_hours_per_day_unlimited
    And i click gs_save
    And i click gs_work_schedule_hours_per_day_limit
    Then i click gs_save


  @smoke
  Scenario: General settings: work schedule
    When I enter 8:30 in the gs_work_schedule
    And i click gs_save
    Then i should see a text 8:30 on the page
    And i enter 8:00 in the gs_work_schedule
    Then i click gs_save

  @smoke
  Scenario: General settings: pto balance
    When I enter 2.5 in the gs_pto_accrue
    And i click gs_save
    And i should see a text 2.5 on the page
    And i enter 2 in the gs_pto_accrue
    Then i click gs_save

  @smoke
  Scenario: General settings: sick balance
    When I enter 1.5 in the gs_sick_accrue
    And i click gs_save
    And i should see a text 1.5 on the page
    And i enter 1 in the gs_sick_accrue
    Then i click gs_save

  @smoke
  Scenario: General settings: overtime settings
    When I enter 1.5 in the gs_sick_accrue
    And i click gs_save
    And i should see a text 1.5 on the page
    And i enter 1 in the gs_sick_accrue
    Then i click gs_save

  @smoke
  Scenario: General settings: data access restrictions
    When I perform select in the gs_dar_see_all_tt
    And i click gs_dar_see_all_tt_selector
    And i click gs_dar_see_all_tt_selector_white_jane
    And i click gs_dar_see_all_tt_selector_apply
    And i click gs_save
    And I perform select in the gs_dar_hide_tt_lock_tt
    And I perform deselect in the gs_dar_hide_tt_from_managers
    And I perform select in the gs_dar_hide_not_assigned_users
    And I perform select in the gs_dar_allow_manager_modify_tt_users
    And I perform select in the gs_dar_see_all_tt
    And i click gs_dar_see_all_tt_selector
    And i click gs_dar_see_all_tt_selector_white_jane
    And i click gs_dar_see_all_tt_selector_apply
    And i perform deselect in the gs_dar_see_all_tt
    And I perform deselect in the gs_dar_hide_tt_lock_tt
    And I perform select in the gs_dar_hide_tt_from_managers
    And I perform deselect in the gs_dar_hide_not_assigned_users
    And I perform deselect in the gs_dar_allow_manager_modify_tt_users
    Then i click gs_save

  @smoke
  Scenario: General settings: notification
    When I enter test in the gs_message_footer
    And i click gs_send_test_message
    And I wait 2 seconds for animation stops
    Then I should see a text Test message was successfully sent to devnull@actimind.com on the page