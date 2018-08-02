Feature: Enter TT interface

  @smoke
  Scenario: Save time-track
    Given I am logged in as admin
    And enter_tt_page is visible
    When I enter 2 in the tt_field
    And I click save_button
    Then I can see a text You cannot enter time-track for the future. on the page
