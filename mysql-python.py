import mysql.connector as connection

mydb = connection.connect(
    host="localhost",
    user="root",  #Your Username
    password="PASSWORD", #Your Password
    database="pysql" #Your Database Name, If you don't have any database, create one
)

if mydb.is_connected():
   print("succesfully connected")
else:
   print("not connected")    


mycursor = mydb.cursor()

# Codes for creating table
mycursor.execute("drop table if exists empl")
mycursor.execute("create table empl(eno varchar(5),ename varchar(50),salary int)")
mycursor.execute("describe empl")
for i in mycursor:
   print(i)

# Codes for inserting data
sql_query = "insert into empl values('e1','Akash',1000),('e2','Dinesh',2000),('e3','Ashwin',3000)"
mycursor.execute(sql_query)
mycursor.execute("commit")


# Codes for updating data
mycursor.execute("update empl set salary = 3000 where eno = 'e1'")
mycursor.execute("commit")

# Delete Record
mycursor.execute("delete from empl where eno='e1'")
mycursor.execute("commit")

mycursor.execute("select * from empl")
for i in mycursor:
   print(i)

mycursor.execute("show tables")
for i in mycursor:
   print(i)

mycursor.execute("drop table empl")
for i in mycursor:
   print(i)

# insert values in table
mycursor.execute("drop table if exists empl")
mycursor.execute("create table empl(eno varchar(5),ename varchar(50),salary int)")
mycursor.execute("describe empl")
for i in mycursor:
   print(i)

sql_query = "insert into empl values('e1','Akash',1000),('e2','Dinesh',2000),('e3','Ashwin',3000)"
mycursor.execute(sql_query)
mycursor.execute("commit")

# display all records of empl

eno = input("enter eno: ") # User Input

query = "select * from empl " + "where eno = '" + eno + "'"
print(query)
mycursor.execute(query)
for i in mycursor:
   print(i)

# Set Column ‘eno’ is the Primary key
mycursor.execute("ALTER TABLE empl ADD PRIMARY KEY (eno)")
mycursor.execute("describe empl")

