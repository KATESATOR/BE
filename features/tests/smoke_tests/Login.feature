Feature: Login pages

  Scenario: Login in actiTIME
    Given I open a page /login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And general_page is visible
    Then I should see a web element logout_button

  Scenario: Incorrect login in actiTIME
    Given I open a page /login.do
    When at_login_page is visible
    And I enter qwe in the username_field
    And I enter qwe in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    Then I should see a text Username or Password is invalid. on the page

  Scenario: Login in actiTIME with 'Remember me' option
    Given I open a page /login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I perform select in the keep_me_logged_in_checkbox
    And I click login_button
    And I wait 2 seconds for animation stops
    And I restart browser and open a page /login.do
    And general_page is visible
    Then I should see a web element logout_button

  Scenario: Login in actiTIME without 'Remember me' option
    Given I open a page /login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    And I restart browser and open a page /login.do
    Then I should see a text Please identify yourself on the page

  Scenario: Login in actiPLANS
    Given I open actiPLANS page /login.do
    When ap login page is visible
    And I enter admin in the username field
    And I enter manager in the password field
    And I click login button
    And general_page is visible
    Then I should see a web element logout_button

  Scenario: Incorrect login in actiPLANS
    Given I open actiPLANS page /login.do
    When ap login page is visible
    And I enter qwe in the username_field
    And I enter qwe in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    Then I should see a text Username or Password is invalid. on the page

  Scenario: Login in actiPLANS with 'Remember me' option
    Given I open actiPLANS page /login.do
    When ap_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I perform select in the keep_me_logged_in_checkbox
    And I click login_button
    And I wait 2 seconds for animation stops
    And I restart browser and open actiPLANS page /login.do
    And general_page is visible
    Then I should see a web element logout_button

  Scenario: Login in actiPLANS without 'Remember me' option
    Given I open actiPLANS page /login.do
    When ap_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And I wait 2 seconds for animation stops
    And I restart browser and open actiPLANS page /login.do
    Then I should see a text Please identify yourself on the page