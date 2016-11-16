Web Scraping Tutorials and Snippets
===================================

## Overview

- [Part 1: Beautiful Soup](https://www.wakari.io/sharing/bundle/jdarring/Web_scraping_Day_1--Beautiful_Soup)

- [Part 2: Regular Expressions](https://www.wakari.io/sharing/bundle/jdarring/Web_scraping_Day_2--regular_expressions)

- [Part 3: Mechanize](https://www.wakari.io/sharing/bundle/jdarring/Web_scraping_day_3--mechanize)


## Part 1: Beautiful Soup

### Script 1 - Practice reading in XML and parsing it with BeautifulSoup

```python
from bs4 import BeautifulSoup
import urllib2

url = "http://www.govtrack.us/data/congress/113/bills/hr/hr41/data.xml"
xml = urllib2.urlopen(url).read()
soup = BeautifulSoup(xml)
#print soup.prettify()
billNum = soup.bill['number']
billSess = soup.bill['session']
chamber = soup.bill['type']
billID = "%s %s-%s" % (chamber,billSess,billNum)
print billID
```

#### Grab data as JSON

> Now that I know a bit more, it's easier and more useful to grab this data as JSON, since govtrack makes it available.

```python
import requests
import pprint

url = "https://www.govtrack.us/data/congress/113/bills/hr/hr1012/data.json"
response = requests.get(url).json()
#pprint.pprint(response)

print 'The bill %s (%s) was introduced by %s on %s. On %s it was %s' % (response['bill_id'], response['short_title'],\
                                                                        response['sponsor']['name'], response['introduced_at'],\
                                                                        response['actions'][0]['acted_at'], response['actions'][0]['text'])
```
