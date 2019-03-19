from features.pages.aT_login_page import AtLoginPage
from features.pages.aP_login_page import ApLoginPage
from features.pages.general_page import GeneralPage
from features.pages.enter_tt_page import EnterTTPage
from features.pages.view_tt_page import ViewTTPage
from features.pages.lock_tt_page import LockTTPage
from features.pages.approve_tt_page import ApproveTTPage
from features.pages.tasks_page import TasksPage
from features.pages.reports_page import ReportsPage
from features.pages.user_list_page import UserListPage
from features.pages.ap_my_schedule import ApMySchedule


class Pages:
    at_login_page = AtLoginPage()
    ap_login_page = ApLoginPage()
    general_page = GeneralPage()
    enter_tt_page = EnterTTPage()
    view_tt_page = ViewTTPage()
    lock_tt_page = LockTTPage()
    approve_tt_page = ApproveTTPage()
    tasks_page = TasksPage()
    reports_page = ReportsPage()
    user_list_page = UserListPage()
    ap_my_schedule = ApMySchedule()
