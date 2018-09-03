Feature: View TT interface by admin


  Background:
    Given I am logged in as admin
    Given view_tt_page is visible
    Given i click view_tt

 @smoke
  Scenario: Switching period
    And i click user_selector
    And i click user_selector_user_2
    And i click user_selector_user
    When i click calendar
    When i click calendar_day
    Then i should see a text 28, 2018 on the page



  @smoke
  Scenario: Switching user
    And i click user_selector
    And i click user_selector_user
    Then I should see a text Back to me on the page

  @smoke
  Scenario: Changing Filter on all active projects
     And i click filter
     And i click filter_cp_selector
     And  I wait 2 seconds for animation stops
     And i click filter_cp_selector_2
     And i click filter_close
     And i click filter_apply
     Then I should see a text Clear filter on the page

  @smoke
  Scenario: Changing Filter on all selected customers
     And i click filter
     And i click filter_cp_selector
     And i click filter_cp_selector_3
     And I perform select in the filter_cp_selector_3_customer
     And i click filter_close
     And i click filter_apply
     Then I should see a text Clear filter on the page

   @smoke
  Scenario: All active settings in filter
     And i click filter
     And i click filter_cp_selector
     And i click filter_cp_selector_3
     And i click filter_hide_show_customers
     Then i should see a text Mobile Phone Internet Shop on the page
     And i click filter_hide_show_customers
     And I click filter_select_all
     And I click filter_close_arrow
     And I click filter_open_arrow
     And I click filter_deselect_all
     And i click filter_reset
     And I click filter_keep_selected
     And i click filter_find
     And I enter Architects in the filter_field
    Then I should see a text Architects on the page
     And i click filter_close
     And i click filter_apply
     And i click filter_clear
     Then I should not see a web element filter_clear

  @smoke
  Scenario: Changing Filter on all selected customers all scope
     And i click filter
     And i click filter_cp_selector
     And i click filter_cp_selector_3
     And I click filter_select_all
     And i click filter_close
     And i click filter_apply
     And i click filter
     Then I should not see a text All projects of all customers  (active and archived) on the page
     Then I should not see a text All active projects оf all active customers on the page

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
  Scenario: Export PDF
    And i click export_pdf
    And I wait 4 seconds for animation stops
    Then I should see a web element export_pdf
    Then i should see a text Download PDF on the page
    And i click export_pdf_download
    And I wait 3 seconds for animation stops
    Then Checking file with format pdf



   @smoke
  Scenario: Table present View by Days, cpt
    And i click ttdetails_days
    And I perform select in the ttdetails_show_tasks
    And i click ttdetails_cpt
    And i click ttdetails_days
    Then I should see a web element ttdetails_cpt_check


  @smoke
  Scenario: Edit task
     And i click filter
     And I perform select in the filter_tt_status_approved
     And i click filter_apply
     And I perform deselect in the ttdetails_show_tasks
     And I perform select in the ttdetails_show_tasks
     And i click ttdetails_edit_task
     And i enter test in the ttdetails_edit_task_description
     And i click ttdetails_edit_task_close
     And i click ttdetails_edit_task
     And I wait 3 seconds for animation stops
    Then I should see a text test on the page
