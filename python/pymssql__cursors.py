"""

SOURCE
http://pymssql.org/en/latest/pymssql_examples.html#iterating-through-results
"""
import pymssql

# ==============================================================================
# Iterating through results
# ==============================================================================
conn = pymssql.connect(server, user, password, "tempdb")
cursor = conn.cursor()
cursor.execute('SELECT * FROM persons WHERE salesrep=%s', 'John Doe')

for row in cursor:
    print('row = %r' % (row,))

conn.close()

# ==============================================================================
# Important note: Only use one cursor at a time
# ==============================================================================
'''
A connection can have only one cursor with an active query at any time. 
If you have used other Python DBAPI databases, this can lead to surprising results:
'''

# PROBLEM
c1 = conn.cursor()
c1.execute('SELECT * FROM persons')

c2 = conn.cursor()
c2.execute('SELECT * FROM persons WHERE salesrep=%s', 'John Doe')

print( "all persons" )
print( c1.fetchall() )  # shows result from c2 query!

print( "John Doe" )
print( c2.fetchall() )  # shows no results at all!


# WORKAROUND 
c1.execute('SELECT ...')
c1_list = c1.fetchall()

c2.execute('SELECT ...')
c2_list = c2.fetchall()

# use c1_list and c2_list here instead of fetching individually from
# c1 and c2


# ==============================================================================
# Rows as dictionaries
# ==============================================================================
conn = pymssql.connect(server, user, password, "tempdb")
cursor = conn.cursor(as_dict=True)

cursor.execute('SELECT * FROM persons WHERE salesrep=%s', 'John Doe')
for row in cursor:
    print("ID=%d, Name=%s" % (row['id'], row['name']))

conn.close()



# ==============================================================================
# Using with statement (context managers)
# ==============================================================================
with pymssql.connect(server, user, password, "tempdb") as conn:
    with conn.cursor(as_dict=True) as cursor:
        cursor.execute('SELECT * FROM persons WHERE salesrep=%s', 'John Doe')
        for row in cursor:
            print("ID=%d, Name=%s" % (row['id'], row['name']))



# ==============================================================================
# Calling stored procedures
# ==============================================================================
with pymssql.connect(server, user, password, "tempdb") as conn:
    with conn.cursor(as_dict=True) as cursor:
        cursor.execute("""
        CREATE PROCEDURE FindPerson
            @name VARCHAR(100)
        AS BEGIN
            SELECT * FROM persons WHERE name = @name
        END
        """)
        cursor.callproc('FindPerson', ('Jane Doe',))
        for row in cursor:
            print("ID=%d, Name=%s" % (row['id'], row['name']))


# ==============================================================================
# Cooperatively working with multi-tasking systems
# ==============================================================================
import gevent.socket
import pymssql

def wait_callback(read_fileno):
    gevent.socket.wait_read(read_fileno)

pymssql.set_wait_callback(wait_callback)