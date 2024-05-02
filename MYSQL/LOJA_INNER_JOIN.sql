create database loja_join;

use loja_join;

create table usuarios(
id int primary key,
nome varchar(50),
idade int);

create table pedidos(
id_pedido int primary key,
id_usuario int,
produto varchar(50),
quantidade int,
foreign key (id_usuario) references usuarios(id)
);


insert into usuarios (id, nome, idade) values
(1, 'John', 25),
(2, 'Maria', 17),
(3, 'Caker', 23);

insert into pedidos (id_pedido, id_usuario, produto, quantidade) values
(1, 1, 'Camiseta', 2),
(2, 2, 'Calça', 1),
(3, 1, 'Boné', 1);

select usuarios.nome, pedidos.produto, pedidos.quantidade
from usuarios
inner join pedidos on usuarios.id = pedidos.id_usuario;