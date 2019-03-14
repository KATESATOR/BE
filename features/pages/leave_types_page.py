from features.utility.element import *


class LeaveTypesPage:
    def __init__(self):
        # Leave Types interface
        self.create_leave_type_button = Button("ext-gen6", "id", "create leave type button")
        self.input_name_field = TextField("inputDiv", "id", "input leave type name field")
        self.apply_button = Button("//*[@id='inputDiv']/../..//*[@class='applyButton']", "xpath", "apply button")
        self.order_button = Button(".leaveTypeListRow:last-of-type .orderNumber", "css", "order button")
        self.moved_order = Element(
            "//span[@class='leaveTypeNameText'][contains(text(), 'Leave Type Smoke Changed')]"
            "/../../../../../..//*[@class='orderNumber']",
            "xpath", "order")
        # Create Leave Type pop-up
        self.leave_type_pop_up = Button("leaveTypeLightBox", "id", "create leave type pop-up")
        self.leave_type_name = TextField("leaveTypeLightBox_nameField", "id", "input leave type name")
        self.commit_create_button = Button("leaveTypeLightBox_commitBtn", "id", "create leave type button in pop-up")
