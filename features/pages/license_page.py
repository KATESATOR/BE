from features.utility.element import *


class LicensePage:
    def __init__(self):
        # Licenses
        self.contact_support_button = Button("Contact Support Team", "link", "contact support team button")
        self.contact_support_popup = Element("contactSupportPopup_supportForm", "id", "contact support popup")
        self.contact_support_popup_close_button = Button("supportPopupCloseButton", "id",
                                                         "close support contact popup button")
        self.addons_button = Button("//div[@class='popup_menu_button popup_menu_button_addons']", "xpath",
                                    "add-ons button")
        self.integration_actiplans_button = Button("//div[contains(text(), 'Integration with actiPLANS')]", "xpath",
                                                   "integration with actiPLANS")
        self.integration_popup = Element("integrationPopup_content", "id", "integration pop-up")
        self.active_license = Element("table.licensePaneBorder.active", "css", "active license")

        self.product_edition_field = Element(
            "//nobr[contains(text(), 'Product Edition:')]/../../*[@class='field_value']//*", "xpath",
            "product edition value")
        self.licensed_users_field = Element(
            "//nobr[contains(text(), 'Licensed Users:')]/../../*[@class='field_value']//*",
            "xpath", "licensed users field")
        self.issue_date_field = Element("//nobr[contains(text(), 'Issue Date:')]/../../*[@class='field_value']",
                                        "xpath", "issue date field")
