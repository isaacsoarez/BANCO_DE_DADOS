#pip install mysql.connector.python
import mysql.connector

#acesso direto ao banco de dados
meubanco = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Senai125@",
    database = "datascience"
)

print(meubanco)

meucursor = meubanco.cursor()

#usar os comandos de sql nas tuplas para INSERIR os dados

sql = "INSERT INTO frutas (nome, quantidade, pais) VALUES (%s, %s, %s)"
valores = ("Apple", 25, "Brasil")

try:
    meucursor.execute(sql, valores)
    print(meucursor.rowcount, "Registros Inseridos!")
except:
    print('Foram encontrado(s) erro(s) ao inserir o(s) registro(s)')

meubanco.commit()