create database pagamento
use				pagamento

/*Felipe Campos
 Gabriel Amador
 Lucas Eduardo
 Eliakim 
 Caroline
 Gustavo de Souza
 */
create table statusPedidoEnum (
id_status	 numeric				 not null	primary key,
status_ped	 varchar(20)			 not null	unique,
constraint   chk_status_ped			check (status_ped in ('Criado', 'Confirmado', 'Cancelado'))
)

create table TipoFormaPagamento	(
id_forma				numeric	     not null	primary key,
forma					varchar(20),
constraint   chk_forma				check (forma in ('CARTAO_CREDITO', 'CARTAO_DEBITO', 'VALE_REFEICAO'))
)

create table FormaPagamento(
id_forma_pagamento		numeric		  not null	primary key,
id_forma				numeric		  not null,
nome					varchar(40)	  not null,
)


create table Pagamento (
id_pag					int			  not null primary key identity,
status_ped				numeric		  not null,
id_forma				numeric		  not null,
valor					decimal(10,2) not null,
nome					varchar		  not null,
numero					varchar       not null,
expiracao				varchar       not null,
codigo					varchar       not null,
constraint fk_status_ped	foreign key (status_ped) references statusPedidoEnum(id_status),
constraint fk_id_forma		foreign key (id_forma)   references TipoFormaPagamento(id_forma)
)

INSERT INTO statusPedidoEnum VALUES(1,'Criado');
INSERT INTO statusPedidoEnum VALUES(2,'Confirmado');
INSERT INTO statusPedidoEnum VALUES(3,'Cancelado');

INSERT INTO TipoFormaPagamento VALUES(1,'Cartão Crédito');
INSERT INTO TipoFormaPagamento VALUES(2,'Cartão Débito');
INSERT INTO TipoFormaPagamento VALUES(3,'Vale Refeição');

INSERT INTO Pagamento VALUES(1, 150.75, 'João Silva', '12345678901234567890', '12/25', '123', 'Pendente', 1);
INSERT INTO Pagamento VALUES(2, 200.00, 'Maria Oliveira', '09876543210987654321', '11/26', '456', 'Confirmado', 2);
INSERT INTO Pagamento VALUES(3, 50.30, 'Pedro Santos', '11223344556677889900', '10/27', '789', 'Cancelado', 3);

