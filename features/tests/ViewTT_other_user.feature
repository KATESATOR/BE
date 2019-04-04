Feature: View TT interface of other user by admin


  Background:
    Given I am logged in as admin
    And I am on view_tt page
    And view_tt_page is visible
    And i click user_selector
    And i click user_selector_timmers_brian

  @smoke
  Scenario: Switching user
    When i click user_selector
    And i click user_selector_timmers_brian
    And I wait 2 seconds for animation stops
    Then I should see a text Timmers, Brian on the page

  @smoke
  Scenario: Switching period and checking period table
    When I perform select in the ttdetails_show_tasks
    And I wait 1 seconds for animation stops
    And i click empty_space
    And I wait 1 seconds for animation stops
    And I click calendar_from
    And I wait 1 seconds for animation stops
    And I click calendar_month
    And I wait 2 seconds for animation stops
    And I click calendar_month_march
    And I wait 1 seconds for animation stops
    And I click calendar_month_ok
    And I wait 2 seconds for animation stops
    And I click calendar_day_from
    And I refresh the page
    And I click calendar_to
    And I wait 3 seconds for animation stops
    And I click calendar_month
    And I wait 2 seconds for animation stops
    And I click calendar_month_march
    And I wait 1 seconds for animation stops
    And I click calendar_month_ok
    And I wait 2 seconds for animation stops
    And I click calendar_day_to
    And I wait 2 seconds for animation stops
    And I should see a web element ttdetails_date_check_min
    And I wait 2 seconds for animation stops
    Then I should see a web element ttdetails_date_check_max

  @smoke
  Scenario: Changing Filter on all active customers
    When I click filter
    And I wait 1 seconds for animation stops
    And I click filter_cp_selector
    And I wait 2 seconds for animation stops
    And I click filter_cp_selector_2
    And I click filter_close
    And I click filter_apply
    Then I should see a text Our Company on the page

   @smoke
  Scenario: Changing Filter on all selected customers
    When I click filter
    And I wait 1 seconds for animation stops
    And I click filter_cp_selector
    And I click filter_cp_selector_3
    And I perform select in the filter_cp_selector_3_customer
    And I click filter_close
    And I click filter_apply
    And I should see a text Boston Chocolate on the page

  @smoke
  Scenario: Checking hide customers in filter
    When I click filter
    And I wait 1 seconds for animation stops
    And I click filter_cp_selector
    And I click filter_cp_selector_3
    And I click filter_hide_show_customers
    Then I should see a text Mobile Phone Internet Shop on the page

  @smoke
  Scenario: Checking search in filter
    When I click filter
    And I wait 1 seconds for animation stops
    And I click filter_cp_selector
    And I click filter_cp_selector_3
    And I click filter_find
    And I enter Architects in the filter_field
    And I wait 1 seconds for animation stops
    Then I should see a web element filter_find_customer_checked

  @smoke
  Scenario: Changing Filter on all selected customers all scope
    When I click filter
    And I wait 1 seconds for animation stops
    And I click filter_cp_selector
    And i click filter_cp_selector_3
    And I click filter_select_all
    And I click filter_close
    And I click filter_apply
    And I click filter
    And I should not see a text All projects of all customers  (active and archived) on the page
    Then I should not see a text All active projects оf all active customers on the page

  @smoke
  Scenario: Changing Filter TT status to empty
    When I click filter
    And I wait 1 seconds for animation stops
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I wait 1 seconds for animation stops
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I click filter_apply
    And I should see a text Clear filter on the page
    Then I should see a text There are no time-track with the selected statuses in this period on the page

  @smoke
  Scenario: Changing Filter TT status to Not Ready and Rejected
    When I click filter
    And I wait 1 seconds for animation stops
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_not_ready_and_rejected
    And I click filter_apply
    And I wait 1 seconds for animation stops
    And I should not see a web element filter_tt_status_approved
    Then I should see a web element filter_tt_status_not_ready_checked

  @smoke
  Scenario: Changing Filter TT status to Ready for Approval
    When I click filter
    And I wait 1 seconds for animation stops
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_ready_for_approval
    And i click filter_apply
    And I wait 1 seconds for animation stops
    Then I should not see a web element filter_tt_status_approved

  @smoke
  Scenario: Changing Filter TT status to Approved
    When I click filter
    And I wait 1 seconds for animation stops
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_approved
    And I click filter_apply
    And I wait 1 seconds for animation stops
    Then I should see a text There are no time-track with the selected statuses in this period on the page

  @smoke
  Scenario: Checking clear filter button is not present
    When i click filter_clear
    Then I should not see a web element filter_clear

  @smoke
   Scenario: Edit task
     When I perform select in the ttdetails_show_tasks
     And I wait 2 seconds for animation stops
     And i click ttdetails_edit_task_other
     And I wait 2 seconds for animation stops
     And i enter test in the ttdetails_edit_task_description
     And i click ttdetails_edit_task_close
     And i click ttdetails_edit_task_other
     And I wait 2 seconds for animation stops
     And I should see a text test on the page
     And i click ttdetails_edit_task_description_again
     And i enter   in the ttdetails_edit_task_description
     Then i click ttdetails_edit_task_close

  @smoke
  Scenario: Table present View by Days, cpt
    When i click ttdetails_cpt
    And I perform select in the ttdetails_show_tasks
    And i click ttdetails_days
    Then I should see a web element ttdetails_cpt_check

  @smoke
  Scenario: Export PDF
    When i click export_pdf
    And I wait 4 seconds for animation stops
    And I should see a web element export_pdf
    And i should see a text Download PDF on the page
    And i click export_pdf_download
    And I wait 3 seconds for animation stops
    Then Checking file with format pdf


