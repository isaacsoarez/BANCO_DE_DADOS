import mysql.connector

meubanco = mysql.connector.connect(
    host = 'localhost',
    user = 'root', 
    password = 'Senai125@',
    database = 'database'
)

print(meubanco)

meucursor = meubanco.cursor()

try:
    meucursor.execute('DROP TABLE frutas_variadas')
    print('Tabela excluida com Sucesso! ')

except:
    print('Tabela não removida. Reveja os comandos usados')