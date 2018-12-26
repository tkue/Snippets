import os
import requests
import zipfile
import io

from shutil import rmtree


def get_mssql_scripter():
    mssql_scripter_path = 'mssql-scripter'
    mssql_scripter_dl_path = 'mssql-scripter-dev'

    if os.path.exists(mssql_scripter_path):
        rmtree(mssql_scripter_path)

    r = requests.get('https://github.com/Microsoft/mssql-scripter/archive/dev.zip', stream=True)
    z = zipfile.ZipFile(io.BytesIO(r.content))
    z.extractall()

    try:
        os.rename(mssql_scripter_dl_path, mssql_scripter_path)
    except Exception as e:
        print('Unable to find path for mssql-scripter: {}'.format(mssql_scripter_dl_path))
        print('Path is currently hard-coded')
        print(e)


def main():
    get_mssql_scripter()


if __name__ == '__main__':
    main()