/*
NOMES:
    Rafael Martins Nogueira
    Eduardo Borges
    Igor Edgar
    Renato Luiz
    Marcos Ferreira
    Gustavo Rodrigues
*/

create database GerenciamentoRestaurante;
use GerenciamentoRestaurante;

create table TBL_USUARIO(
	ID_USUARIO BIGINT NOT NULL PRIMARY KEY IDENTITY,
	TX_NOME VARCHAR(20) NOT NULL,
	TX_SENHA VARCHAR(25) NOT NULL,
	NR_TENTATIVAS_ACESSO INT NOT NULL,
	DT_DATA_BLOQUEIO DATETIME NOT NULL,
	DT_DATA_INATIVACAO DATETIME NOT NULL,
	TX_STATUS VARCHAR(20) NOT NULL
);	

create table Tbl_Restaurante(
	id_restaurante BigInt primary key,
	tx_cnpj varchar (14) not null,
	tx_nome varchar(250) not null,
	tx_descrição varchar (250) not null,
	tx_cep varchar(9) not null,
	tx_endereco varchar (100) not null, 
	nr_taxaDeEntrega float not null,
	nr_tempoDeEntregaMinimo int not null,
	nr_tempoDeEntregaMaximo int not null,
	bool_aprovado bit not null,
	tx_TipoCozinhaEnum varchar(20) not null,
	ID_USUARIO BIGINT references TBL_USUARIO);

create table Tbl_Horario_Funcionamento(
	id_horarioFuncionamento BigInt primary key,
	dt_diaSemana varchar(15),
	dt_horarioAbertura Time,
	dt_horarioFechamento Time,
	id_restaurante Bigint references Tbl_Restaurante);

create table Tbl_Restaurante_forma_PagamentoId(
	id_restaurante BigInt not null,
	formaPagamentoOld BigInt not null,
	primary key(id_restaurante, formaPagamentoOld));

create table Tbl_Restaurante_Forma_Pagamento(
	id_restaurante BigInt references Tbl_Restaurante,
	id_formaPagamento BigInt not null,
	primary key(id_restaurante, id_formaPagamento));

insert into TBL_USUARIO (TX_NOME, TX_SENHA, NR_TENTATIVAS_ACESSO, DT_DATA_BLOQUEIO, DT_DATA_INATIVACAO, TX_STATUS) values ('admin', '123456', 0, '2025-01-01', '2025-01-01', 'ATIVO');
insert into TBL_USUARIO (TX_NOME, TX_SENHA, NR_TENTATIVAS_ACESSO, DT_DATA_BLOQUEIO, DT_DATA_INATIVACAO, TX_STATUS) values ('rafael', 'senha123', 0, '2025-01-02', '2025-01-02', 'ATIVO');

insert into Tbl_Restaurante (id_restaurante, tx_cnpj, tx_nome, tx_descrição, tx_cep, tx_endereco, nr_taxaDeEntrega, nr_tempoDeEntregaMinimo, nr_tempoDeEntregaMaximo, bool_aprovado, tx_TipoCozinhaEnum, ID_USUARIO) values (1, '12345678000199', 'Restaurante Mineiro', 'Comida típica mineira', '30110002', 'Rua Central, 100', 8.50, 20, 50, 1, 'MINEIRA', 1);
insert into Tbl_Restaurante (id_restaurante, tx_cnpj, tx_nome, tx_descrição, tx_cep, tx_endereco, nr_taxaDeEntrega, nr_tempoDeEntregaMinimo, nr_tempoDeEntregaMaximo, bool_aprovado, tx_TipoCozinhaEnum, ID_USUARIO) values (2, '98765432000111', 'Sushi Master', 'Culinária Japonesa premium', '04020010', 'Av. Paulista, 2000', 12.00, 30, 60, 1, 'JAPONESA', 2);

insert into Tbl_Horario_Funcionamento (id_horarioFuncionamento, dt_diaSemana, dt_horarioAbertura, dt_horarioFechamento, id_restaurante) values (1, 'SEGUNDA', '10:00', '22:00', 1);
insert into Tbl_Horario_Funcionamento (id_horarioFuncionamento, dt_diaSemana, dt_horarioAbertura, dt_horarioFechamento, id_restaurante) values (2, 'TERÇA', '11:00', '23:00', 2);

insert into Tbl_Restaurante_forma_PagamentoId (id_restaurante, formaPagamentoOld) values (1, 1);
insert into Tbl_Restaurante_forma_PagamentoId (id_restaurante, formaPagamentoOld) values (2, 2);

insert into Tbl_Restaurante_Forma_Pagamento (id_restaurante, id_formaPagamento) values (1, 1);
insert into Tbl_Restaurante_Forma_Pagamento (id_restaurante, id_formaPagamento) values (2, 2);
