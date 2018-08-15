Feature: User List interface by admin

  Background:
    Given I am logged in as admin
    Given user_list_page is visible
    Given I click users_button

  @Smoke
  Scenario: Creating and deleting new user
    When I click new_user_button
    And I enter TestName in the first_name_field
    And I enter TestLastName in the last_name_field
    And I enter test@test in the email_field
    And I click save_send_invitation_button
    And I wait 1 seconds for animation stops
    And I should see a text Account for TestName TestLastName has been created. on the page
    And I should see a text The invitation has been sent to the user's email address: test@test on the page
    And I click close_add_user_panel
    And I should see a web element new_test_user
    And I click new_test_user
    And I click delete_user_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then I should not see a web element new_test_user

  @Smoke
  Scenario: Edit user
    When I click user_cruz_gordman
    And I enter Gordman123 in the edit_first_name_field
    And I wait 1 seconds for animation stops
    And I enter Cruz123 in the edit_last_name_field
    And I click close_panel_button
    Then I should see a web element edited_cruz_gordman

  @Smoke
  Scenario: Creating and deleting new time zone group
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I enter Washington in the time_zone_search_field
    And I click first_city_in_selector
    And I click add_time_zone_button
    And I should see a web element Washington_time_zone_group
    And I click delete_Washington_button
    And I click confirm_delete_group_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element Washington_time_zone_group

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
    And I click select_all_button_tzg
    And I click move_to_button
    And I click default_time_zone_in_selector
    And I wait 1 seconds for animation stops
    Then I should see a text There are no users in the "Sydney Office" time zone group on the page

  @Smoke
  Scenario: Creating and deleting new department
    When I click manage_groups_selector
    And I click departments_in_selector
    And I enter Test Dept in the new_dept_textfield
    And I click add_new_dept_button
    And I should see a web element test_dept
    And I click delete_test_dept_button
    And I click confirm_delete_group_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element test_dept

  @Smoke
  Scenario: Editing users in department
    When I click manage_groups_selector
    And I click departments_in_selector
    And I click administration_dept
    And I click select_all_button_depts
    And I click move_to_button
    And I click first_in_depts_move_to_selector
    And I wait 1 seconds for animation stops
    Then I should see a text "Administration" department contains only users with disabled access on the page
    
  @Smoke
  Scenario: Bulk invitations
    When I click bulk_invitations_button
    And I enter user1 in the bulk_first_name_field1
    And I enter user1 in the bulk_last_name_field1
    And I enter 1@1 in the bulk_email_field1
    And I enter user2 in the bulk_first_name_field2
    And I enter user2 in the bulk_last_name_field2
    And I enter 2@2 in the bulk_email_field2
    And I click send_invitations_button
    And I wait 1 seconds for animation stops
    And I should see a text Invitations have been sent to the following users: on the page
    And I should see a text user1 user1 (1@1) on the page
    And I should see a text user2 user2 (2@2) on the page
    And I click close_bulk_button
    And I should see a web element user1
    And I should see a web element user2
    And I click user1
    And I click delete_user_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click user2
    And I click delete_user_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I should not see a web element user1
    Then I should not see a web element user2

  @Smoke
  Scenario: Editing access to users
    When I click stivers_melanie
    And I click permissions_tab
    And I click access_to_users
    And I click access_to_all_users
    And I click access_to_users_back_button
    Then access_to_users should contain All users

  @Smoke
  Scenario: Editing access to scope of work
    When I click stivers_melanie
    And I click permissions_tab
    And I click tasks_counter_scope
    And I click no_access_to_scope
    And I click access_to_scope_back_button
    Then access_to_scope_label should contain No Access

  @Smoke
  Scenario: User filter in user list
    When I click user_filter_button
    And I click selected_users_in_selector
    And I perform select in the stivers_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Stivers, Melanie
    And I click user_filter_button
    And I click all_users_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Sorting by users
    When I click sorting_by_group
    And I click sorting_by_users
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Venson, Ronald

  @Smoke
  Scenario: Sorting by groups
    When I click sorting_by_group
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    Then first_group_in_list should contain Development

  @Smoke
  Scenario: Sorting by time zones
    When I click sorting_by_tzg
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
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Editing work assignments
    When I click work__assignments_tab
    And I click sorting_by_users_in_wa
    And I wait 1 seconds for animation stops
    And first_row_in_wa_tab_projects_counter should contain 3
    And I click first_row_in_wa_tab_projects_counter
    And I click edit_assignments_button
    And I click last_cust_in_wa_panel
    And I wait 1 seconds for animation stops
    And I click first_project_cust_wa_panel
    And I click close_edit_wa_button
    And I click close_wa_button
    And I wait 1 seconds for animation stops
    And first_row_in_wa_tab_projects_counter should contain 4