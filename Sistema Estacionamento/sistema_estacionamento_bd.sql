CREATE DATABASE banco;

USE banco;

CREATE TABLE tbl_movimentacao(
id INT NOT NULL auto_increment ,
placa VARCHAR(6),
modelo VARCHAR(6),
data_entrada DATETIME,
data_saida DATETIME,
tempo DATETIME,
valor_pago FLOAT,
primary key (id)
);

CREATE TABLE tbl_usuario(
id INT NOT NULL auto_increment, 
nome VARCHAR(25), 
usuario VARCHAR(25), 
senha VARCHAR(32),
primary key (id)
);

CREATE TABLE tbl_valor(
id INT NOT NULL , 
valor_primeira_hora FLOAT, 
valor_demais_horas FLOAT,
data_fim DATETIME
);

/* inserção de dados */

INSERT INTO tbl_valor (id, valor_primeira_hora, valor_demais_horas,data_fim) VALUES
(1,6.00,4.00,null);

INSERT INTO tbl_usuario (nome, usuario,senha) VALUES
("admin","admin",123456);

/* busca de tabelas*/

select * from tbl_usuario;
select * from tbl_valor;
select * from tbl_movimentacao;

