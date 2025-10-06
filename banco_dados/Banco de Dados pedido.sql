-- Nomes
-- Gabriel de Albuquerque
-- Anderson Filipim
-- Miguel Angel
-- Jonatas Calebe
-- Victor de Melo
-- Cauã Santos



CREATE DATABASE RESTAURANTE

USE RESTAURANTE

CREATE TABLE PEDIDO (
    ID_PEDIDO bigint identity primary key,
    DATA date not null,
    STATUS varchar(20) not null, -- statuspedidoenum
    id_restaurante, -- FK do restaurante, porém não temos a tabela restaurante.
    foreign key (id_restaurante) references Restaurante); 

CREATE TABLE ITEM_PEDIDO (
    ID_ITEM_PEDIDO bigint identity primary key,
    QUANTIDADE int not null,
    OBSERVACAO varchar(255),
    PEDIDO_ID bigint not null,
    foreign key (id_itemcardapio) references ItemCardapio, --fk do cardapio, porém não temos a tabela itemcardapio.
    foreign key (PEDIDO_ID) references PEDIDO(ID_PEDIDO) 
);

CREATE TABLE AVALIACAO (
    ID_AVALIACAO bigint identity primary key,
    NOTA int,
    COMENTARIO varchar(255),
    PEDIDO_ID bigint not null,
    foreign key (PEDIDO_ID) references PEDIDO(ID_PEDIDO)
);


INSERT INTO ITEM_PEDIDO
VALUES(10,'Sem cebola por favor.',1),
(412,'Quero a carne sem sal.',2),
(411,'Quero agua com limão.',3),
(2,'Com coca cola.',4),
(1,'Mal passado',5)

INSERT INTO PEDIDO
VALUES('2024-10-15','PAGO'),
('2024-10-16','PAGO'),
('2024-10-15','PAGO'),
('2024-10-15','PAGO'),
('2024-10-15','PAGO');

INSERT INTO AVALIACAO
VALUES(12,'Medio',1),
(11,'OTIMO',2),
(14,'RUIM',3),
(15,'BOM',4),
(16,'RUIM',5);






