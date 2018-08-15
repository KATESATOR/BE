Feature: User List interface by admin

  Background:
    Given I am logged in as admin
    Given user_list_page is visible
    Given I click users_button

  @Smoke
  Scenario: Creating new user
    When I click new_user_button
    And I enter TestName in the first_name_field
    And I enter TestLastName in the last_name_field
    And I enter test@test in the email_field
    And I click save_send_invitation_button
    And I wait 1 seconds for animation stops
    And I should see a text Account for TestName TestLastName has been created. on the page
    And I should see a text The invitation has been sent to the user's email address: test@test on the page
    And I click close_add_user_panel
    Then I should see a web element new_test_user

  @Smoke
  Scenario: Edit user
    When I click user_cruz_gordman
    And I enter Gordman123 in the edit_first_name_field
    And I wait 1 seconds for animation stops
    And I enter Cruz123 in the edit_last_name_field
    And I click close_panel_button
    Then I should see a web element edited_cruz_gordman

  @Smoke
  Scenario: Delete user
    When I click new_user_button
    And I enter TestDelName in the first_name_field
    And I enter TestDelLastName in the last_name_field
    And I enter del@test in the email_field
    And I click save_send_invitation_button
    And I click close_add_user_panel
    And I click user_test_delete
    And I click delete_user_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then I should not see a web element user_test_delete

  @Smoke
  Scenario: Creating new time zone group
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I enter Washington in the time_zone_search_field
    And I click Washington
    And I click add_time_zone_button
    Then I should see a web element Washington_time_zone_group

  @Smoke
  Scenario: Deleting time zone group
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I enter Dallas in the time_zone_search_field
    And I click Dallas
    And I click add_time_zone_button
    And I click delete_Dallas_button
    And I click confirm_delete_group_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element Dallas_time_zone_group

  @Smoke
  Scenario: Editing time zone group name
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click London_time_zone_group
    And I enter LONDON TEST in the London_time_zone_name_field
    And I click accept_edit_London_tzg_button
    And I wait 1 seconds for animation stops
    And London_time_zone_group should have title with LONDON TEST

  @Smoke
  Scenario: Editing time zone group users
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click Sydney_office_group
    And I click select_all_button
    And I click move_to_button
    And I click default_time_zone_in_selector
    And I wait 1 seconds for animation stops
    Then I should see a text There are no users in the "Sydney Office" time zone group on the page







