import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="root"
)

cursorbd = db.cursor()
cursorbd.execute("SHOW DATABASES;")

for resultados in cursorbd:
    print(resultados)

cursorbd.close
db.close
