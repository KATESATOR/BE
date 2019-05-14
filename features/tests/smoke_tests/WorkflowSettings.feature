Feature: Workflow settings interface by admin


  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click workflow_settings
    And workflow_settings_page is visible

  @smoke
  Scenario: Workflow statuses for open tasks: create
    When I click workflow_settings_add_open
    And I enter test_status in the workflow_settings_add_new_name
    And I click workflow_settings_apply
    Then I should see a web element workflow_settings_name_check

  @smoke
  Scenario: Workflow statuses for open tasks: move
    When I wait 1 seconds for animation stops
    And I drag gs_workflow_settings_workflow_open_status by offset 0, -100
    And I wait 1 seconds for animation stops
    Then I drag gs_workflow_settings_workflow_open_status by offset 0, 100

  @smoke
  Scenario: Workflow statuses for open tasks: delete
    When I click workflow_settings_delete_status
    And I wait 1 seconds for animation stops
    And I click workflow_settings_delete_status_apply
    And I wait 1 seconds for animation stops
    Then I should not see a web element workflow_settings_name_check

  @smoke
  Scenario: Workflow statuses for completed tasks: create
    When I click workflow_settings_add_close
    And I enter test_status_completed in the workflow_settings_add_new_name
    And I click workflow_settings_apply
    Then I should see a web element workflow_settings_name_check

  @smoke
  Scenario: Workflow statuses for completed tasks: move
    When I wait 1 seconds for animation stops
    And I drag gs_workflow_settings_workflow_completed_status by offset 0, -100
    Then I drag gs_workflow_settings_workflow_completed_status by offset 0, 100

  @smoke
  Scenario: Workflow statuses for completed tasks: delete
    When I click workflow_settings_delete_completed_status
    And I click workflow_settings_delete_completed_status_apply
    And I wait 1 seconds for animation stops
    Then I should not see a web element workflow_settings_name_check