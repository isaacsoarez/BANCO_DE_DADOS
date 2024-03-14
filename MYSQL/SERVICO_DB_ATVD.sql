CREATE DATABASE IF NOT EXISTS ServicosTelecom;

USE ServicosTelecom;

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

INSERT INTO Clientes (CPF, Nome, Data_Nascimento, Endereco, CEP, Bairro, Cidade, UF, Ultima_Compra)
VALUES
('04496332780', 'João da Silva', '1969-11-25', 'Rua Antônio Nunes', '88045963', 'Palmeiras', 'Londrina', 'PR', NULL),
('05485031490', 'Ana Regina Fagundes', '1986-09-21', 'Rua Palmeiras Novas', '88078923', 'Leblon', 'Rio de Janeiro', 'RJ', NULL),
('03350314905', 'Fernando Soares', '1990-03-05', 'Rua Palmeiras Novas', '88048917', 'Copacabana', 'Rio de Janeiro', 'RJ', NULL);

SELECT * FROM Clientes WHERE Cidade = 'Rio de Janeiro';

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Clientes WHERE Cidade = 'Londrina';

SET SQL_SAFE_UPDATES = 1;

INSERT INTO Clientes (CPF, Nome, Data_Nascimento, Endereco, CEP, Bairro, Cidade, UF, Ultima_Compra)
VALUES
('01234567890', 'Maria Santos', '1980-05-10', 'Av. Atlântica', '88070000', 'Copacabana', 'Rio de Janeiro', 'RJ', NULL);

CREATE TABLE IF NOT EXISTS Servicos (
    Ordem_Serv INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Servico VARCHAR(100),
    Data_Cont DATE,
    Data_Prazo DATE,
    Valor_Serv DECIMAL(10, 2),
    Funcionario_Responsavel VARCHAR(100)
);

DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS Add_Column_If_Not_Exists()
BEGIN
    DECLARE column_count INT;
    
    SELECT COUNT(*)
    INTO column_count
    FROM information_schema.columns
    WHERE table_schema = 'ServicosTelecom'
    AND table_name = 'Servicos'
    AND column_name = 'Funcionario_Responsavel';
    
    IF column_count = 0 THEN
        ALTER TABLE Servicos ADD COLUMN Funcionario_Responsavel VARCHAR(100);
    END IF;
END$$
DELIMITER ;

CALL Add_Column_If_Not_Exists();

INSERT INTO Servicos (Tipo_Servico, Data_Cont, Data_Prazo, Valor_Serv)
VALUES
('Manutenção de rede', '2024-03-01', '2024-03-05', 1500.00),
('Instalação de linha telefônica', '2024-03-03', '2024-03-10', 800.00),
('Configuração de roteador', '2024-03-07', '2024-03-09', 300.00);

UPDATE Servicos SET Funcionario_Responsavel = 'Pedro Silva' WHERE Ordem_Serv = 1;
UPDATE Servicos SET Funcionario_Responsavel = 'Maria Oliveira' WHERE Ordem_Serv = 2;
UPDATE Servicos SET Funcionario_Responsavel = 'José Santos' WHERE Ordem_Serv = 3;
