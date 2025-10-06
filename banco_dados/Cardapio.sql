--INTEGRANTES: Isadora Neves, LIkas Santos, Isaac Barbosa, Natanael Roberto, Fernanda Souza e Luiza Brito

create database cardapio;
use cardapio;

create table Cardapio(
id_cardapio INT IDENTITY(1,1) PRIMARY KEY,
);
create table ItemCardapio (
id_item_cardapio INT IDENTITY(1,1) PRIMARY KEY,
nome VARCHAR(100) UNIQUE NOT NULL,
descricao VARCHAR(200) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
precoPromocional DECIMAL(8,2) NOT NULL,
tipo VARCHAR(20) NOT NULL, CHECK(tipo in ('ENTRADA', 'PRATO_PRINCIPAL', 'BEBIDA')),
id_cardapio INT CONSTRAINT fk_cardapio FOREIGN KEY (id_cardapio) REFERENCES Cardapio
);

insert into ItemCardapio values
('batata-frita' , '200 gramas de batata frita no �leo com sal', 15.90, 11.80, 'ENTRADA', 001),
('contra fil�', 'contra fil� grelhado com arroz, salada, farofa e fritas', 48.90, 37.50,'PRATO_PRINCIPAL',001),
('macarraao com alm�ndegas', 'spaghetthi com alm�ndeguas no molho de tomate italiano.', 75.00, 60.00, 'PRATO_PRINCIPAL', 001),
('agua', 'agua mineral sem g�s 500ml', 5.80, 4.50, 'BEBIDA', 001),
('coca-cola', ' Refrigerante coca cola sem a�ucar 300ml', 9.50, 5.80, 'BEBIDA', 001);

