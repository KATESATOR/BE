Feature: Enter TT interface

  Scenario: Save time-track
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And enter_tt_page is visible
    And I enter 2 in the tt_field
    And I click save_button
    Then I can see a text You cannot enter time-track for the future. on the page

  Scenario: Test commit