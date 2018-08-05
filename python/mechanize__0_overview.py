"""
Overview:
    Mechanize cheatsheet/overview
"""
"""
Source:
    http://www.pythonforbeginners.com/cheatsheet/python-mechanize-cheat-sheet
"""

# ==============================================================================
# Create a browser object
# ==============================================================================
import mechanize

br = mechanize.Browser()

# Allow everything to be written to
br.set_all_readonly(False)
# Ignore robots.txt
br.set_handle_robots(False)
# ? "Can sometimes use without this"
br.set_handle_refresh(False)
# Set headers
br.addheaders = [('User-agent', 'Firefox')]


# ==============================================================================
# Open a webpage
# ==============================================================================

response = br.open(url)

# webpage text
print(response.read())

# Get response again - to use lxml.html.fromstring()
response1 = br.response()
print(response1.read()) # then apply lxml.html.fromstring()


# ==============================================================================
# Using forms
# ==============================================================================

# List the forms that are in the page
for form in br.forms():
    print("Form name: {0}".format(form.name))
    print form

# Selecting forms
br.select_form("form1")         # Named form
br.form = list(br.forms())[0]   # Unnamed form


# ==============================================================================
# Using controls
# ==============================================================================

# Iterating
for control in br.form.controls:
    print(control)
    print('Type = %s' % control.type)
    print('Name = %s' % control.name)
    print('Value = %s' % br[control.name])

# Find control by name
control = br.form.find_control("controlName")

# ClientForm.SelectControl
# Having a select control tells you what values can be selected
if control.type == "select": # == ClientForm.SelectControl
    for item in control.items:
        print("Name = " % item.name)
        print("Values = " % str([label.txt for lavel in item.get_labels()]))

# SelectControl - Setting values
#   Need to select values as list, even if only selecting one
#       > Because it can have multiple values selected at one time
print(control.value)
print(control) # select value is starred
control.value = ["ItemName"]
print(control)

br[control.name] = ["ItemName"] # equivalent and 'more normal'


# Text controls can be set as a string
if control.type == "text": # == ClientForm.TextControl
    control.value = "values"
# Equivalent
br["controlName"] = "values"

# Readonly and disabled controls
control.readonly = False
control.disabled = True
# or disable all of them
for control in br.form.controls:
    if control.type == "submit":
        control.disabled = True

# ==============================================================================
# Submit the form
# ==============================================================================

response = br.submit()
print(reponse.read())
br.back() # can go back -->> Automatically resubmits ??


# ==============================================================================
# Finding links
# ==============================================================================

# To follow links:
#  > Need to have the link object
#    "Can be a hassle"
# Sometimes easier to get them all and then find the one you want
for link in br.links():
    print(link.text, link.url)

# Follow link and click links == same as submit and click
request = br.click_link(link)
response = br.follow_link(link)
print(reponse.geturl())



# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================


# ==============================================================================
#
# ==============================================================================
