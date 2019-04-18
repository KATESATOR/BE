Feature: Settings interface by admin


  Background:
    Given I am logged in as admin
    And general_page is visible
    And i click settings_button
    And I click features
    And features_page is visible

  @smoke
  Scenario: Settings On/Off
    When i click features_future_days
    And I wait 1 seconds for animation stops
    And i click features_leave_time
    And i click features_pto_balance
    And i click features_sick_balance
    And i click features_overtime
    And i click features_tt_approval
    And i click features_departments
    And i click features_tzg
    And i click features_task_estimates
    And i click features_task_workflow
    And I wait 1 seconds for animation stops
    And i click features_work_assignments
    And i click features_user_rates_cost
    And i click features_types_of_work
    And I should see a web element features_status_off
    And i click features_future_days
    And i click features_leave_time
    And i click features_pto_balance
    And i click features_sick_balance
    And i click features_overtime
    And i click features_tt_approval
    And i click features_departments
    And i click features_tzg
    And i click features_task_estimates
    And i click features_task_workflow
    And I wait 1 seconds for animation stops
    And i click features_work_assignments
    And i click features_user_rates_cost
    And i click features_types_of_work
    And i click features_hourly_billing
    Then I should see a web element features_status_on