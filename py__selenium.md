Selenium
========


## Locating elements (methods)

- find_element_by_id
- find_element_by_name
- find_element_by_xpath
- find_element_by_link_text
- find_element_by_partial_link_text
- find_element_by_tag_name
- find_element_by_class_name
- find_element_by_css_selector

## Find multiple elements (returns list)

- find_elements_by_name
- find_elements_by_xpath
- find_elements_by_link_text
- find_elements_by_partial_link_text
- find_elements_by_tag_name
- find_elements_by_class_name
- find_elements_by_css_selector

## _By_ class selectors

ID = "id"
XPATH = "xpath"
LINK_TEXT = "link text"
PARTIAL_LINK_TEXT = "partial link text"
NAME = "name"
TAG_NAME = "tag name"
CLASS_NAME = "class name"
CSS_SELECTOR = "css selector"


## Basic Shit

```python
from selenium import webdriver


# ==============================================================================
# Driver and init setup
# ==============================================================================
def get_driver(self):
    self.driver = webdriver.Firefox()

def close_driver(self):
    if self.driver:
        self.driver.close()

# ==============================================================================
# Finding elements | submitting & sending keys
# ==============================================================================
def send_keys(self):
    elem = self.driver.find_element_by_name("q")
    elem.send_keys("pycon")
    elem.send_keys(Keys.RETURN)

    elem.send_keys(" and some", Keys.ARROW_DOWN)

    elem.clear()


def find_element(self):
    """
        <input type="text" name="passwd" id="passwd-id" />

        Note:
            - XPATH: Text must be exact match
                > if more than one
                    will only return 1st

        Exception:
            NoSuchElementException

            thrown if nothing found
    """
    element = self.driver.find_element_by_id('passwd-id')
    element = self.driver.find_element_by_name('passwd')
    element = self.driver.find_element_by_xpath("//input[@id='passwd-id']")


def click_button(self):
    self.driver.find_element_by_id('submit').click()


def drag_and_drop(self):
    from selenium.webdriver import ActionChains

    elem = self.driver.find_element_by_name('source element')
    target = self.driver.find_element_by_name('target element')

    action_chains = ActionChains(self.driver)
    action_chains.drag_and_drop(elem, target).perform()

# ==============================================================================
# Windows and frames
# ==============================================================================

def popup_dialog(self):
    alert = self.driver.switch_to_alert()

# ==============================================================================
# Navigation | History | Location
# ==============================================================================

def navigation(self):
    self.driver.get('webpage url')

    self.driver.forward()
    self.driver.back()

def cookies(self):
    # Go to the correct domain
    driver.get("http://www.example.com")

    # Now set the cookie. This one's valid for the entire domain
    cookie = {‘name’ : ‘foo’, ‘value’ : ‘bar’}
    driver.add_cookie(cookie)

    # And now output all the available cookies for the current URL
    driver.get_cookies()


# ==============================================================================
# Exceptions
# ==============================================================================
def no_element_exception(self):
    try:
        element = self.driver.find_element_by_xpath("//input[@id='passwd-id']")
    except NoSuchElementException:
        print('Element not found')


# ==============================================================================
# Cycling options and filling in forms
# ==============================================================================

def cycle_options(self):
    element = driver.find_element_by_xpath("//select[@name='name']")
    all_options = element.find_elements_by_tag_name('option')
    for opt in all_options:
        print("Value is: %s" % option.get_attribute("value"))
        opt.click()

def cycle_using_select(self):
    from selenium.webdriver.support.ui import Selecct

    index = 0
    select_val = 'value'

    select = Select(self.driver.find_element_by_name('name'))
    select.select_by_index(index)
    select.select_by_visible_text('text')
    select.select_by_value(select_val)

def dselect_all_selected_options(self):
    from selenium.webdriver.support.ui import Selecct

    select = Select(driver.find_element_by_id('id'))
    select.dselect_all()

def get_all_selected_options(self):
    """Returns all selected options as list"""
    from selenium.webdriver.support.ui import Selecct

    select = Select(self.driver.find_element_by_xpath('xpath-value'))
    all_selected_options = select.all_selected_options
    # Get list of options
    options = select.options



```

## Making the WebDriver wait

http://www.marinamele.com/selenium-tutorial-web-scraping-with-selenium-and-python

```python
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait

def get_driver(wait_time_sec: int):
    driver = webdriver.Firefox()
    driver.wait = WebDriverWait(driver, wait_time_sec)
    return driver

```

## Element lookup example

http://www.marinamele.com/selenium-tutorial-web-scraping-with-selenium-and-python

```python

import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException


def init_driver():
    driver = webdriver.Firefox()
    driver.wait = WebDriverWait(driver, 5)
    return driver


def lookup(driver, query):
    driver.get("http://www.google.com")
    try:
        box = driver.wait.until(EC.presence_of_element_located(
            (By.NAME, "q")))
        button = driver.wait.until(EC.element_to_be_clickable(
            (By.NAME, "btnK")))
        box.send_keys(query)
        button.click()
    except TimeoutException:
        print("Box or Button not found in google.com")


if __name__ == "__main__":
    driver = init_driver()
    lookup(driver, "Selenium")
    time.sleep(5)
    driver.quit()

```


## ElementNotVisible

http://www.marinamele.com/selenium-tutorial-web-scraping-with-selenium-and-python

```python
from selenium.common.exceptions import ElementNotVisibleException

def lookup(driver, query):
    driver.get("http://www.google.com")
    try:
        box = driver.wait.until(EC.presence_of_element_located(
            (By.NAME, "q")))
        button = driver.wait.until(EC.element_to_be_clickable(
            (By.NAME, "btnK")))
        box.send_keys(query)
        try:
            button.click()
        except ElementNotVisibleException:
            button = driver.wait.until(EC.visibility_of_element_located(
                (By.NAME, "btnG")))
            button.click()
    except TimeoutException:
        print("Box or Button not found in google.com")

```


## Unit Test

http://selenium-python.readthedocs.io/getting-started.html#walk-through-of-the-example

```python
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class PythonOrgSearch(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Firefox()

    def test_search_in_python_org(self):
        driver = self.driver
        driver.get("http://www.python.org")
        self.assertIn("Python", driver.title)
        elem = driver.find_element_by_name("q")
        elem.send_keys("pycon")
        elem.send_keys(Keys.RETURN)
        assert "No results found." not in driver.page_source


    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()
```



## Examples


https://gist.github.com/hugs/830011
```python
# To install the Python client library:
# pip install -U selenium

# Import the Selenium 2 namespace (aka "webdriver")
from selenium import webdriver

# iPhone
driver = webdriver.Remote(browser_name="iphone", command_executor='http://172.24.101.36:3001/hub')

# Android
driver = webdriver.Remote(browser_name="android", command_executor='http://127.0.0.1:8080/hub')

# Google Chrome
driver = webdriver.Chrome()

# Firefox
driver = webdriver.Firefox()

# ------------------------------
# The actual test scenario: Test the codepad.org code execution service.

# Go to codepad.org
driver.get('http://codepad.org')

# Select the Python language option
python_link = driver.find_elements_by_xpath("//input[@name='lang' and @value='Python']")[0]
python_link.click()

# Enter some text!
text_area = driver.find_element_by_id('textarea')
text_area.send_keys("print 'Hello,' + ' World!'")

# Submit the form!
submit_button = driver.find_element_by_name('submit')
submit_button.click()

# Make this an actual test. Isn't Python beautiful?
assert "Hello, World!" in driver.get_page_source()

# Close the browser!
driver.quit()

```

http://stackoverflow.com/questions/17540971/how-to-use-selenium-with-python
```python
from selenium import webdriver

#Following are optional required
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException

baseurl = "http://www.mywebsite.com/login.php"
username = "admin"
password = "admin"

xpaths = { 'usernameTxtBox' : "//input[@name='username']",
           'passwordTxtBox' : "//input[@name='password']",
           'submitButton' :   "//input[@name='login']"
         }

mydriver = webdriver.Firefox()
mydriver.get(baseurl)
mydriver.maximize_window()

#Clear Username TextBox if already allowed "Remember Me"
mydriver.find_element_by_xpath(xpaths['usernameTxtBox']).clear()

#Write Username in Username TextBox
mydriver.find_element_by_xpath(xpaths['usernameTxtBox']).send_keys(username)

#Clear Password TextBox if already allowed "Remember Me"
mydriver.find_element_by_xpath(xpaths['passwordTxtBox']).clear()

#Write Password in password TextBox
mydriver.find_element_by_xpath(xpaths['passwordTxtBox']).send_keys(password)

#Click Login button
mydriver.find_element_by_xpath(xpaths['submitButton']).click()
```
