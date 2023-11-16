import mysql.connector

meubanco = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Senai125@',
    database='database'
)

print(meubanco)

meucursor = meubanco.cursor()

try:
    meucursor.execute('DROP TABLE frutas_variadas')
    print('Tabela excluída com sucesso!')

except mysql.connector.Error as err:
    if err.errno == 1051:  # Verifica se o erro é de tabela inexistente
        print('A tabela não existe. Nenhuma alteração feita.')
    else:
        print(f'Erro: {err}')

meubanco.close()