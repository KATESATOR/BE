Feature: User List interface by user

  Background:
    Given I am logged in as user
    And I am on user_list page
    And user_list_page is visible

  @Smoke
  Scenario: User list read-only
    When I click user_cruz_gordman
    Then I should not see a web element edit_first_name_field

  @Smoke
  Scenario: Searching users
    When I click search_button
    And I enter Kloss in the search_field
    And I wait 2 seconds for animation stops
    Then first_search_result should contain Kloss

  @Smoke
  Scenario: User filter in user list
    When I click user_filter_button
    And I click selected_users_in_selector
    And I perform select in the cruz_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Cruz, Gordman
    And I click user_filter_button
    And I click all_users_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Sorting by users
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Wooster, Jennifer

  @Smoke
  Scenario: Sorting by groups
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    Then first_group_in_list should contain Development

  @Smoke
  Scenario: Sorting by time zones
    When I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    And I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    Then first_tzg_in_list should contain Sydney Office

  @Smoke
  Scenario: Management filter
    When I click management_filter
    And I click users_wo_permissions_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Venson, Ronald
    And I click management_filter
    And I click all_staff_filter
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert