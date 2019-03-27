from behave import *


#  Шаги специфичные для Lock TT

@step('I create necessary time-track and return to the lock tt')
def select_other_user(context):
    context.execute_steps(f"""
        Given I am on enter tt page
        And enter tt page is visible
        When I enter backup controlling in the search task
        And I click tasks found list
        And I enter 2:00 in the tt field
        And I click save button
        And I am on lock tt page
        And lock tt page is visible
       """)
