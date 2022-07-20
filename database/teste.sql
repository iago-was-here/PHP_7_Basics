-- Comandos SQL 
create database Teste;
use  Teste;
create table estados(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    sigla varchar(2) not null,
    regiao ENUM('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul') not null,
    populacao decimal(5,2) not null,
    primary key(id),
    unique key(nome),
    unique key(sigla)
    );
    
    insert into estados(nome, sigla, regiao, populacao) values ('Acre', 'AC', 'Norte', 0.83); 
    insert into estados(nome, sigla, regiao, populacao) values ('Alagoas', 'AL', 'Nordeste', 3.38);
    insert into estados(nome, sigla, regiao, populacao) values ('Amapá', 'AP', 'Norte', 0.8);
    insert into estados(nome, sigla, regiao, populacao) values ('Amazonas', 'AM', 'Norte', 4.06);
    
    select * from estados;
    
    INSERT INTO estados
    (nome, sigla, regiao, populacao)
VALUES
    ('Bahia', 'BA', 'Nordeste', 15.34),
    ('Ceará', 'CE', 'Nordeste', 9.02),
    ('Distrito Federal', 'DF', 'Centro-Oeste', 3.04),
    ('Espírito Santo', 'ES', 'Sudeste', 4.02),
    ('Goiás', 'GO', 'Centro-Oeste', 6.78),
    ('Maranhao', 'MA', 'Nordeste', 7.00),
    ('Mato Grosso', 'MT', 'Centro-Oeste', 3.34),
    ('Mato Grosso do Sul', 'MS', 'Centro-Oeste', 2.71),
    ('Minas Gerais', 'MG', 'Sudeste', 21.12),
    ('Pará', 'PA', 'Norte', 8.36),
    ('Paraíba', 'PB', 'Nordeste', 4.03),
    ('Parana', 'PR', 'Sul', 11.22),
    ('Pernambuco', 'PE', 'Nordeste', 9.47),
    ('Piauí', 'PI', 'Nordeste', 3.22),
    ('Rio de Janeiro', 'RJ', 'Sudeste', 16.72),
    ('Rio Grande do Norte', 'RN', 'Nordeste', 3.51),
    ('Rio Grande do Sul', 'RS', 'Sul', 11.32),
    ('Rondônia', 'RO', 'Norte', 1.81),
    ('Roraima', 'RR', 'Norte', 0.52),
    ('Santa Catarina', 'SC', 'Sul', 7.01),
    ('São Paulo', 'SP', 'Sudeste', 45.10),
    ('Sergipe', 'SE', 'Nordeste', 2.29),
    ('Tocantins', 'TO', 'Norte', 1.55);
    
    select * from estados;
    select Sigla, nome as 'Nome do Estado'from estados;
    select Sigla, nome as 'Nome do Estado' from estados where regiao = 'Norte'; -- Faz um filtro no select de acordo uma condição --
    select Nome, Regiao from estados where populacao >= 10 order by populacao desc;
    
    -- Inserir estados com ID
    insert into estados(id, nome, sigla, regiao, populacao) values (1000,'Novo', 'NV', 'Sul', 2.54);
    select * from estados;
    insert into estados(nome, sigla, regiao, populacao) values ('Mais Novo', 'MN', 'Norte', 2.51);
    select * from estados; 
    
    -- Excluindo estados
	delete from estados; -- delete sem where não são recomendados
    delete from estados where sigla = 'MN';
    select * from estados;
    delete from estados where id >= 1000;
    select * from estados;
    
    -- Consultas com agregação
    
    select regiao as 'Região', sum(populacao) as Total from estados group by regiao;
    select sum(populacao) as Total from estados; -- soma as populações de todos os estados
    select avg(populacao) as Total from estados; -- faz a media das poulações por estado  
    
    -- criando tabela cidades com chave estrangeira
    create table if not exists cidades(
		id int unsigned not null auto_increment,
        nome varchar(255),
        estado_id int unsigned not null,
        area decimal(10,2),
        primary key (id),
        foreign key(estado_id) references estados(id)
    ); 
    
-- inserindo cidades
select * from estados; 
insert into cidades(nome, area, estado_id) values('Campinas', 795, 25); 
insert into cidades(nome, area, estado_id) values('Niterói', 133.9, 19); 

-- usando select para devolver o id do estado desejado
insert into cidades(nome, area, estado_id) values('Caruaru', 920.6, (select id from estados where sigla = 'PE')); 
insert into cidades(nome, area, estado_id) values('Juazeiro do Norte', 248.2, (select id from estados where sigla = 'CE')); 
select * from cidades;
 
 -- consultas com join
 select c.nome as Cidade, e.nome as Estado, regiao as Região from estados e, cidades c where e.id = c.estado_id;
 
 select cid.nome as Cidade, est.nome as Estado, regiao as Região from estados est inner join cidades cid on est.id = cid.estado_id;
 
-- Criar tabela prefeitos
create table if not exists prefeitos(
	id int unsigned not null auto_increment,
    nome varchar(255) not null,
    cidade_id int unsigned,
    primary key (id),
    unique key (cidade_id),
    foreign key (cidade_id) references cidades (id)
    );

-- inserção de prefeitos

insert into prefeitos(nome, cidade_id) values('Rodrigo Neves', 3),('Raquel Lyra', 4),('Zenaldo Coutinho', null); 
select * from prefeitos;
insert into prefeitos(nome, cidade_id) values('Rafael Greca', null);  
insert into prefeitos(nome, cidade_id) values('Rodrigo Pinheiro', 3); -- gera erro pois se trata de um relacionamento 1 pra 1, e a chave gerada é unica;

-- Explorando os diferentes tipos de JOIN
 
select * from cidades cid inner join prefeitos pre on cid.id = pre.cidade_id;
select * from cidades cid left join prefeitos pre on cid.id = pre.cidade_id;
select * from cidades cid right join prefeitos pre on cid.id = pre.cidade_id;
-- select * from cidades cid full join prefeitos pre on cid.id = pre.cidade_id; Full não é suportado, porém podemos usar o union.

select * from cidades cid left join prefeitos pre on cid.id = pre.cidade_id
union
select * from cidades cid right join prefeitos pre on cid.id = pre.cidade_id;

-- Relação N pra N  

 create table if not exists empresas(
	id int unsigned not null auto_increment,
    nome varchar(255) not null,
    cnpj varchar(20),
    primary key (id),
    unique key (cnpj)
 );
 
-- relacionando cidades e empresas 

 create table if not exists empresas_unidades(
	empresa_id int unsigned not null,
	cidade_id int unsigned not null,
    sede tinyint(1)not null,
    primary key(empresa_id, cidade_id)
 );
 
 -- inserindo empresas
 
 insert into empresas (nome, cnpj) values ('Bradesco', 251295616),('Vale', 889646666),('Cielo', 64566256652);
 select * from empresas;
 desc empresas; -- descreve os conteudos da tabela
 desc prefeitos;
 
 insert into empresas_unidades(empresa_d, cidade_id, sede) values (1, 1, 1), (1, 2, 1), (2, 1, 1), (2, 2, 1);
 
 -- consultar empresas e cidaes