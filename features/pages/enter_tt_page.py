from features.utility.element import *


class EnterTTPage:

    def __init__(self):
        self.tt_field = TextField("//input[@class='text inputTT']", "xpath", "tt field")
        self.save_button = Button("SubmitTTButton", "id", "save changes")
        self.search_task = TextField("taskSearchControl_field", "id", "search tasks")
        self.tasks_found_list = Button("table#taskSearchControl div.row.task.active", "css",
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
        self.user_calendar = Button("ext-gen10", "id", "user's week calendar")
        self.next_month = Button("ext-gen49", "id", "next month")
        self.user_next_month = Button("ext-gen36", "id", "user's next month")
        self.next_week = Button("table#ext-gen44 tr:nth-child(2) > td:nth-child(4) > a", "css",
                                "first day")
        self.user_next_week = Button("table#ext-gen31 tr:nth-child(2) > td:nth-child(4) > a", "css",
                                     "user's first day")
        self.add_only = Button("addPreviousWeekReportedTasksButton", "id", "add only")
        self.new_task = Button("addTasksLink", "id", "new task")
        self.select_customer_for_task = Button(".customerSelector .comboboxButton", "css", "customer selector")
        self.select_project_for_task = Button(".projectSelector .comboboxButton", "css", "project selector")
        self.our_company_customer = Button("//div[@class='itemRow cpItemRow ' and text()[contains(., 'Our Company')]]",
                                           "xpath",
                                           "customer Our Company")
        self.general_project = Button("//div[@class='itemRow cpItemRow ' and text()[contains(., 'General')]]",
                                      "xpath",
                                      "project General")
        self.task_field = TextField("div#createTasksPopup_content tr:nth-child(1) > td.nameCell.first > input", "css",
                                    "task field")
        self.create_task = Button("//div[@class='components_button  withPlusIcon']", "xpath", "create task")
        self.edit_task = Button("//div[@class='task']", "xpath", "edit task")
        self.task_name = Button("//div[@class='nameInfo editable']", "xpath", "task name")
        self.task_name_field = TextField("div.nameInput > input[type='text']", "css",
                                         "task name field")
        self.task_status = Button("div.statusCell div.taskStatusButton.editable", "css", "task status")
        self.task_status_review = Button(
            "//*[@class='statusCell']//*[@class='name'][contains(text(),'Ready for Review')]", "xpath",
            "ready fo review status")
        # self.task_status_clarification = Button(
        #     "//*[@class='statusCell']//*[@class='name'][contains(text(),'Need Clarification)]", "xpath",
        #     "need clarification status status")
        self.close_task_panel = Button("//div[@class='hideButton_panelContainer']", "xpath", "close task panel")
        self.task_actions = Button("//div[@class='actionButton']", "xpath", "task actions")
        self.delete_task = Button("//div[@class='deleteButton']", "xpath", "delete task")
        self.confirm_deletion = Button("//div[@class='submitBtn withIcon commitBtn greyButton']", "xpath",
                                       "confirm deletion")
        self.user_selector_button = Button("//div[@class='userNameWrapper']", "xpath", "user selector button")
        self.gibson_maurice_user = Button("//span[@class='userName' and text()[contains(., 'Gibson, Maurice')]]",
                                          "xpath",
                                          "user Gibson Maurice")
        self.approve_status = Button("//div[@class='changeStatusButton approveButton']", "xpath", "approve week")
        self.reject_status = Button("//div[@class='changeStatusButton rejectButton']", "xpath", "reject week")
        self.confirm_rejection = Button("//span[@class='ui-button-text' and text()[contains(., 'Reject')]]", "xpath",
                                        "confirm rejection")
        self.revoke_status = Button("//span[@class='revokeLink customLink']", "xpath", "revoke status")
        self.current_status = Element("//td[@class='currentStatusCell statusText']", "xpath", "current status")
