CREATE DATABASE Cliente;
USE Cliente;


CREATE TABLE TBL_CLIENTE (
	ID_CLIENTE BIGINT PRIMARY KEY IDENTITY NOT NULL,
	TX_NOME VARCHAR(40) NOT NULL,
	TX_CPF VARCHAR(14) NOT NULL,
	TX_EMAIL VARCHAR(70) NOT NULL,
	TX_TELEFONE VARCHAR(11) NOT NULL,
	BO_VALIDADO BIT NOT NULL
);

CREATE TABLE TBL_ENTREGA (
	NUM_ID BIGINT PRIMARY KEY IDENTITY NOT NULL,
	TX_CEP VARCHAR(8) NOT NULL,
	TX_ENDERECO VARCHAR(50) NOT NULL,
	TX_COMPLEMENTO VARCHAR(30) NOT NULL
);

ALTER TABLE TBL_ENTREGA
ADD ID_CLIENTE BIGINT NOT NULL;

ALTER TABLE TBL_ENTREGA
ADD CONSTRAINT FK_ID_CLIENTE
FOREIGN KEY (ID_CLIENTE)
REFERENCES TBL_CLIENTE (ID_CLIENTE);



-- Inserindo dados na tabela TBL_CLIENTE
INSERT INTO TBL_CLIENTE (TX_NOME, TX_CPF, TX_EMAIL, TX_TELEFONE, BO_VALIDADO) VALUES
('Jo�o Silva', '123.456.789-00', 'joao.silva@email.com', '11999990000', 1),
('Maria Santos', '987.654.321-00', 'maria.santos@email.com', '11988887777', 1),
('Pedro Oliveira', '111.222.333-44', 'pedro.oliveira@email.com', '11977776666', 0),
('Ana Costa', '555.666.777-88', 'ana.costa@email.com', '11966665555', 1),
('Carlos Pereira', '999.888.777-66', 'carlos.pereira@email.com', '11955554444', 1),
('Juliana Rodrigues', '444.333.222-11', 'juliana.rodrigues@email.com', '11944443333', 0),
('Fernando Alves', '222.333.444-55', 'fernando.alves@email.com', '11933332222', 1),
('Amanda Lima', '777.888.999-00', 'amanda.lima@email.com', '11922221111', 1),
('Ricardo Souza', '333.222.111-00', 'ricardo.souza@email.com', '11911110000', 0),
('Patr�cia Martins', '666.777.888-99', 'patricia.martins@email.com', '11900009999', 1);

-- Inserindo dados na tabela TBL_ENTREGA
INSERT INTO TBL_ENTREGA (TX_CEP, TX_ENDERECO, TX_COMPLEMENTO, ID_CLIENTE, FK_ID_PEDIDO, FK_ID_ENT) VALUES
('01234567', 'Rua das Flores, 123', 'Apto 101', 1, 1001, 2001),
('04567890', 'Avenida Brasil, 456', 'Casa 2', 2, 1002, 2002),
('07890123', 'Pra�a da S�, 789', 'Sala 305', 3, 1003, 2003),
('03456789', 'Rua Augusta, 321', 'Loja A', 4, 1004, 2004),
('06789012', 'Alameda Santos, 654', 'Bloco B', 5, 1005, 2005),
('08901234', 'Rua XV de Novembro, 987', 'Apto 502', 6, 1006, 2006),
('02345678', 'Avenida Paulista, 159', 'Conjunto 43', 7, 1007, 2007),
('05678901', 'Rua da Consola��o, 753', 'Sobreloja', 8, 1008, 2008),s
('09012345', 'Rua Vergueiro, 286', 'Apto 201', 9, 1009, 2009),
('01239876', 'Avenida Rebou�as, 467', 'Casa 5', 10, 1010, 2010);

-- Verificar clientes inseridos
SELECT * FROM TBL_CLIENTE;

-- Verificar entregas inseridas
SELECT * FROM TBL_ENTREGA;

-- Verificar join entre as tabelas
SELECT 
    c.ID_CLIENTE,
    c.TX_NOME,
    c.TX_CPF,
    e.TX_ENDERECO,
    e.TX_CEP,
    e.TX_COMPLEMENTO
FROM TBL_CLIENTE c
INNER JOIN TBL_ENTREGA e ON c.ID_CLIENTE = e.ID_CLIENTE;