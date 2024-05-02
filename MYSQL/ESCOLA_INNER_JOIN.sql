-- Você tem duas tabelas em um banco de dados: "alunos" e "notas". A tabela "alunos" contém informações 
-- sobre os alunos, incluindo id_aluno, nome e curso. A tabela "notas" contém as notas
-- dos alunos em diferentes disciplinas, com campos como id_aluno, disciplina e nota. Escreva uma consulta
-- SQL que retorne o nome do aluno e a nota obtida em todas as disciplinas.

create database escola_join;

use escola_join;

create table alunos (
    id_aluno int primary key,
    nome varchar(50),
    curso varchar(50)
);

create table notas (
    id_nota int primary key,
    id_aluno int,
    disciplina varchar(50),
    nota int,
    foreign key (id_aluno) references alunos(id_aluno)
);

insert into alunos (id_aluno, nome, curso) values
(1, 'João', 'Engenharia'),
(2, 'Maria', 'Medicina'),
(3, 'Pedro', 'Direito');

insert into notas (id_nota, id_aluno, disciplina, nota) values
(1, 1, 'Matemática', 80),
(2, 1, 'Física', 75),
(3, 2, 'Anatomia', 90),
(4, 2, 'Histologia', 85),
(5, 3, 'Direito Penal', 88);


select alunos.nome, notas.disciplina, notas.nota
from alunos
inner join notas on alunos.id_aluno = notas.id_aluno;
