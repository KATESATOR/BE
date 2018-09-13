Feature: Tasks interface by admin

  Background:
    Given I am logged in as admin
    And I am on tasks page
    And tasks page is visible
    And I click default view

  @smoke
  Scenario: Create Customer
    When I click add new
    And I click new customer
    And I wait 1 seconds for animation stops
    And I enter SeleniumTestCustomer in the cp name
    And I click create cp
    And I wait 1 seconds for animation stops
    Then I should see a text Customer 'SeleniumTestCustomer' has been created on the page

  @smoke
  Scenario: Edit Customer
    When I enter SeleniumTestCustomer in the search customers and projects
    And I click test customer
    And I wait 1 seconds for animation stops
    And I click test customer settings
    And I click customer status
    And I click archive customer
    And I wait 1 seconds for animation stops
    Then I should see a text Status of customer 'SeleniumTestCustomer' has been changed on the page

  @smoke
  Scenario: Delete Customer
    When I enter SeleniumTestCustomer in the search customers and projects
    And I click test customer
    And I wait 1 seconds for animation stops
    And I click test customer settings
    And I click customer actions
    And I click delete customer
    And I click confirm customer deletion
    And I wait 1 seconds for animation stops
    Then I should see a text Customer 'SeleniumTestCustomer' has been deleted on the page

  @smoke
  Scenario: Create Project
    When I click add new
    And I click new project
    And I wait 1 seconds for animation stops
    And I enter SeleniumTestProject in the cp name
    And I click select customer for project
    And I click our company customer
    And I click create cp
    And I wait 1 seconds for animation stops
    Then I should see a text Project 'SeleniumTestProject' has been created on the page

  @smoke
  Scenario: Edit Project
    When I enter SeleniumTestProject in the search customers and projects
    And I click test project
    And I wait 1 seconds for animation stops
    And I click test project settings
    And I click project status
    And I click archive project
    And I wait 1 seconds for animation stops
    Then I should see a text Status of project 'SeleniumTestProject' has been changed on the page

  @smoke
  Scenario: Delete Project
    When I enter SeleniumTestProject in the search customers and projects
    And I click test project
    And I wait 1 seconds for animation stops
    And I click test project settings
    And I click project actions
    And I click delete project
    And I click confirm project deletion
    And I wait 1 seconds for animation stops
    Then I should see a text Project 'SeleniumTestProject' has been deleted on the page

  @smoke
  Scenario: Create Task through pop-up
    When I click add new
    And I click new tasks
    And I wait 1 seconds for animation stops
    And I enter SeleniumTestTask in the task name field
    And I click select customer for task
    And I click our company customer
    And I click select project for task
    And I click general project
    And I click create task
    And I wait 1 seconds for animation stops
    Then I should see a text Task 'SeleniumTestTask' has been created on the page

  @smoke
  Scenario: Show Completed Tasks
    When I click status filter
    And I click selected statuses
    And I click completed statuses
    And I click apply filter
    And I enter SeleniumTestTask in the search tasks
    And I wait 2 seconds for animation stops
    Then I should see a web element tasks not found

  @smoke
  Scenario: Edit Task through panel
    When I enter SeleniumTestTask in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task status
    And I click complete task
    And I wait 1 seconds for animation stops
    Then I should see a text Status of task 'SeleniumTestTask' has been changed on the page

  @smoke
  Scenario: Edit Task in the list
    When I enter SeleniumTestTask in the search tasks
    And I wait 1 seconds for animation stops
    And I click type of work selector
    And I click programming
    And I wait 1 seconds for animation stops
    Then I should see a text programming on the page

  @smoke
  Scenario: Delete Task
    When I click status filter
    And I click all statuses
    And I click apply filter
    And I wait 1 seconds for animation stops
    And I enter SeleniumTestTask in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task actions
    And I click delete task
    And I click confirm task deletion
    And I wait 1 seconds for animation stops
    Then I should see a text Task 'SeleniumTestTask' has been deleted on the page

  @smoke
  Scenario Outline: Remove Columns
    Examples:
      | configurate_column           | column_name               |
      | estimate configure           | estimate column           |
      | deadline configure           | deadline column           |
      | creation date configure      | creation date column      |
      | last tracking date configure | last tracking date column |
      | spent time configure         | spent time column         |
      | type of work configure       | type of work column       |
    When I click configuration
    And I click <configurate_column>
    And I click apply configuration
    And I wait 1 seconds for animation stops
    Then I should not see a web element <column_name>

  @smoke
  Scenario Outline: Add Columns
    Examples:
      | configurate_column           | column_name               |
      | estimate configure           | estimate column           |
      | deadline configure           | deadline column           |
      | creation date configure      | creation date column      |
      | last tracking date configure | last tracking date column |
      | spent time configure         | spent time column         |
      | type of work configure       | type of work column       |
    When I click configuration
    And I click <configurate_column>
    And I click apply configuration
    And I wait 1 seconds for animation stops
    Then I should see a web element <column_name>

  @smoke
  Scenario: Select all tasks
    When I perform select in the select all
    Then I should see a web element bulk actions panel

  @smoke
  Scenario: Show only active projects
    When I click cp selector
    And I click all active
    And I click close cp selector
    And I wait 1 seconds for animation stops
    Then I should not see a web element archived mark

  @smoke
  Scenario Outline: Sorting
    Examples:
      | asc_sorting     | asc_sorting_element | desc_sorting    | desc_sorting_element |
      | by customer     | Architects Bureau   | by customer     | Our Company          |
      | by project      | Administration      | by project      | Website maintenance  |
      | by task         | Accounting          | by task         | Website structure    |
      | by type of work | Non-Billable        | by type of work | consulting           |
    When I click <asc_sorting>
    And I wait 1 seconds for animation stops
    Then Element with <asc_sorting_element> should be displayed
    And I click <desc_sorting>
    And I wait 1 seconds for animation stops
    Then Element with <desc_sorting_element> should be displayed

  @smoke
  Scenario: Import Tasks
    When I click add new
    And I click import tasks
    And I wait 1 seconds for animation stops
    Then I should see a web element upload area
