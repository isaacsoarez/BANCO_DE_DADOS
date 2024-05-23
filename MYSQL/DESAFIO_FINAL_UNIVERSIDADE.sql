CREATE DATABASE universidade;

USE universidade;

CREATE TABLE matriculas (
    id_matricula_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(50),
    curso VARCHAR(50),
    data_mat VARCHAR(30)
);

CREATE TABLE alunos (
    id_matricula_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(15),
    cep VARCHAR(8),
    nascimento VARCHAR(30)
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(40),
    departamento VARCHAR(50),
    creditos VARCHAR(60)
);

INSERT INTO matriculas (nome_aluno, curso, data_mat) VALUES
('Marcio Ferro', 'T.I', '20/03/2020'),
('Cleiton Ouro', 'COSMÉTICO', '25/03/2020'),
('Henrique Esmeralda', 'MODA', '22/03/2020'),
('Isaac Rubi', 'DIREITO', '25/03/2020'),
('Ester Ferrugem', 'ADMINISTRACAO', '26/03/2020'),
('Cristian Madeira', 'FILOSOFIA', '27/03/2020'),
('Mayara Papel', 'EDUCAÇÃO FÍSICA', '28/03/2020'),
('Ailton Areia', 'ARTES CENICAS', '22/03/2020'),
('Gleidsson Terra', 'PSICOLOGIA', '25/03/2020'),
('Rogério Aluminio', 'GESTÃO', '21/03/2020');

INSERT INTO alunos (nome_aluno, email, telefone, cep, nascimento) VALUES
('Marcio Ferro', 'ma@gmail.com', '87-98787676', '09172560', '30/09/2006'),
('Cleiton Ouro', 'silva@uol.com.br', '81-89760989', '09172560', '26/02/2003'),
('Henrique Esmeralda', 'llll@hotmail.com', '81-89767654', '09172560', '30/05/1999'),
('Isaac Rubi', 'minha@gmail.com', '87-98787676', '09172560', '30/09/2006'),
('Ester Ferrugem', 'lva@uol.com.br', '81-89760989', '09172560', '26/02/2003'),
('Cristian Madeira', 'ooo@hotmail.com', '81-89767654', '09172560', '30/05/1999'),
('Mayara Papel', 'uiui@gmail.com', '87-98787676', '09172560', '30/09/2006'),
('Ailton Areia', 'okolva@uol.com.br', '81-89760989', '09172560', '26/02/2003'),
('Gleidsson Terra', 'rere@hotmail.com', '81-89767654', '09172560', '30/05/1999'),
('Rogério Aluminio', 'mama@gmail.com', '87-98787676', '09172560', '30/09/2006');

INSERT INTO cursos (nome_curso, departamento, creditos) VALUES
('T.I', 'exatas', '100'),
('COSMETICO', 'exatas', '100'),
('MODA', 'humanas', '350'),
('DIREITO', 'humanas', '200'),
('ADMINISTRACAO', 'humanas', '150'),
('FILOSOFIA', 'humanas', '400'),
('EDUCAÇÃO FÍSICA', 'humanas', '230'),
('ARTES CENICAS', 'humanas', '120'),
('PSICOLOGIA', 'humanas', '345'),
('GESTÃO', 'humanas', '654');

UPDATE alunos SET email = 'marcio_updated@gmail.com' WHERE id_matricula_aluno = 1;
UPDATE alunos SET email = 'cleiton_updated@uol.com.br' WHERE id_matricula_aluno = 2;

SELECT * FROM matriculas;
SELECT * FROM alunos;
SELECT * FROM cursos;

SELECT m.id_matricula_aluno, m.nome_aluno, m.curso, c.creditos
FROM matriculas m
INNER JOIN cursos c ON m.curso = c.nome_curso;

DELIMITER //
CREATE PROCEDURE ver_cursos_creditos()
BEGIN
    SELECT m.curso, c.creditos
    FROM matriculas m
    INNER JOIN cursos c ON m.curso = c.nome_curso;
END //
DELIMITER ;

CALL ver_cursos_creditos();