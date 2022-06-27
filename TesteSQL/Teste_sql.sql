/* Teste SQL */

create database venda;

use venda;

CREATE TABLE lojas(
	loj_prod	Integer (8),	/* Código da Loja */
	desc_loj	Char (40),		/* Descrição da Loja */ 
	primary key (loj_prod)
);

CREATE TABLE produtos(
	Cod_prod Integer(8),		/* Código do Produto */
	loj_prod Integer(8),		/* Código da Loja */
	desc_prod Char(40),			/* Descrição do Produto */
	Dt_inclu_prod date,			/* Data de Inclusão do Produto */
	preco_prod decimal(8,3),	/* Preço do Produto */
	primary key (Cod_prod)
);

CREATE TABLE estoque(
	Cod_prod	Integer (8),		/* Código do Produto */
	loj_prod	Integer (8),		/* Código da Loja */
	qtd_prod	decimal(15,3)		/* Quantidade em Estoque do Produto */
);

/* Chave estrangeira em tabela produtos */
ALTER TABLE `produtos` ADD CONSTRAINT `fk_produto` FOREIGN KEY ( `loj_prod` ) REFERENCES `lojas` ( `loj_prod` ) ;
/* Chave estrangeira em tabela estoque */
ALTER TABLE `estoque` ADD CONSTRAINT `fk_estoque` FOREIGN KEY ( `loj_prod` ) REFERENCES `lojas` ( `loj_prod` ) ;
ALTER TABLE `estoque` ADD CONSTRAINT `fk_estoque_cod` FOREIGN KEY ( `Cod_prod` ) REFERENCES `produtos` ( `Cod_prod` ) ;


/* inserçao tabelas produtos */
/* Levando em consideraçao do jeito que a tabela foi criada o atributo "loj_prod" sera uma chave estrangeira
pegando como referencia a tabela "lojas" logo "loj_prod" nao sera inserido a nao ser que exista em sua chave primaria
um valor correspondente, assim primeiro alimento a tabela "lojas" para depois alimentar a tabela "produtos". */

INSERT INTO lojas (loj_prod, desc_loj) VALUES
(2,"Supermercado Tudo");

INSERT INTO produtos (Cod_prod, loj_prod, desc_prod,Dt_inclu_prod,preco_prod) VALUES
(170, 2, "LEITE CONDESADO MOCOCA" , '2010-12-30' , 45.40);

/* atualizaçao na tabela "produtos" */
update produtos SET preco_prod = 95.40 WHERE cod_prod = 170 and loj_prod = 2;

/* outras inserçoes */
INSERT INTO lojas (loj_prod, desc_loj) VALUES
(1,"Supermercado Goias");

INSERT INTO lojas (loj_prod, desc_loj) VALUES
(3,"Supermercado Frito"),
(4,"Supermercado Azul"),
(5,"Supermercado Triangulo");

INSERT INTO produtos (Cod_prod, loj_prod, desc_prod,Dt_inclu_prod,preco_prod) VALUES
(060, 1, "ARROZ" , '2022-12-20' , 25.50);

INSERT INTO produtos (Cod_prod, loj_prod, desc_prod,Dt_inclu_prod,preco_prod) VALUES
(020, 1, "FEIJAO" , '2012-11-10' , 25.50),
(068, 2, "ARROZ" , '2010-12-14' , 12.50),
(055, 3, "AÇUCAR" , '2021-12-23' , 34.50),
(234, 4, "MACARRAO" , '2016-12-02' , 52.50),
(079, 5, "FARINHA DE TRIGO" , '2015-04-19' , 17.50);


INSERT INTO estoque (Cod_prod, loj_prod, qtd_prod) VALUES
(020, 1, 25.1),
(020, 2, 25.1),
(068, 1, 15.0),
(055, 3, 25.1),
(234, 1, 5);


/* busca informaçoes da lojas 1 e 2 */
select * from produtos
where loj_prod = 1 or loj_prod = 2;

/* busca maior e menor data de inclusao de produtos */
select MIN(dt_inclu_prod) AS "Menor data",
MAX(dt_inclu_prod) AS "Maior data"
from produtos;

/* quantidade total da tabela produtos */
select count(*) FROM produtos;

/* buscar produtos com "L" sendo inicail */
select * FROM produtos
where LOCATE( 'L', desc_prod ) > 0
ORDER BY LOCATE( 'L', desc_prod );

/* soma de todos os produtos por loja */
select  loj_prod,SUM(preco_prod) AS "Soma de preços" FROM produtos 
group by loj_prod 
order by preco_prod ;

/* soma de todos os produtos por loja */
select  loj_prod,SUM(preco_prod) AS soma FROM produtos
group by loj_prod 
HAVING SUM(preco_prod) > 100
order by preco_prod ;

/* busca da loja */
select  L.loj_prod , L.desc_loj, P.Cod_prod, P.desc_prod, P.preco_prod, E.qtd_prod from lojas AS L
inner join  produtos AS P
ON L.loj_prod = 1 and  P.loj_prod = 1
inner join estoque AS E
ON E.loj_prod = L.loj_prod;

/* produtos diferentes "produtos" != "estoque"*/
select distinct(desc_prod) AS "produtos diferentes de {estoque}" FROM produtos AS p
where p.Cod_prod NOT IN (select Cod_prod from estoque);  

/* produtos diferentes "estoque" != "produtos"*/
select distinct(Cod_prod ) AS "produtos diferentes de {produtos}" FROM estoque AS E
where E.Cod_prod NOT IN (select Cod_prod from produtos);

