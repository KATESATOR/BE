from features.pages.aT_login_page import AtLoginPage
from features.pages.aP_login_page import ApLoginPage
from features.pages.general_page import GeneralPage
from features.pages.enter_tt_page import EnterTTPage
from features.pages.tasks_page import TasksPage
from features.pages.view_tt_page import ViewTTPage
from features.pages.features_page import Features
from features.pages.general_settings_page import GeneralSettings
from features.pages.workflow_settings_page import WorkflowSettings
from features.pages.types_of_work_page import TypesOfWork


class Pages:
    at_login_page = AtLoginPage()
    ap_login_page = ApLoginPage()
    general_page = GeneralPage()
    enter_tt_page = EnterTTPage()
    tasks_page = TasksPage()
    view_tt_page = ViewTTPage()
    features_page = Features()
    general_settings_page = GeneralSettings()
    workflow_settings_page = WorkflowSettings()
    types_of_work_page = TypesOfWork()

