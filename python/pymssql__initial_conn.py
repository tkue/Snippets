"""
Connecting using Windows Authentication

When connecting using Windows Authentication, 
this is how to combine the database’s hostname and instance name, 
and the Active Directory/Windows Domain name and the username. 
This example uses raw strings (r'...') for the strings that contain a backslash.

RAW STRINGS
https://docs.python.org/3/reference/lexical_analysis.html#string-and-bytes-literals

SOURCE
http://pymssql.org/en/latest/pymssql_examples.html#connecting-using-windows-authentication
"""
import pymssql


conn = pymssql.connect(
    host=r'dbhostname\myinstance',
    user=r'companydomain\username',
    password=PASSWORD,
    database='DatabaseOfInterest'
)