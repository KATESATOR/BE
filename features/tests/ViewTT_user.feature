Feature: View TT interface by user


  Background:
    Given I am logged in as user
    Given view_tt_page is visible
    Given I click view_tt

  @smoke
  Scenario: Switching period
    When i click calendar_from
    And i click calendar_day_from
    Then I should see a text 2.3d on the page
    Then I should see a text 1d on the page

  @smoke
  Scenario: Changing Filter on all active projects
    And i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_2
    And i click filter_close_user
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter on all selected customers
    And i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_3
    And I perform select in the filter_cp_selector_3_customer
    And i click filter_close_user
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter on all selected customers all scope
    And i click filter
    And i click filter_cp_selector_user
    And i click filter_cp_selector_3
    And I click filter_select_all
    And i click filter_close
    And i click filter_apply
    And i click filter
    Then I should not see a text All projects of all customers  (active and archived) on the page
    Then I should not see a text All active projects оf all active customers on the page

  @smoke
  Scenario: Checking hide customers in filter
    And i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_3
    And i click filter_hide_show_customers
    Then i should see a text Mobile Phone Internet Shop on the page

  @smoke
  Scenario: Checking search in filter
    And i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_3
    And i click filter_find
    And I enter Architects in the filter_field
    Then I should see a text Architects on the page

  @smoke
  Scenario: Checking clear filter button is present
    And i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_3
    And i click filter_deselect_all
    And i click filter_select_all
    And i click filter_close
    And i click filter_apply
    Then I should see a web element filter_clear

  @smoke
  Scenario: Checking clear filter button is not present
    And i click filter
    And i click filter_cp_selector
    And i click filter_cp_selector_2
    And i click filter_close
    And i click filter_apply
    And i click filter_clear
    Then I should not see a web element filter_clear

  @smoke
  Scenario: Changing Filter TT status to empty
    And i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And i click filter_apply
    Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter TT status to Approved
    And i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_approved
    And i click filter_apply
    Then I should see a text Approved on the page

  @smoke
  Scenario: Changing Filter TT status to Ready for Approval
    And i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_ready_for_approval
    And i click filter_apply
    Then I should see a text Ready for Approval on the page


  @smoke
  Scenario: Changing Filter TT status to Not Ready and Rejected
    And i click filter
    And I perform deselect in the filter_tt_status_approved
    And I perform deselect in the filter_tt_status_ready_for_approval
    And I perform deselect in the filter_tt_status_not_ready_and_rejected
    And I perform select in the filter_tt_status_not_ready_and_rejected
    And i click filter_apply
    Then I should see a text Not Ready and Rejected on the page

  @smoke
  Scenario: Edit task
    And i click filter_clear
    And i click calendar_from
    And i click calendar_day_from
    And I refresh the page
    And i click calendar_to
    And i click calendar_day_to
    And i click filter
    And I perform select in the filter_tt_status_approved
    And I perform select in the filter_tt_status_ready_for_approval
    And i click filter_apply
    And I perform deselect in the ttdetails_show_tasks
    And I perform select in the ttdetails_show_tasks
    And i click ttdetails_edit_task
    And i enter test in the ttdetails_edit_task_description
    And i click ttdetails_edit_task_close
    And i click ttdetails_edit_task
    Then I should see a text test on the page

  @smoke
  Scenario: Table present View by Days, cpt
    And i click ttdetails_days
    And I perform select in the ttdetails_show_tasks
    And i click ttdetails_cpt
    And i click ttdetails_days
    Then I should see a web element ttdetails_cpt_check

  @smoke
  Scenario: Export PDF
    And i click export_pdf
    And I wait 4 seconds for animation stops
    Then I should see a web element export_pdf
    Then i should see a text Download PDF on the page
    And i click export_pdf_download
    And I wait 3 seconds for animation stops
    Then Checking file with format pdf
