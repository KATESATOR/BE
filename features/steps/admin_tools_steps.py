from behave import *
from features.utility.constants import Constants


@step('I open import page with {context_id}')
def import_file(context, context_id):
    context.driver.get('https://admin:password@onlinetest.actitime.com' + Constants.importpage + context_id)


@step('I import test dump in at-automation context')
def import_dump(context):
    context.execute_steps(f"""    
    Given I open import page with 13314
    And {'import dump page'} is visible
    When I upload \qa_automation.sql from D:\Share\db dumps in import field
    And I click {'upload button'}
    Then I should see a text {'Import was successful'} on the page
    """)
