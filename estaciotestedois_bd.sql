create database estaciotestdois_bd;

use estaciotestdois_bd;
show tables;
create table empregado (
	id int primary key auto_increment,
    nome varchar(255) not null,
    data_nascimento date
);

create table funcao (
	id int primary key auto_increment,
    nome varchar(255) not null,
    descricao text,
    empregado_id int,
    foreign key (empregado_id) references empregado(id)
);

create table loja (
	id int primary key auto_increment,
    nome varchar(255) not null,
    endereco_rua varchar(255),
    endereco_bairro varchar(255),
    endereco_cidade varchar(255),
    empregado_id int,
    foreign key (empregado_id) references empregado(id)
);

create table departamento (
	id int primary key auto_increment,
    nome varchar(255) not null,
    descricao text,
    empregado_id int,
    foreign key (empregado_id) references empregado(id)
);

create table pedido (
	id int primary key auto_increment,
    empregado_id int,
    data_pedido date,
    status_pedido varchar(50),
    valor decimal(10,2),
    foreign key (empregado_id) references empregado(id)
);

create table produto (
	id int primary key auto_increment,
    nome varchar(255) not null,
    valor decimal (10, 2),
    pedido_id int,
    empregado_id int,
    foreign key (pedido_id) references pedido(id),
    foreign key (empregado_id) references empregado(id)
);

create table categoria_produto (
	id int primary key auto_increment,
    nome varchar(255) not null
);

create table produto_categoria (
	produto_id int,
    categoria_id int,
    primary key (produto_id, categoria_id),
    foreign key (produto_id) references produto(id),
    foreign key (categoria_id) references categoria_produto(id)
);

create table fornecedor_produto (
	cnpj varchar(14) primary key not null,
    nome varchar(255) not null
);

select * from empregado;
select * from funcao;
select * from loja;
select * from produto_categoria;
select * from departamento;
select * from produto;
select * from pedido;
select * from categoria_produto;
select * from fornecedor_produto;
select valor from produto where valor > 50;
select status_pedido from pedido where status_pedido = 'enviado';
select descricao from funcao where descricao = 'coleta de pedido';
select endereco_cidade from loja where endereco_cidade = 'recife';


insert into empregado (nome, data_nascimento)
values ('Paloma', '1994-06-09');

insert into funcao (nome, descricao, empregado_id)
values ('Encarregado de pedido', 'coleta de pedido', 1);

insert into loja (nome, endereco_rua, endereco_bairro, endereco_cidade, empregado_id)
values ('tshirtsltda', 'r conde do iraja', 'torre', 'recife', 1);

insert into departamento (nome, descricao, empregado_id)
values ('roupa', 'loja de blusas e moletons', 1);

insert into pedido (empregado_id, data_pedido, status_pedido, valor)
values (1, '1994-06-09', 'enviado', 50.00);

insert into produto (nome, valor, pedido_id, empregado_id)
values ('blusa caveira azul', 50.00, 1, 1);

insert into produto (nome, valor, pedido_id, empregado_id)
values ('blusa vermelha', 60.00, 1, 1);

insert into produto (nome, valor, pedido_id, empregado_id)
values ('blusa jeans', 80.00, 1, 1);

insert into produto (nome, valor, pedido_id, empregado_id)
values ('blusa moletom', 90.00, 1, 1);

insert into categoria_produto (nome)
values ('blusa colorida');

insert into fornecedor_produto (cnpj, nome)
values ('12345673450001', 'sotshirts');