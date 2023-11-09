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

#criação de cursor 
meucursor = meubanco.cursor()

try:
    meucursor.execute('ALTER TABLE frutas RENAME TO frutas_variadas')
    print('Tabela Renomeada com Sucesso')
except:
    print('Ocorreu um erro ao renomear')

