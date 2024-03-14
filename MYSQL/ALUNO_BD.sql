create database escola;
use escola; 

create table aluno(
mt_aluno integer not null primary key,
nome varchar(50)not null,
endereco varchar(100) not null,
telefone int not null,
data_nasc date not null);

create table curso(
idcurso integer not null primary key auto_increment,
nomeCurso varchar(100) not null,
duracao time not null);

create table materia(
idmateria integer not null primary key auto_increment,
nomeMateria varchar(100) not null,
siglamateria varchar(10) not null,
duracao time not null);

create table professor(
matProf integer not null primary key,
nomeProf varchar(100) not null,
dt_nasc date not null,
telefone varchar(20) not null);

create table turma(
idturma integer not null primary key auto_increment,
nometurma varchar(100) not null,
siglaturma varchar(10) not null);


alter table aluno add column nomeResp varchar(100) not null;
alter table turma add column aluno int;
alter table turma add foreign key (aluno) references aluno(mt_aluno);

alter table turma add column professor int,
add foreign key(professor) references professor(matProf);

alter table curso add column turma int,
add foreign key(turma) references turma(idturma);

alter table curso add column materia int,
add foreign key(materia) references materia(idmateria);

alter table turma add column materia int,
add foreign key(materia) references materia(idmateria);

alter table aluno drop column telefone;
alter table aluno add column telefone varchar(50);


insert into aluno(mt_aluno, nome, endereco, telefone, data_nasc, nomeResp)
values
(12345, 'Dunio Barão do Castro', 'Rua Alvares Cabral, 22', '11987654679', '2008-09-30', 'Responsável 1'),
(12346, 'Maria Barão do Castro', 'Rua Pernas Cabral, 22', '11987654679', '2008-09-30', 'Responsável 2');

select * from aluno;

update aluno
set nome = 'Julia Maria'
where mt_aluno = 12346;

select * from aluno;

insert into aluno(mt_aluno, nome, endereco, telefone, data_nasc, nomeResp)
values (12347, 'Fernando de Albuquerque', 'Rua dos Bobos, 0', '1122334455', '2000-01-01', 'Responsável 4');

select mt_aluno, nome from aluno;

delete from aluno where mt_aluno = 12347;

select mt_aluno, nome from aluno;