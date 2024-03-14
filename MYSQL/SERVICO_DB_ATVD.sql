-- Criar base de dados chamada Serviços
CREATE DATABASE IF NOT EXISTS Servicos;

-- Usar a base de dados criada
USE Servicos;

-- Criar tabela de clientes
CREATE TABLE IF NOT EXISTS Clientes (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Endereco VARCHAR(100),
    CEP VARCHAR(8),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    UF CHAR(2),
    Ultima_Compra DATE
);

-- Inserir clientes na tabela
INSERT INTO Clientes (CPF, Nome, Data_Nascimento, Endereco, CEP, Bairro, Cidade, UF)
VALUES 
('04496332780', 'João da Silva', '1969-11-25', 'Rua Antônio Nunes', '88045963', 'Palmeiras', 'Londrina', 'PR'),
('05485031490', 'Ana Regina Fagundes', '1986-09-21', 'Rua Palmeiras Novas', '88078923', 'Leblon', 'Rio de Janeiro', 'RJ'),
('03350314905', 'Fernando Soares', '1990-03-05', 'Rua Palmeiras Novas', '88048917', 'Copacabana', 'Rio de Janeiro', 'RJ');

-- Iniciar transação
START TRANSACTION;

-- Selecionar clientes do Rio de Janeiro
SELECT * FROM Clientes WHERE Cidade = 'Rio de Janeiro';

-- Confirmar transação
COMMIT;

-- Iniciar nova transação
START TRANSACTION;

-- Deletar clientes de Londrina
DELETE FROM Clientes WHERE Cidade = 'Londrina';

-- Confirmar nova transação
COMMIT;

-- Inserir mais um cliente no RJ
INSERT INTO Clientes (CPF, Nome, Data_Nascimento, Endereco, CEP, Bairro, Cidade, UF)
VALUES 
('01234567890', 'Maria Oliveira', '1980-05-15', 'Rua dos Coqueiros', '88070000', 'Ipanema', 'Rio de Janeiro', 'RJ');

-- Criar tabela de serviços
CREATE TABLE IF NOT EXISTS Servicos (
    Ordem_Serv INT AUTO_INCREMENT PRIMARY KEY,
    TipoServico VARCHAR(100),
    DataCont DATE,
    DataPrazo DATE,
    ValorServ DECIMAL(10, 2),
    FuncionarioResponsavel VARCHAR(100)
);

-- Inserir serviços na tabela
INSERT INTO Servicos (TipoServico, DataCont, DataPrazo, ValorServ)
VALUES 
('Instalação de Internet', '2024-03-14', '2024-03-20', 150.00),
('Manutenção de Linha Telefônica', '2024-03-15', '2024-03-18', 80.00),
('Configuração de Roteador', '2024-03-16', '2024-03-17', 50.00);

-- Adicionar campo FuncionarioResponsavel em Serviços
ALTER TABLE Servicos ADD FuncionarioResponsavel VARCHAR(100);

-- Atualizar tabela Servicos inserindo funcionários responsáveis
UPDATE Servicos SET FuncionarioResponsavel = 'João' WHERE Ordem_Serv = 1;
UPDATE Servicos SET FuncionarioResponsavel = 'Maria' WHERE Ordem_Serv = 2;
UPDATE Servicos SET FuncionarioResponsavel = 'Fernando' WHERE Ordem_Serv = 3;
