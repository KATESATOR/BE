from features.utility.element import *


class WorkflowSettings:

    def __init__(self):
        self.gs_workflow_settings_workflow_open_status = Element("//*[@class='name'][contains(text(), 'test_status')]",
                                                                 "xpath",
                                                                 "Element")
        self.gs_workflow_settings_workflow_completed_status = Element(
            "//*[@class='name'][contains(text(), 'test_status_completed')]", "xpath", "Element")
        self.workflow_settings_add_new = Button("div#container div:nth-child(1) > div.addBtn > div", "CSS",
                                                "Add new open workflow")
        self.workflow_settings_add_new_name = TextField("div#container div.content > input", "CSS",
                                                        "Add new workflow name")
        self.workflow_settings_name_check = Button("//div[@class='name'][contains(text(),'test_status')]", "xpath",
                                                   "name_check")
        self.workflow_settings_apply = Button("div#container div.components_button.applyBtn", "CSS",
                                              "Add new workflow apply")
        self.workflow_settings_delete_status = Button(
            "div#container div:nth-child(5) > div.statusInfoContainer > div.deleteIcon", "CSS",
            "Delete workflow status")
        self.workflow_settings_delete_status_apply = Button(
            "div#container div:nth-child(5) > div.deleteStatusContainer > div > button", "CSS",
            "Delete ws apply button")
        self.workflow_settings_add_close = Button("div#container div:nth-child(2) > div.addBtn > div", "CSS",
                                                  "Add new completed workflow")
        self.workflow_settings_add_open = Button("div#container div:nth-child(1) > div.addBtn > div", "CSS",
                                                 "Add new completed workflow")
        self.workflow_settings_name_check_for_completed = Button(
            "//div[@class='name'][contains(text(),'test_status_completed')]", "xpath",
            "name_check")
        self.workflow_settings_delete_completed_status = Button(
            "div#container div:nth-child(2) > div.statusesList > div > div.innerScrollableContainer > div"
            " > div:nth-child(3) > div.statusInfoContainer > div.deleteIcon",
            "CSS",
            "Delete workflow status")
        self.workflow_settings_delete_completed_status_apply = Button(
            "div#container div:nth-child(2) > div.statusesList > div > div.innerScrollableContainer > div "
            "> div:nth-child(3) > div.deleteStatusContainer > div > button",
            "CSS",
            "Delete ws apply button")
