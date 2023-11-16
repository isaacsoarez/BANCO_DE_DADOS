import mysql.connector

meubanco = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Senai125@",
    database="datascience"
)

meucursor = meubanco.cursor()

sql = "INSERT INTO frutas (nome, quantidade, pais) VALUES (%s, %s, %s)"
valores = [
    ('Maça', 25, 'Brasil'),
    ('Banana', 40, 'México'),
    ('Morango', 30, 'Itália'),
    ('Manga', 12, 'Rússia'),
    ('Pera', 22, 'Grécia'),
    ('Amora', 56, 'Bolivia'),
    ('Uva', 45, 'França'),
    ('Laranja', 93, 'EUA')
]

try:
    meucursor.executemany(sql, valores)
    print(meucursor.rowcount, "Registros Inseridos!")
    meubanco.commit()
except Exception as e:
    print(f"Erro: {e}")
    meubanco.rollback() 

    
meucursor.close()
meubanco.close()