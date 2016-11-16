import os


file = 'filename'
try:
	status = os.remove(file)
except Exception, err:
	print(err)
	return status 
