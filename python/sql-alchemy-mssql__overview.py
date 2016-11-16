import pymssql

from sqlalchemy import Table, Integer, Sequence, Column



__DB = {
    'host': '13.92.40.146',
    'user': 'sa',
    'pw': 'dcm1*4U2U',
}

if __name__ == '__main__':
    conn = pymssql.connect(__DB['host'], __DB['user'], __DB['pw'], 'master')
    cur = conn.cursor()
    try:
        cur.execute('SELECT * FROM master.sys.objects')
        print(len(cur.fetchall()))
    except pymssql.Error as e:
        print(e)
    finally:
        cur.close()
