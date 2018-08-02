Feature: Login pages

  Scenario: Login in actiTIME
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And general_page is visible
    Then I can see a web element logout_button

  Scenario: Incorrect login in actiTIME
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter qwe in the username_field
    And I enter qwe in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    Then I can see a text Username or Password is invalid. on the page

  Scenario: Login in actiPLANS
    Given I open a page http://192.168.101.103:8080/cur/login.do
    When ap login page is visible
    And I enter admin in the username field
    And I enter manager in the password field
    And I click login button
    And general_page is visible
    Then I can see a web element logout_button

  Scenario: Incorrect login in actiPLANS
    Given I open a page http://192.168.101.103:8080/cur/login.do
    When ap login page is visible
    And I enter qwe in the username_field
    And I enter qwe in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    Then I can see a text Username or Password is invalid. on the page