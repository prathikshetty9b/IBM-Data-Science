<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Connect to Db2 database on Cloud using Python

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

*   Import the ibm_db Python library
*   Enter the database connection credentials
*   Create the database connection
*   Close the database connection


**Note:** Please follow the instructions given in the first Lab of this course to Create a database service instance of Db2 on Cloud and retrieve your database Service Credentials.

## Import the `ibm_db` Python library

The `ibm_db` [API ](https://pypi.python.org/pypi/ibm_db/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork20127838-2021-01-01) provides a variety of useful Python functions for accessing and manipulating data in an IBM® data server database, including functions for connecting to a database, preparing and issuing SQL statements, fetching rows from result sets, calling stored procedures, committing and rolling back transactions, handling errors, and retrieving metadata.

We first import the ibm_db library into our Python Application

Execute the following cell by clicking within it and then
press `Shift` and `Enter` keys simultaneously



```python
!pip install --force-reinstall ibm_db ibm_db_sa
```

    Collecting ibm_db
      Downloading ibm_db-3.1.0.tar.gz (797 kB)
    [K     |████████████████████████████████| 797 kB 10.6 MB/s eta 0:00:01
    [?25h  Installing build dependencies ... [?25ldone
    [?25h  Getting requirements to build wheel ... [?25ldone
    [?25h  Installing backend dependencies ... [?25ldone
    [?25h    Preparing wheel metadata ... [?25ldone
    [?25hCollecting ibm_db_sa
      Downloading ibm_db_sa-0.3.7.tar.gz (30 kB)
    Collecting sqlalchemy>=0.7.3
      Downloading SQLAlchemy-1.4.27-cp37-cp37m-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.6 MB)
    [K     |████████████████████████████████| 1.6 MB 68.2 MB/s eta 0:00:01
    [?25hCollecting importlib-metadata
      Downloading importlib_metadata-4.8.2-py3-none-any.whl (17 kB)
    Collecting greenlet!=0.4.17
      Downloading greenlet-1.1.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (150 kB)
    [K     |████████████████████████████████| 150 kB 95.2 MB/s eta 0:00:01
    [?25hCollecting typing-extensions>=3.6.4
      Downloading typing_extensions-4.0.0-py3-none-any.whl (22 kB)
    Collecting zipp>=0.5
      Downloading zipp-3.6.0-py3-none-any.whl (5.3 kB)
    Building wheels for collected packages: ibm-db, ibm-db-sa
      Building wheel for ibm-db (PEP 517) ... [?25ldone
    [?25h  Created wheel for ibm-db: filename=ibm_db-3.1.0-cp37-cp37m-linux_x86_64.whl size=40911977 sha256=a52b098b7256cf509177ed967e8c6355de71529391f2700878e734ad3bab731c
      Stored in directory: /home/jupyterlab/.cache/pip/wheels/47/0a/77/b8b3be9a85b29763931206a34e13bcc1764e3ef13548d09797
      Building wheel for ibm-db-sa (setup.py) ... [?25ldone
    [?25h  Created wheel for ibm-db-sa: filename=ibm_db_sa-0.3.7-py3-none-any.whl size=29318 sha256=4942093af2e9ab4f8b1a9b4f2c5f754c19d63a178966532ed07fb7847163558d
      Stored in directory: /home/jupyterlab/.cache/pip/wheels/4a/e9/e7/0ee334a6cb2f09ec45978e05837b66f59494b482ef38c7ae33
    Successfully built ibm-db ibm-db-sa
    Installing collected packages: zipp, typing-extensions, importlib-metadata, greenlet, sqlalchemy, ibm-db, ibm-db-sa
      Attempting uninstall: zipp
        Found existing installation: zipp 3.5.0
        Uninstalling zipp-3.5.0:
          Successfully uninstalled zipp-3.5.0
      Attempting uninstall: typing-extensions
        Found existing installation: typing-extensions 3.10.0.2
        Uninstalling typing-extensions-3.10.0.2:
          Successfully uninstalled typing-extensions-3.10.0.2
      Attempting uninstall: importlib-metadata
        Found existing installation: importlib-metadata 4.8.1
        Uninstalling importlib-metadata-4.8.1:
          Successfully uninstalled importlib-metadata-4.8.1
      Attempting uninstall: sqlalchemy
        Found existing installation: SQLAlchemy 1.3.9
        Uninstalling SQLAlchemy-1.3.9:
          Successfully uninstalled SQLAlchemy-1.3.9
      Attempting uninstall: ibm-db
        Found existing installation: ibm-db 3.0.4
        Uninstalling ibm-db-3.0.4:
          Successfully uninstalled ibm-db-3.0.4
      Attempting uninstall: ibm-db-sa
        Found existing installation: ibm-db-sa 0.3.3
        Uninstalling ibm-db-sa-0.3.3:
          Successfully uninstalled ibm-db-sa-0.3.3
    Successfully installed greenlet-1.1.2 ibm-db-3.1.0 ibm-db-sa-0.3.7 importlib-metadata-4.8.2 sqlalchemy-1.4.27 typing-extensions-4.0.0 zipp-3.6.0



```python
import ibm_db
```

When the command above completes, the `ibm_db` library is loaded in your notebook.

## Identify the database connection credentials

Connecting to dashDB or DB2 database requires the following information:

*   Driver Name
*   Database name
*   Host DNS name or IP address
*   Host port
*   Connection protocol
*   User ID (or username)
*   User Password

**Notice:** To obtain credentials please refer to the instructions given in the first Lab of this course

Now enter your database credentials below and execute the cell with `Shift` + `Enter`



```python
#Replace the placeholder values with your actual Db2 hostname, username, and password:
dsn_hostname = "2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud" # e.g.: "54a2f15b-5c0f-46df-8954-7e38e612c2bd.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud"
dsn_uid = "dvt73383"        # e.g. "abc12345"
dsn_pwd = "dmDwNaycCoY3zqIr"      # e.g. "7dBZ3wWt9XN6$o0J"

dsn_driver = "{IBM DB2 ODBC DRIVER}"
dsn_database = "BLUDB"            # e.g. "BLUDB"
dsn_port = "32328"                # e.g. "32733" 
dsn_protocol = "TCPIP"            # i.e. "TCPIP"
dsn_security = "SSL"              #i.e. "SSL"
```

## Create the DB2 database connection

Ibm_db API uses the IBM Data Server Driver for ODBC and CLI APIs to connect to IBM DB2 and Informix.

Lets build the dsn connection string using the credentials you entered above



```python
#DO NOT MODIFY THIS CELL. Just RUN it with Shift + Enter
#Create the dsn connection string
dsn = (
    "DRIVER={0};"
    "DATABASE={1};"
    "HOSTNAME={2};"
    "PORT={3};"
    "PROTOCOL={4};"
    "UID={5};"
    "PWD={6};"
    "SECURITY={7};").format(dsn_driver, dsn_database, dsn_hostname, dsn_port, dsn_protocol, dsn_uid, dsn_pwd,dsn_security)

#print the connection string to check correct values are specified
print(dsn)
```

    DRIVER={IBM DB2 ODBC DRIVER};DATABASE=BLUDB;HOSTNAME=2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud;PORT=32328;PROTOCOL=TCPIP;UID=dvt73383;PWD=dmDwNaycCoY3zqIr;SECURITY=SSL;


Now establish the connection to the database



```python
#DO NOT MODIFY THIS CELL. Just RUN it with Shift + Enter
#Create database connection

try:
    conn = ibm_db.connect(dsn, "", "")
    print ("Connected to database: ", dsn_database, "as user: ", dsn_uid, "on host: ", dsn_hostname)

except:
    print ("Unable to connect: ", ibm_db.conn_errormsg() )

```

    Connected to database:  BLUDB as user:  dvt73383 on host:  2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud


Congratulations if you were able to connect successfuly. Otherwise check the error and try again.



```python
#Retrieve Metadata for the Database Server
server = ibm_db.server_info(conn)

print ("DBMS_NAME: ", server.DBMS_NAME)
print ("DBMS_VER:  ", server.DBMS_VER)
print ("DB_NAME:   ", server.DB_NAME)
```

    DBMS_NAME:  DB2/LINUXX8664
    DBMS_VER:   11.05.0600
    DB_NAME:    BLUDB



```python
#Retrieve Metadata for the Database Client / Driver
client = ibm_db.client_info(conn)

print ("DRIVER_NAME:          ", client.DRIVER_NAME) 
print ("DRIVER_VER:           ", client.DRIVER_VER)
print ("DATA_SOURCE_NAME:     ", client.DATA_SOURCE_NAME)
print ("DRIVER_ODBC_VER:      ", client.DRIVER_ODBC_VER)
print ("ODBC_VER:             ", client.ODBC_VER)
print ("ODBC_SQL_CONFORMANCE: ", client.ODBC_SQL_CONFORMANCE)
print ("APPL_CODEPAGE:        ", client.APPL_CODEPAGE)
print ("CONN_CODEPAGE:        ", client.CONN_CODEPAGE)
```

## Close the Connection

We free all resources by closing the connection. Remember that it is always important to close connections so that we can avoid unused connections taking up resources.



```python
ibm_db.close(conn)
```

## Summary

In this tutorial you established a connection to a DB2 database on Cloud database from a Python notebook using ibm_db API.


## Author

<a href="https://www.linkedin.com/in/ravahuja?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork20127838-2021-01-01">Rav Ahuja</a>

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description                 |
| ----------------- | ------- | ---------- | ---------------------------------- |
| 2021-07-09        | 2.1     | Malika     | Updated the connection string      |
| 2020-08-28        | 2.0     | Lavanya    | Moved lab to course repo in GitLab |

<hr>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

