from features.utility.element import *


class TasksPage:

    def __init__(self):
        self.add_new = Button(".addNewButton", "css", "+ Add New")
        self.new_customer = Button("div.dropdownContainer.addNewMenu > div.item.createNewCustomer", "css",
                                   "New Customer")
        self.new_project = Button("div.dropdownContainer.addNewMenu > div.item.createNewProject", "css", "New Project")
        self.new_tasks = Button("div.dropdownContainer.addNewMenu > div.item.createNewTasks", "css", "New Tasks")
        self.import_tasks = Button("div.dropdownContainer.addNewMenu > div.item.importTasks", "css", "Import Tasks")
        self.cp_name = TextField(".inputNameField", "css", "Customer or Project Name field")
        self.create_cp = Button(".commitButtonPlaceHolder", "css", "Create Customer or Project button")
        self.test_customer = Button(".filteredContainer .customerNode > .title", "css", "test customer")
        self.test_customer_settings = Button(".selected > .editButton", "css", "test customer settings")
        self.customer_actions = Button(".editCustomerPanelHeader .action", "css", "customer actions")
        self.delete_customer = Button(".taskManagement_customerPanel .deleteButton > .title", "css", "delete customer")
        self.confirm_customer_deletion = Button(".scrollableContainer:nth-child(2) .submitTitle", "css",
                                                "confirm customer deletion")
        self.test_project = Button(".filteredContainer .projectNode > .title", "css",
                                   "test project")
        self.test_project_settings = Button(".selected > .editButton", "css", "test customer settings")
        self.project_actions = Button(".editProjectPanelHeader .action", "css", "project actions")
        self.delete_project = Button(".taskManagement_projectPanel .deleteButton > .title", "css", "delete project")
        self.confirm_project_deletion = Button(
            "//div[@class='taskManagement_projectPanel']//span[@class='submitTitle buttonTitle']",
            "xpath",
            "confirm project deletion")
        self.select_customer_for_project = Button(
            "//div[@class='emptySelection' and text()"
            "[contains(., '-- Please Select Customer to Add Project for  --')]]",
            "xpath",
            "customer selector")
        self.our_company_customer = Button("//div[@class='itemRow cpItemRow ' and text()[contains(., 'Our Company')]]",
                                           "xpath",
                                           "customer Our Company")
        self.select_customer_for_task = Button(".customerSelector .comboboxButton", "css", "customer selector")
        self.select_project_for_task = Button(".projectSelector .comboboxButton", "css", "project selector")
        self.general_project = Button("//div[@class='itemRow cpItemRow ' and text()[contains(., 'General')]]",
                                      "xpath",
                                      "project General")
        self.task_name_field = TextField("tr:nth-child(1) > .first > .inputFieldWithPlaceholder", "css", "task field")
        self.create_task = Button("//div[@class='components_button  withPlusIcon']", "xpath", "create task")
        self.search_customers_and_projects = TextField(
            "//div[@class='customersProjectsPanel']//input[contains(@placeholder, 'Start typing name')]",
            "xpath", "search customers and projects")
        self.search_tasks = TextField("//div[@id='taskListBlock']//input[contains(@placeholder, 'Start typing name')]",
                                      "xpath", "search tasks")
        self.found_test_task = Button(".namesContainer > .title", "css", "found test task")
        self.task_actions = Button(".taskPanelContent  .action", "css", "task actions")
        self.delete_task = Button(".taskPanelContent .deleteButton > .title", "css", "delete task")
        self.confirm_task_deletion = Button(".taskPanelContent .submitTitle", "css",
                                            "confirm task deletion")
        self.customer_status = Button(".tab > .details > .detailsColumn > .statusButton", "css", "customer status")
        self.archive_customer = Button("//div[@style='display: block; top: 124px; left: 45px;']/div[2]", "xpath",
                                       "archive customer")
        self.project_status = Button(".active > .active > .downIcon", "css", "project status")
        self.archive_project = Button("//div[@style='display: block; top: 124px; left: 55px;']/div[2]", "xpath",
                                      "archive project")
        self.task_status = Button("//div[@class='detailsRow withTypeOfWork']//div[@class='taskStatusButton editable']",
                                  "xpath",
                                  "task status")
        self.complete_task = Button(
            "//div[@class='detailsRow withTypeOfWork']//div[@class='completedStatusesContainer']/div[2]",
            "xpath", "complete task")
        self.default_view = Button(".table", "css", "default view")
        self.status_filter = Button(".statusFilterButtonContainer .downIcon", "css", "status filter")
        self.all_statuses = Button(".allSection > label", "css", "all statuses")
        self.selected_statuses = Button("//div[@class='taskStatusSelection']//div[text()='Selected statuses:']",
                                        "xpath", "selected statuses")
        self.open_statuses = Button("div.openStatusesContainer > div.workflowStatusTypeNode > label > span.checkmark",
                                    "css",
                                    "open statuses checkbox")
        self.completed_statuses = Button(
            "div.completedStatuses > div > div.workflowStatusTypeNode > label > span.checkmark", "css",
            "completed statuses")
        self.apply_filter = Button(".apply", "css", "apply filter")
        self.type_of_work_selector = Button("//*[@class='taskRowsTable']//div[@class='typeOfWorkButton editable']",
                                            "xpath", "type of work selector")
        self.programming = Button("//div[@class='typeOfWorkList']//div[text()='programming']", "xpath",
                                  "programming type of work")
        self.configuration = Button(".configuratorButton_taskManagement", "css", "column configuration")
        self.apply_configuration = Button("//div[@class='columnsConfiguratorMenu']//div[@class='applyButton']", "xpath",
                                          "apply configuration")
        self.estimate_configure = Button("//div[@class='columnsConfiguratorMenu']//span[text()='Estimate']", "xpath",
                                         "estimate configure")
        self.estimate_column = Element("//table[@class='headerRowTable']//td[@class='estimate']", "xpath",
                                       "estimate column")
        self.deadline_configure = Button("//div[@class='columnsConfiguratorMenu']//span[text()='Deadline']", "xpath",
                                         "deadline configure")
        self.deadline_column = Element("//table[@class='headerRowTable']//td[@class='deadline']", "xpath",
                                       "deadline column")
        self.creation_date_configure = Button("//div[@class='columnsConfiguratorMenu']//span[text()='Creation Date']",
                                              "xpath",
                                              "creation date configure")
        self.creation_date_column = Element("//table[@class='headerRowTable']//td[@class='creationDate']", "xpath",
                                            "creation date column")
        self.last_tracking_date_configure = Button(
            "//div[@class='columnsConfiguratorMenu']//span[text()='Last Tracking Date']",
            "xpath",
            "Last Tracking date configure")
        self.last_tracking_date_column = Element("//table[@class='headerRowTable']//td[@class='lastTrackingDate']",
                                                 "xpath",
                                                 "Last Tracking date column")
        self.spent_time_configure = Button("//div[@class='columnsConfiguratorMenu']//span[text()='Spent Time']",
                                           "xpath",
                                           "Spent Time configure")
        self.spent_time_column = Element("//table[@class='headerRowTable']//td[@class='spentTime']", "xpath",
                                         "Spent Time column")
        self.type_of_work_configure = Button("//div[@class='columnsConfiguratorMenu']//span[text()='Type of Work']",
                                             "xpath",
                                             "Type of Work configure")
        self.type_of_work_column = Element("//table[@class='headerRowTable']//td[@class='typeOfWork']", "xpath",
                                           "Type of Work column")
        self.tasks_not_found = Element("//div[@class='tasksNotFoundMessage']", "xpath", "There are no tasks")
        self.select_all = Button("//table[@class='headerRowTable']//td[@class='selection']", "xpath",
                                 "Select all checkbox")
        self.bulk_actions_panel = Element(".bulkOperationsPanel", "css", "Bulk actions panel")
        self.archived_mark = Element("//span[@class='archived']", "xpath", "archived mark")
        self.cp_selector = Button("customersProjectsPanelFilterCPSelectorContainer", "id", "cp selector")
        self.all_active = Button("//label[text()='All active projects of all active customers']", "xpath",
                                 "all active projects")
        self.close_cp_selector = Button("//span[text()='Close']", "xpath", "close cp selector")
        self.by_customer = Button("//table//span[@class='titleLabel'][text()='Customer']/..", "xpath",
                                  "sorting by customer")
        self.by_project = Button("//table//span[@class='titleLabel'][text()='Project']/..", "xpath",
                                 "sorting by project")
        self.by_task = Button("//table//span[@class='titleLabel'][text()='Task']/..", "xpath",
                              "sorting by task")
        self.by_status = Button("//table[@class='headerRowTable']//span[text()='Status']", "xpath",
                                "sorting by status")
        self.by_type_of_work = Button("//table[@class='headerRowTable']//span[text()='Type of Work']", "xpath",
                                      "sorting by type of work")
        self.add_task = Button("div#taskListBlock div.components_button.addNewTaskButton.withPlusIcon", "css",
                               "add task button")
        self.task_name_field_in_panel = TextField(".taskNamePlaceholder > .editable input", "css",
                                                  "task name field in panel")
        self.create_task_through_panel = Button(".create_task_sliding_panel .components_button:nth-child(1)", "css",
                                                "create task through panel")
        self.download_sample = Button("sampleCSVFileLink", "id", "Download sample")
        self.upload_area = TextField("dropzoneClickableArea", "id", "upload area")
        self.tasks_can_manage = Button("//div[@class='scopeAccessContainer']//div[text()='Tasks I Can Manage']",
                                       "xpath", "Tasks I Can Manage")
        self.all_customers = Button("//div[contains(@class, 'allCustomersNode')]", "xpath", "all customers")
