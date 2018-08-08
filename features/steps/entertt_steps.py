from behave import *


#  Шаги специфичные для Enter TT

@step('I select tt of other user')
def select_other_user(context):
    context.execute_steps(f"""
            Given {'enter_tt_page'} is visible
            When I click {'user_selector_button'}
            And I click {'gibson_maurice_user'}
            Then I should see a text {'Back to me'} on the page
       """)
