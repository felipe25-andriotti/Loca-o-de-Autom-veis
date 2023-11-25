-- Comando para remover a view
DROP VIEW IF EXISTS DetalhesLocacoes;

-- Comandos para remover as tabelas
DROP TABLE IF EXISTS Locacao;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Cliente;


CREATE TABLE Veiculo (
    Veiculo VARCHAR(50) PRIMARY KEY,
    Cor VARCHAR(50),
    Placa VARCHAR(20)
);

CREATE TABLE Cliente (
    Cliente VARCHAR(100) PRIMARY KEY,
    CPF VARCHAR(14),
    Nascimento DATE
);

CREATE TABLE Locacao (
    IdLocacao INT PRIMARY KEY AUTO_INCREMENT,
    Veiculo VARCHAR(50),
    Diaria DECIMAL(10, 2),
    Cliente VARCHAR(100),
    Dias INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (Veiculo) REFERENCES Veiculo(Veiculo),
    FOREIGN KEY (Cliente) REFERENCES Cliente(Cliente)
);

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (Veiculo, Cor, Placa) VALUES 
('Fusca', 'Preto', 'WER-3456'),
('Variante', 'Rosa', 'FDS-8384'),
('Comodoro', 'Preto', 'CVB-9933'),
('Deloriam', 'Azul', 'FGH-2256'),
('Brasília', 'Amarela', 'DDI-3948');

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Cliente, CPF, Nascimento) VALUES 
('Ariano Suassuna', '123.456.789-01', '1022-05-21'),
('Grace Hopper', '543.765.987-23', '2002-04-29'),
('Richard Feynman', '987.654.231-90', '2001-10-12'),
('Edgar Poe', '432.765.678-67', '1998-12-14'),
('Gordon Freeman', '927.384.284-44', '1984-11-26');

-- Inserindo dados na tabela Locacao
INSERT INTO Locacao (Veiculo, Diaria, Cliente, Dias, Total) VALUES 
('Fusca', 30.00, 'Ariano Suassuna', 3, 90.00),
('Variante', 60.00, 'Grace Hopper', 7, 420.00),
('Comodoro', 20.00, 'Richard Feynman', 1, 20.00),
('Deloriam', 80.00, 'Edgar Poe', 3, 240.00),
('Brasília', 45.00, 'Gordon Freeman', 7, 315.00);

CREATE VIEW DetalhesLocacoes AS
SELECT L.IdLocacao, L.Veiculo, V.Cor, V.Placa, L.Diaria, C.Cliente, C.CPF, C.Nascimento, L.Dias, L.Total
FROM Locacao L
INNER JOIN Veiculo V ON L.Veiculo = V.Veiculo
INNER JOIN Cliente C ON L.Cliente = C.Cliente;

-- Visualizando os dados na tabela Veiculo
SELECT * FROM Veiculo;

-- Visualizando os dados na tabela Cliente
SELECT * FROM Cliente;

-- Visualizando os dados na tabela Locacao
SELECT * FROM Locacao;

