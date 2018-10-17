Feature: Type of Work interface by admin


  Background:
    Given I am logged in as admin
    And general_page is visible
    And i click settings_button
    And I click types_of_work
    And types_of_work_page is visible

  @smoke
  Scenario: Types of Work: create
    When  i click type_of_work_create
    And I enter test_type in the type_of_work_add_new_name
    And i click type_of_work_create_popup
    Then I should see a web element type_of_work_add_new_name_check

  @smoke
  Scenario: Types of Work: edit in table
    When i click type_of_work_edit_status_to_archived
    And i click type_of_work_edit_status_to_active
    And i click type_of_work_edit_category
    And i click type_of_work_edit_default
    And i click type_of_work_edit_order_up
    Then I should see a web element type_of_work_edit_order_down
    And i click type_of_work_edit_order_down

  @smoke
  Scenario: Filter status: active and nonbillable
    When i click type_of_work_filter_active_only
    And i click type_of_work_filter_nonbillable_only
    And i click type_of_work_show_types_of_work
    Then I should not see a text design on the page

  @smoke
  Scenario: Types of Work: edit in popup
    When i click type_of_work_edit_popup
    And I enter test_type2 in the type_of_work_add_new_name
    And I click type_of_work_edit_popup_status
    And i click type_of_work_popup_status_archived
    And i click type_of_work_popup_billable
    And I enter 50 in the type_of_work_popup_billing_input
    And i click type_of_work_popup_save_changes
    And I should see a text 50 on the page
    Then I should see a text test_type2 on the page

  @smoke
  Scenario: Types of Work: edit in popup
    When i click type_of_work_edit_popup
    And I enter test_type2 in the type_of_work_add_new_name
    And I click type_of_work_edit_popup_status
    And i click type_of_work_popup_status_archived
    And i click type_of_work_popup_billable
    And I enter 50 in the type_of_work_popup_billing_input
    And i click type_of_work_popup_save_changes
    And I should see a text 50 on the page
    Then I should see a text test_type2 on the page

  @smoke
  Scenario: Filter status: archived and billable
    When i click type_of_work_filter_archived_only
    And i click type_of_work_filter_billable_only
    And i click type_of_work_show_types_of_work
    And I should not see a text consulting on the page
    Then i should see a text test_type2 on the page

  @smoke
  Scenario: Types of Work: delete
    When i click type_of_work_delete
    And i accept alert menu
    Then I should not see a web element type_of_work_add_new_name_check