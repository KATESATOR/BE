Feature: Settings interface by admin


  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible

  @smoke
  Scenario: Settings On/Off
    When I click features_future_days
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