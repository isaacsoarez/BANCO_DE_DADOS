#pip install mysql.connector.python
import mysql.connector

#acesso direto ao banco de dados
meubanco = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Senai125@",
    database = "database"
)

print(meubanco)

meucursor = meubanco.cursor()

#usar os comandos de sql nas tuplas para INSERIR os dados

sql = "INSERT INTO frutas (nome, quantidade, pais) VALUES (%s, %s, %s)"
meucursor.execute("SELECT * FROM frutas")

resultado = meucursor.fetchall()
for row in resultado:
    print(row)