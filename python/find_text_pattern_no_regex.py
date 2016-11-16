#https://blogs.msdn.microsoft.com/cdndevs/2015/03/11/python-and-data-sql-server-as-a-data-source-for-python-applications/
#################################
## Matching Patterns ##
#################################
# 
# Matching string:
#   415-555-4242


#
## No regex ##
#
# print('415-555-4242 is a phone number:')
# print(isPhoneNumber('415-555-4242'))
# print('Moshi moshi is a phone number:')
# print(isPhoneNumber('Moshi moshi'))

# 415-555-4242 is a phone number:
# True
# Moshi moshi is a phone number:
# False


if (len) != 12:
    return False;

for i in range(0, 3):
    if not text[i].isDecimal():
        return False; 

if text[3] != '-':
    return False; 

for i in range(4, 7):
    if not text[i].isDecimal():
        return False;

message = 'Call me at 415-555-1011 tomorrow. 415-555-9999 is my office.'
for i in rage(len(message)):
    chunk = message[i:i+12]
    if isPhoneNumber(chunk):
        print('Phone number is: ' + chunk)
    print('Done')

#
## Regex ##
#
import re

phoneNumRegex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
mo = phoneNumRegex.search('My number is 415-555-4242.')
print('Phone number found: ' + mo.group())

# Phone number found: 415-555-4242

# Group with parenthesis 
phoneNumRegex = re.compile(r'(\d\d\d)-(\d\d\d-\d\d\d\d)')
mo = phoneNumRegex.search('My number is 415-555-4242.')

mo.group(1)                             # '415'
mo.group(2)                             # '555-4242'
mo.group(0)                             # '415-555-4242'
mo.group()                              # '415-555-4242'
mo.groups()                             # ('415', '555-4242')

areaCode, mainNumber = mo.groups()
print(areaCode)                         # 415

print(mainNumber)                       # 555-4242


# Matching Multiple Groups with the Pipe

heroRegex = re.compile (r'Batman|Tina Fey')
mo1 = heroRegex.search('Batman and Tina Fey.')
mo1.group()
'Batman'
mo2 = heroRegex.search('Tina Fey and Batman.')
mo2.group()
'Tina Fey'

batRegex = re.compile(r'Bat(man|mobile|copter|bat)')
mo = batRegex.search('Batmobile lost a wheel')
mo.group()
'Batmobile'
mo.group(1)
'mobile'

# Optional Matching with the Question Mark
>>> batRegex = re.compile(r'Bat(wo)?man')
>>> mo1 = batRegex.search('The Adventures of Batman')
>>> mo1.group()
'Batman'
>>> phoneRegex = re.compile(r'(\d\d\d-)?\d\d\d-\d\d\d\d')
>>> mo1 = phoneRegex.search('My number is 415-555-4242')
>>> mo1.group()
'415-555-4242'
>>> mo2 = phoneRegex.search('My number is 555-4242')
>>> mo2.group()
'555-4242'


# Matching Zero or More with the Star
>>> batRegex = re.compile(r'Bat(wo)*man')
>>> mo1 = batRegex.search('The Adventures of Batman')
>>> mo1.group()
'Batman'
>>> mo2 = batRegex.search('The Adventures of Batwoman')
>>> mo2.group()
'Batwoman'
>>> mo3 = batRegex.search('The Adventures of Batwowowowoman')
>>> mo3.group()
'Batwowowowoman'


# Matching One or More with the Plus

>>> batRegex = re.compile(r'Bat(wo)+man')
>>> mo1 = batRegex.search('The Adventures of Batwoman')
>>> mo1.group()
'Batwoman'
>>> mo2 = batRegex.search('The Adventures of Batwowowowoman')
>>> mo2.group()
'Batwowowowoman'
>>> mo3 = batRegex.search('The Adventures of Batman')
>>> mo3 == None
True


# Matching Specific Repetitions with Curly Brackets

>>> haRegex = re.compile(r'(Ha){3}')
>>> mo1 = haRegex.search('HaHaHa')
>>> mo1.group()
'HaHaHa'

>>> mo2 = haRegex.search('Ha')
>>> mo2 == None
True

# Greedy and Nongreedy Matching
>>> greedyHaRegex = re.compile(r'(Ha){3,5}')
>>> mo1 = greedyHaRegex.search('HaHaHaHaHa')
>>> mo1.group()
'HaHaHaHaHa'
>>> nongreedyHaRegex = re.compile(r'(Ha){3,5}?')
>>> mo2 = nongreedyHaRegex.search('HaHaHaHaHa')
>>> mo2.group()
'HaHaHa'

# The findall() Method
>>> phoneNumRegex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
>>> mo = phoneNumRegex.search('Cell: 415-555-9999 Work: 212-555-0000')
>>> mo.group()
'415-555-9999'

>>> phoneNumRegex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d') # has no groups
>>> phoneNumRegex.findall('Cell: 415-555-9999 Work: 212-555-0000')
['415-555-9999', '212-555-0000']

>>> phoneNumRegex = re.compile(r'(\d\d\d)-(\d\d\d)-(\d\d\d\d)') # has groups
>>> phoneNumRegex.findall('Cell: 415-555-9999 Work: 212-555-0000')
[('415', '555', '1122'), ('212', '555', '0000')]


# Character Classes
'''
Shorthand character class       Represents
-------------------------       ----------

\d                              Any numeric digit from 0 to 9.

\D                              Any character that is not a numeric digit 
                                from 0 to 9.

\w                              Any letter, numeric digit, or the underscore 
                                    character.

                                (Think of this as matching “word” 
                                    characters.)

\W                              Any character that is not a 
                                    letter
                                    numeric digit
                                    underscore character

\s                              Any 
                                    space
                                    tab
                                    newline character

                                (Think of this as matching “space” 
                                    characters.)
                                
\S                              Any character that is not a 
                                    space
                                    tab
                                    newline
'''


# Making Your Own Character Classes
vowelRegex = re.compile(r'[aeiouAEIOU]')
vowelRegex.findall('RoboCop eats baby food. BABY FOOD.')
['o', 'o', 'o', 'e', 'a', 'a', 'o', 'o', 'A', 'O', 'O']

# The Caret and Dollar Sign Characters
>>> beginsWithHello = re.compile(r'^Hello')
>>> beginsWithHello.search('Hello world!')
<_sre.SRE_Match object; span=(0, 5), match='Hello'>
>>> beginsWithHello.search('He said hello.') == None
True
>>> endsWithNumber = re.compile(r'\d$')
>>> endsWithNumber.search('Your number is 42')
<_sre.SRE_Match object; span=(16, 17), match='2'>
>>> endsWithNumber.search('Your number is forty two.') == None
True
>>> wholeStringIsNum = re.compile(r'^\d+$')
>>> wholeStringIsNum.search('1234567890')
<_sre.SRE_Match object; span=(0, 10), match='1234567890'>
>>> wholeStringIsNum.search('12345xyz67890') == None
True
>>> wholeStringIsNum.search('12 34567890') == None
True

# The Wildcard Character
>>> atRegex = re.compile(r'.at')
>>> atRegex.findall('The cat in the hat sat on the flat mat.')
['cat', 'hat', 'sat', 'lat', 'mat']

# Matching Everything with Dot-Star
>>> nameRegex = re.compile(r'First Name: (.*) Last Name: (.*)')
>>> mo = nameRegex.search('First Name: Al Last Name: Sweigart')
>>> mo.group(1)
'Al'
>>> mo.group(2)
'Sweigart'
>>> nongreedyRegex = re.compile(r'<.*?>')
>>> mo = nongreedyRegex.search('<To serve man> for dinner.>')
>>> mo.group()
'<To serve man>'
>>> greedyRegex = re.compile(r'<.*>')
>>> mo = greedyRegex.search('<To serve man> for dinner.>')
>>> mo.group()
'<To serve man> for dinner.>'

# Matching Newlines with the Dot Character
>>> noNewlineRegex = re.compile('.*')
>>> noNewlineRegex.search('Serve the public trust.\nProtect the innocent.
\nUphold the law.').group()
'Serve the public trust.'

>>> newlineRegex = re.compile('.*', re.DOTALL)
>>> newlineRegex.search('Serve the public trust.\nProtect the innocent.
\nUphold the law.').group()
'Serve the public trust.\nProtect the innocent.\nUphold the law.'

'''
Review of Regex Symbols

•   The ? matches zero or one of the preceding group.
•   The * matches zero or more of the preceding group.
•   The + matches one or more of the preceding group.

•   The {n} matches exactly n of the preceding group.
•   The {n,} matches n or more of the preceding group.
•   The {,m} matches 0 to m of the preceding group.
•   The {n,m} matches at least n and at most m of the preceding group.

•   {n,m}? or *? or +? performs a nongreedy match of the preceding group.
•   ^spam means the string must begin with spam.
•   spam$ means the string must end with spam.

•   The . matches any character, except newline characters
•   \d , \w , and \s match a digit, word, or space character
•   \D , \W , and \S match anything except a digit, word, or space character

•   [abc] matches any character between the brackets (such as a, b, or c).
•   [^abc] matches any character that isn’t between the brackets.















'''