import mysql.connector

# Criar a variável para armazenar a conexão com o Banco de Dados
banco = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Senai125@",
    database="datascience"
)

# Criar o cursor para executar comandos SQL
meucursor = banco.cursor()

# Realizar uma consulta, deleção, atualização ou inserção no Banco de Dados
meucursor.execute('SELECT * FROM frutas')

# Armazenar o resultado do select em uma variável
resultados = meucursor.fetchall()

# Maneira 1 de exibir os dados da Consulta
print(resultados)


try:
    meucursor.execute("UPDATE frutas SET pais='Chile'")
    print("Atualização de país concluída com sucesso!")
except:
    print("Não foi possível realizar alterações")

# Quando executarmos ATUALIZAÇÃO, EXCLUSÃO OU INCLIÇÃO, devemos usar o COMMIT
banco.commit()