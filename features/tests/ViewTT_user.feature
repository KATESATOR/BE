Feature: View TT interface by user


  Background:
    Given I am logged in as admin
    And I am on view_tt page
    And view_tt_page is visible

  @smoke
  Scenario: Switching period and checking period table
    When I perform select in the ttdetails_show_tasks
    And i click calendar_from
    And i click calendar_day_from
    And I refresh the page
    And i click calendar_to
    And i click calendar_day_to
    Then I should see a web element ttdetails_date_check_min
    And I should see a web element ttdetails_date_check_max

  @smoke
  Scenario: Changing Filter on all active projects
    When i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_2
    And i click filter_close_user
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter on all selected customers
    When i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_3
    And I perform select in the filter_cp_selector_3_customer
    And i click filter_close_user
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter on all selected customers all scope
    When i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_3
    And I click filter_select_all
    And i click filter_close
    And i click filter_apply
    And i click filter
    Then I should not see a text All projects of all customers  (active and archived) on the page
    And I should not see a text All active projects оf all active customers on the page

  @smoke
  Scenario: Checking hide customers in filter
    When i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_3
    And i click filter_hide_show_customers
    Then i should see a text Mobile Phone Internet Shop on the page

  @smoke
  Scenario: Checking search in filter
    When i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_3
    And i click filter_find
    And I enter Boston in the filter_field
    Then I should see a text Boston on the page

  @smoke
  Scenario: Changing Filter TT status to empty
    When i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter TT status to Ready for Approval
    When i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_ready_for_approval
    And i click filter_apply
    Then I should see a text Ready for Approval on the page

  @smoke
  Scenario: Changing Filter TT status to Approved
    When i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_approved
    And i click filter_apply
    Then I should see a text Approved on the page

  @smoke
  Scenario: Changing Filter TT status to Not Ready and Rejected
    When i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_not_ready_and_rejected
    And i click filter_apply
    Then I should see a text Not Ready and Rejected on the page

  @smoke
  Scenario: Checking clear filter button is not present
    When i click filter_clear
    Then I should not see a web element filter_clear

  @smoke
  Scenario: Edit task
    When I perform select in the ttdetails_show_tasks
    And i click ttdetails_edit_task
    And i enter test in the ttdetails_edit_task_description
    And i click ttdetails_edit_task_close
    And i click ttdetails_edit_task
    Then I should see a text test on the page

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
