from features.utility.element import *


class AtLoginPage:

    def __init__(self):

        self.username_field = TextField("username", "id", "username field")
        self.password_field = TextField("//input[@name='pwd']", "xpath", "password_field")
        self.login_button = Button("loginButton", "id", "login_button")
        self.keep_me_logged_in_checkbox = CheckBox("keepLoggedInCheckBox", "id", "keep me logged in checkbox")

