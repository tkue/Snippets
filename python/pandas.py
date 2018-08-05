
# --------------------------------------
# Handling encoding
# --------------------------------------
import pandas as pd

for file in os.listdir(os.curdir):
	if not file.endswith('csv'):
		continue
	try:
		df = pandas.read_csv(file, low_memory=False)
	except UnicodeDecodeError:
		df = pandas.read_csv(file, encoding='latin1') # latin1 = ISO-8859-1


# ==============================================================================
# Databases 
# ==============================================================================


# --------------------------------------
# Reading from SQL Server
# --------------------------------------
# http://stackoverflow.com/questions/30535476/pandas-reading-from-sql-server-and-outputting-to-csv-encoding-problems#30535477
"""
Need to convert any column with non-ascii chars to udf explicitly
"""
def convert(my_str):
	my_str.decode('Windows-1252').encode('utf-8')
df["Name"] = df["Name"].apply(convert)


class ClassName(object):
	"""docstring for ClassName"""
	def __init__(self, arg):
		super(ClassName, self).__init__()
		self.arg = arg

