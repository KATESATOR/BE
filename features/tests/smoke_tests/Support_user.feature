Feature: Support scenarios by user

  Background:
    Given I am logged in as user
    And general page is visible

  @smoke
  Scenario: Edit name in My Profile
    When I click my profile
    And I enter Firstname in the profile first name
    And I enter Lastname in the profile last name
    And I click save profile changes
    And I wait 2 seconds for animation stops
    Then I should see a text Firstname Lastname on the page

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
  Scenario: Switch product
    When I click switch product
    And I wait 3 seconds for animation stops
    Then I should see a text My Schedule on the page