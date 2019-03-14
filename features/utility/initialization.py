from features.pages.aT_login_page import AtLoginPage
from features.pages.aP_login_page import ApLoginPage
from features.pages.general_page import GeneralPage
from features.pages.enter_tt_page import EnterTTPage
from features.pages.view_tt_page import ViewTTPage
from features.pages.features_page import Features
from features.pages.general_settings_page import GeneralSettings
from features.pages.workflow_settings_page import WorkflowSettings
from features.pages.types_of_work_page import TypesOfWork
from features.pages.aP_users import Users

from features.pages.lock_tt_page import LockTTPage
from features.pages.approve_tt_page import ApproveTTPage
from features.pages.tasks_page import TasksPage
from features.pages.reports_page import ReportsPage
from features.pages.user_list_page import UserListPage
from features.pages.leave_types_page import LeaveTypesPage
from features.pages.work_schedule_page import WorkSchedulePage
from features.pages.notification_page import NotificationPage
from features.pages.logo_color_scheme_page import LogoColorSchemePage
from features.pages.license_page import LicensePage
from features.pages.import_dump_page import ImportDumpPage


class Pages:
    at_login_page = AtLoginPage()
    ap_login_page = ApLoginPage()
    general_page = GeneralPage()
    enter_tt_page = EnterTTPage()
    view_tt_page = ViewTTPage()
    features_page = Features()
    general_settings_page = GeneralSettings()
    workflow_settings_page = WorkflowSettings()
    types_of_work_page = TypesOfWork()
    users_page = Users()

    lock_tt_page = LockTTPage()
    approve_tt_page = ApproveTTPage()
    tasks_page = TasksPage()
    reports_page = ReportsPage()
    user_list_page = UserListPage()
    leave_types_page = LeaveTypesPage()
    work_schedule_page = WorkSchedulePage()
    notification_page = NotificationPage()
    logo_color_scheme_page = LogoColorSchemePage()
    license_page = LicensePage()
    import_dump_page = ImportDumpPage()
