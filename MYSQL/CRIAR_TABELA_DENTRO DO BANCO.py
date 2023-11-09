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


#criação de tabelas e atributos
#é utilizado a linguagem sql pra criar a table
sql = "CREATE TABLE frutas(nome VARCHAR(50) NOT NULL, quantidade INT DEFAULT 0, pais VARCHAR(30), PRIMARY KEY(nome) )"
meucursor.execute(sql)
print('Tabela Criada!')


meubanco.commit()