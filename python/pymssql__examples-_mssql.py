"""
EXAMPLES WITH _mssql

pymssql – use it if you care about DB-API compliance, or if you are accustomed to DB-API syntax,
_mssql – use it if you care about performance and ease of use (_mssql module is easier to use than pymssql).

SOURCE 
http://pymssql.org/en/latest/_mssql_examples.html
"""

# ==============================================================================
# Quickstart and querying
# ==============================================================================
import _mssql
conn = _mssql.connect(server='SQL01', user='user', password='password', \
    database='mydatabase')
conn.execute_non_query('CREATE TABLE persons(id INT, name VARCHAR(100))')
conn.execute_non_query("INSERT INTO persons VALUES(1, 'John Doe')")
conn.execute_non_query("INSERT INTO persons VALUES(2, 'Jane Doe')")


# how to fetch rows from a table
conn.execute_query('SELECT * FROM persons WHERE salesrep=%s', 'John Doe')
for row in conn:
    print "ID=%d, Name=%s" % (row['id'], row['name'])

# examples of other query functions
numemployees = conn.execute_scalar("SELECT COUNT(*) FROM employees")
numemployees = conn.execute_scalar("SELECT COUNT(*) FROM employees WHERE name LIKE 'J%'")    # note that '%' is not a special character here
employeedata = conn.execute_row("SELECT * FROM employees WHERE id=%d", 13)


# how to fetch rows from a stored procedure
conn.execute_query('sp_spaceused')   # sp_spaceused without arguments returns 2 result sets
res1 = [ row for row in conn ]       # 1st result
res2 = [ row for row in conn ]       # 2nd result


# how to get an output parameter from a stored procedure
sqlcmd = """
DECLARE @res INT
EXEC usp_mystoredproc @res OUT
SELECT @res
"""
res = conn.execute_scalar(sqlcmd)


# how to get more output parameters from a stored procedure
sqlcmd = """
DECLARE @res1 INT, @res2 TEXT, @res3 DATETIME
EXEC usp_getEmpData %d, %s, @res1 OUT, @res2 OUT, @res3 OUT
SELECT @res1, @res2, @res3
"""
res = conn.execute_row(sqlcmd, (13, 'John Doe'))


# examples of queries with parameters
conn.execute_query('SELECT * FROM empl WHERE id=%d', 13)
conn.execute_query('SELECT * FROM empl WHERE name=%s', 'John Doe')
conn.execute_query('SELECT * FROM empl WHERE id IN (%s)', ((5, 6),))
conn.execute_query('SELECT * FROM empl WHERE name LIKE %s', 'J%')
conn.execute_query('SELECT * FROM empl WHERE name=%(name)s AND city=%(city)s', \
    { 'name': 'John Doe', 'city': 'Nowhere' } )
conn.execute_query('SELECT * FROM cust WHERE salesrep=%s AND id IN (%s)', \
    ('John Doe', (1, 2, 3)))
conn.execute_query('SELECT * FROM empl WHERE id IN (%s)', (tuple(xrange(4)),))
conn.execute_query('SELECT * FROM empl WHERE id IN (%s)', \
    (tuple([3, 5, 7, 11]),))


conn.close()

# ==============================================================================
# Exception Handling
# ==============================================================================
import _mssql

conn = _mssql.connect(server='SQL01', user='user', password='password',
                      database='mydatabase')
try:
    conn.execute_non_query('CREATE TABLE t1(id INT, name VARCHAR(50))')
except _mssql.MssqlDatabaseException as e:
    if e.number == 2714 and e.severity == 16:
        # table already existed, so quieten the error
    else:
        raise # re-raise real error
finally:
    conn.close()



# ==============================================================================
# Custom message handlers
# ==============================================================================
import _mssql

def my_msg_handler(msgstate, severity, srvname, procname, line, msgtext):
    """
    Our custom handler -- It simpy prints a string to stdout assembled from
    the pieces of information sent by the server.
    """
    print("my_msg_handler: msgstate = %d, severity = %d, procname = '%s', "
          "line = %d, msgtext = '%s'" % (msgstate, severity, procname,
                                         line, msgtext))

conn = _mssql.connect(server='SQL01', user='user', password='password')
try:
    conn.set_msghandler(my_msg_handler)  # Install our custom handler
    cnx.execute_non_query("USE mydatabase")  # It gets called at this point
finally:
    conn.close()

'''output
my_msg_handler: msgstate = x, severity = y, procname = '', line = 1, msgtext = 'Changed database context to 'mydatabase'.'
'''
