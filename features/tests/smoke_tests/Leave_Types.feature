Feature: Leave Types interface

  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click leave_types_button
    And leave_types_page is visible

  @smoke
  Scenario: Create leave type
    When I click create_leave_type_button
    And I wait 2 seconds for animation stops
    And I should see a web element leave_type_pop_up
    And I enter Leave Type Smoke in the leave_type_name
    And I click commit_create_button
    And I wait 2 seconds for animation stops
    Then I should see a text Leave Type Smoke on the page

  @smoke
  Scenario: Change leave type
    When I click on leave type text Leave Type Smoke
    And I wait 2 seconds for animation stops
    And I enter Leave Type Smoke Changed in the input_name_field
    And I click apply_button
    And I wait 2 seconds for animation stops
    Then I should see a text Leave Type Smoke Changed on the page
    And I wait 2 seconds for animation stops

  @smoke
  Scenario: Move leave type
    When I click order_button
    And I wait 2 seconds for animation stops
    Then moved_order should contain 7

  @smoke
  Scenario: Delete leave type
    When I remove leave type with name Leave Type Smoke Changed
    And I accept alert menu
    And I wait 2 seconds for animation stops
    And I refresh the page
    And I wait 2 seconds for animation stops
    Then I should not see a text Leave Type Smoke Changed on the page
