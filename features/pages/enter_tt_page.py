from features.utility.element import *


class EnterTTPage:

    def __init__(self):
        self.tt_field = TextField("//*[@id='spent_16_0']", "xpath", "tt_field")
        self.save_button = Button("SubmitTTButton", "id", "save_changes")
        self.search_task = TextField("taskSearchControl_field", "id", "search_tasks")
        self.tasks_found_list = Button("//div[@class='taskList']/div[@class='row task last active']", "xpath",
                                       "tasks_found")
        self.week_total = TextField("weekTotal", "id", "week_total")
        self.leave_button = Button("leaveButton_0_mainContentTd", "id", "leave_button")
        self.choose_leave = Button("LeavePopupRadio_TimeOff", "id", "choose_leave")
        self.ok_leave = Button("/html/body/div[9]/div[2]/div/form/table/tbody/tr[2]/td/input", "xpath", "ok_leave")
        self.tt_comment = Button("timeTrack[16].commentImg[0]", "id", "tt_comment")
        self.comment_field = TextField("editDescriptionPopupText", "id", "comment_field")
        self.ok_comment = Button("scbutton", "id", "ok_button")
        self.comment_length = Element("descLengthValue", "id", "comment_length")
        self.change_own_status = Button("switcher", "class", "change_own_status")
        self.ready_status = Slider(
            "/html/body/div[9]/form/table/tbody/tr/td/table[1]/tbody/tr[1]/td[2]/div[2]/div/div[2]", "xpath",
            "ready_status")
