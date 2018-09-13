Feature: Tasks interface by user
# перед прохождением тестов нужно настроить права и доступы пользователя:
# Enter TT, Manage Scope of Work; MA = project Website Creation; WA = project Consulting, customer Our Company

  Background:
    Given I am logged in as user
    And I am on tasks page
    And tasks page is visible
    And I click default view

  @smoke
  Scenario: Check Work Assignments
    Then I should not see a text Architects Bureau on the page
    And I should not see a text Updating the current website on the page
    And I should not see a text Add New on the page

  @smoke
  Scenario: Check Customer
    When I enter Boston Chocolate in the search customers and projects
    And I click test customer
    And I wait 1 seconds for animation stops
    And I click test customer settings
    And I wait 1 seconds for animation stops
    Then I should not see a web element customer actions

  @smoke
  Scenario: Check Project
    When I enter Consulting in the search customers and projects
    And I click test project
    And I wait 1 seconds for animation stops
    And I click test project settings
    And I wait 1 seconds for animation stops
    Then I should not see a web element project actions

  @smoke
  Scenario: Create Task through panel
    When I enter Website creation in the search customers and projects
    And I click test project
    And I wait 1 seconds for animation stops
    And I click add task
    And I enter SeleniumTestTaskforUser in the task name field in panel
    And I click create task through panel
    And I wait 1 seconds for animation stops
    Then I should see a text SeleniumTestTaskforUser on the page

  @smoke
  Scenario: Show Completed Tasks
    When I click status filter
    And I click selected statuses
    And I click completed statuses
    And I click apply filter
    And I enter Specifying environment: tools, framework in the search tasks
    And I wait 2 seconds for animation stops
    Then I should see a text Specifying environment: tools, framework on the page

  @smoke
  Scenario: Edit Task through panel
    When I enter SeleniumTestTaskforUser in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task status
    And I click complete task
    And I wait 1 seconds for animation stops
    Then I should see a text Status of task 'SeleniumTestTaskforUser' has been changed on the page

  @smoke
  Scenario: Edit Task in the list
    When I enter SeleniumTestTaskforUser in the search tasks
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
    And I enter SeleniumTestTaskforUser in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task actions
    And I click delete task
    And I click confirm task deletion
    And I wait 1 seconds for animation stops
    Then I should see a text Task 'SeleniumTestTaskforUser' has been deleted on the page

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
      | by customer     | Boston Chocolate    | by customer     | Our Company          |
      | by project      | Administration      | by project      | Website creation     |
      | by task         | Accounting          | by task         | Training             |
      | by type of work | Non-Billable        | by type of work | consulting           |
    When I click <asc_sorting>
    And I wait 1 seconds for animation stops
    Then Element with <asc_sorting_element> should be displayed
    And I click <desc_sorting>
    And I wait 1 seconds for animation stops
    Then Element with <desc_sorting_element> should be displayed
