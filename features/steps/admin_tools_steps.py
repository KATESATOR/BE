from behave import *
from features.utility.constants import Constants


@step('I open import page with {context_id}')
def import_file(context, context_id):
    context.driver.get('https://admin:password@onlinetest.actitime.com' + Constants.importpage + context_id)
