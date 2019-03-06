Feature: Support scenarios by admin

  Background:
    Given I am logged in as admin
    And general page is visible

  # тест не проходит из-за бага AT-2817
  @smoke
  Scenario: Edit name in My Profile
    When I click my profile
    And I enter Firstname in the profile first name
    And I enter Lastname in the profile last name
    And I click save profile changes
    And I wait 2 seconds for animation stops
    Then I should see a text Firstname Lastname on the page

  @smoke
  Scenario: Invite colleague
    When I click help button
    And I wait 1 seconds for animation stops
    And I click create account for colleague
    And I enter colleaguefname in the colleague first name
    And I enter colleaguelname in the colleague last name
    And I enter test@email.com in the colleague email
    And I click invite colleague
    Then I should see a text Invite another person on the page

  @smoke
  Scenario: Open Introduction video
    When I click help button
    And I wait 1 seconds for animation stops
    And I click introduction video
    Then I should see a text Learn how to start using actiTIME on the page

  @smoke
  Scenario: Open About pop-up
    When I click help button
    And I wait 1 seconds for animation stops
    And I click about actitime
    Then I should see a text PRODUCT INFO on the page

  @smoke
  Scenario: Contact Support
    When I click help button
    And I wait 1 seconds for animation stops
    And I click contact support
    And I enter Text for support in the support field
    And I click submit support
    And I wait 5 seconds for animation stops
    Then I should see a text Your question was successfully submitted on the page

  @smoke
  Scenario: Request a call
    When I click help button
    And I wait 1 seconds for animation stops
    And I enter 1234567890 in the phone number
    And I click request a call
    And I wait 1 seconds for animation stops
    Then I should see a text Thanks, we received your request! on the page

  @smoke
  Scenario: Switch product
    When I click switch product
    And I wait 3 seconds for animation stops
    Then I should see a text My Schedule on the page