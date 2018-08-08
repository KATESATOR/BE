from features.utility.element import *


class EnterTTPage:

    def __init__(self):
        self.tt_field = TextField("//input[@class='text inputTT']", "xpath", "tt field")
        self.save_button = Button("SubmitTTButton", "id", "save changes")
        self.search_task = TextField("taskSearchControl_field", "id", "search tasks")
        self.tasks_found_list = Button("//div[@class='taskList']/div[@class='row task last active']", "xpath",
                                       "tasks found")
        self.week_total = TextField("weekTotal", "id", "week total")
        self.leave_button = Button("leaveButton_0_mainContentTd", "id", "leave button")
        self.choose_leave = Button("LeavePopupRadio_TimeOff", "id", "choose leave")
        self.ok_leave = Button("LeavePopupOK", "name", "ok leave")
        self.tt_comment = Button("//a[@class='cursorImageLink']", "xpath", "tt comment")
        self.comment_field = TextField("editDescriptionPopupText", "id", "comment field")
        self.ok_comment = Button("scbutton", "id", "ok button")
        self.comment_length = Element("descLengthValue", "id", "comment length")
        self.change_own_status = Button("switcher", "class", "change_own status")
        self.calendar = Button("ext-gen23", "id", "week calendar")
        self.next_month = Button("ext-gen49", "id", "next month")
        self.first_day = Button("//*[@id='ext-gen44']/tbody/tr[2]/td/table/tbody/tr[1]/td[1]", "xpath",
                                "first day")
        self.add_only = Button("addPreviousWeekReportedTasksButton", "id", "add only")
        self.new_task = Button("addTasksLink", "id", "new task")
        self.customer_button = Button("//button[@class='x-btn-text' and text()[contains(., '- Select Customer -')]]",
                                      "xpath",
                                      "customer button")
        self.our_company_customer = Button("//a[@class='x-menu-item' and text()[contains(., 'Our Company')]]",
                                           "xpath",
                                           "our company")
        self.project_button = Button("//button[@class='x-btn-text' and text()[contains(., '- Select Project -')]]",
                                     "xpath", "project button")
        self.general_project = Button("//a[@class='x-menu-item' and text()[contains(., 'General')]]",
                                      "xpath",
                                      "our company")
        self.task_field = TextField("//input[@placeholder ='Enter task name']", "xpath", "task field")
        self.create_task = Button("//div[@class='components_button  withPlusIcon']", "xpath", "create task")
        self.edit_task = Button("//div[@class='task']", "xpath", "edit task")
        self.task_name = Button("//div[@class='nameInfo editable']", "xpath", "task name")
        self.task_name_field = TextField("//input[@placeholder='Enter Task Name']", "xpath", "task name field")
        self.close_task_panel = Button("//div[@class='hideButton_panelContainer']", "xpath", "close task panel")
        self.task_actions = Button("//div[@class='actionButton']", "xpath", "task actions")
        self.delete_task = Button("//div[@class='deleteButton']", "xpath", "delete task")
        self.confirm_deletion = Button("//div[@class='submitBtn withIcon commitBtn greyButton']", "xpath",
                                       "confirm deletion")
        self.user_selector_button = Button("//div[@class='userNameWrapper']", "xpath", "user selector button")
        self.gibson_maurice_user = Button("//span[@class='userName' and text()[contains(., 'Gibson, Maurice')]]",
                                          "xpath",
                                          "user Gibson Maurice")
