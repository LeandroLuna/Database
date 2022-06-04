--https://pt.surveymonkey.com/r/TWKHQ5F
SELECT * FROM pf0645.veiculos_eletricos_hibridos;

-- Selecione o total geral por mês dos carros do tipo ELETRICO, HIBRIDO e HIBRIDO_PLUGIN dos estados de: MINAS GERAIS, 
-- PARANA, SAO PAULO, DISTRITO FEDERAL e RIO DE JANEIRO. Ordene a consulta por ordem alfabética de estado.

SELECT estado, SUM(eletrico), SUM(hibrido), SUM(hibrido_plugin), mes
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado IN ('MINAS GERAIS', 'PARANA', 'SAO PAULO', 'DISTRITO FEDERAL', 'RIO DE JANEIRO')
GROUP BY ROLLUP(estado, mes)
ORDER BY estado ASC;

-- Selecione o total geral (quantidade total) de carros ELETRICO, HIBRIDO e HIBRIDO_PLUGIN dos municípios dos estados 
-- de SANTA CATARINA, RIO GRANDE DO SUL e PARANA . Apresente o total geral por estado e o total geral de todos os estados 
-- Ordene a consulta em ordem alfabética de estados e cidades.

SELECT estado, cidade, SUM(eletrico), SUM(hibrido), SUM(hibrido_plugin)
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado IN ('SANTA CATARINA', 'RIO GRANDE DO SUL', 'PARANA')
GROUP BY ROLLUP(estado, cidade)
ORDER BY estado, cidade ASC;

--Por meio da utilização da inserção em massa, insira de acordo com as seguintes regras: 
--• na tabela VEICULOS_ELETRICOS_HIBRIDOS_BA todas as informações da tabela pf0645.VEICULOS_ELETRICOS_HIBRIDOS referentes ao estado da BAHIA. 
--• na tabela VEICULOS_ELETRICOS_HIBRIDOS_GO todas as informações da tabela pf0645.VEICULOS_ELETRICOS_HIBRIDOS referentes ao estado da GOAIS. 
--• na tabela VEICULOS_ELETRICOS_HIBRIDOS_RJ todas as informações da tabela pf0645.VEICULOS_ELETRICOS_HIBRIDOS referentes ao estado da RIO DE JANEIRO. 
--• na tabela VEICULOS_ELETRICOS_HIBRIDOS_PE todas as informações da tabela pf0645.VEICULOS_ELETRICOS_HIBRIDOS referentes ao estado da PERNAMBUCO. 
--
--Após a inserção as tabelas devem ter as seguintes quantidades de linhas: 
--• BAHIA - 926 linhas. 
--• GOIAS - 605 linhas. 
--• RIO DE JANEIRO - 455 linhas. 
--• PERNAMBUCO - 409 linhas.

drop table VEICULOS_ELETRICOS_HIBRIDOS_BA; 
drop table VEICULOS_ELETRICOS_HIBRIDOS_GO; 
drop table VEICULOS_ELETRICOS_HIBRIDOS_RJ; 
drop table VEICULOS_ELETRICOS_HIBRIDOS_PE; 

create table VEICULOS_ELETRICOS_HIBRIDOS_BA 
as select * from pf0645.VEICULOS_ELETRICOS_HIBRIDOS 
where 2=1; 

create table VEICULOS_ELETRICOS_HIBRIDOS_GO 
as select * from pf0645.VEICULOS_ELETRICOS_HIBRIDOS
where 2=1; 

create table VEICULOS_ELETRICOS_HIBRIDOS_RJ 
as select * from pf0645.VEICULOS_ELETRICOS_HIBRIDOS 
where 2=1; 

create table VEICULOS_ELETRICOS_HIBRIDOS_PE 
as select * from pf0645.VEICULOS_ELETRICOS_HIBRIDOS 
where 2=1;

INSERT ALL
INTO veiculos_eletricos_hibridos_ba VALUES(estado, cidade, eletrico, hibrido, hibrido_plugin, mes)
SELECT *
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado = 'BAHIA';

INSERT ALL
INTO veiculos_eletricos_hibridos_go VALUES(estado, cidade, eletrico, hibrido, hibrido_plugin, mes)
SELECT *
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado = 'GOIAS';

INSERT ALL
INTO veiculos_eletricos_hibridos_rj VALUES(estado, cidade, eletrico, hibrido, hibrido_plugin, mes)
SELECT *
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado = 'RIO DE JANEIRO';

INSERT ALL
INTO VEICULOS_ELETRICOS_HIBRIDOS_PE VALUES(estado, cidade, eletrico, hibrido, hibrido_plugin, mes)
SELECT *
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado = 'PERNAMBUCO';

-- Crie uma tabela particionada por lista de ESTADOS chamada VEICULOS_ELETRICOS_PART 
-- As colunas dessa tabela devem ser as mesmas colunas da tabela pf0645.VEICULOS_ELETRICOS_HIBRIDOS. 
-- As partições devem seguir as seguintes regras: 
-- • Partição NORTE. Estados: ACRE, AMAPA, AMAZONAS, PARA, RONDONIA, RORAIMA e TOCANTINS 
-- • Partição NORDESTE. Estados: MARANHAO, PIAUI, CEARA, RIO GRANDE DO NORTE, PARAIBA, PERNAMBUCO, ALAGOAS, SERGIPE e BAHIA. 
-- • Partição CENTRO_OESTE. Estados: MATO GROSSO, MATO GROSSO DO SUL, GOIAS e DISTRITO FEDERAL 
-- • Partição SUDESTE Estados: SAO PAULO, RIO DE JANEIRO, MINAS GERAIS e ESPIRITO SANTO. 
-- • Partição SUL: Estados: RIO GRANDE DO SUL, PARANA e SANTA CATARINA 

-- Atenção: Utilize a tablespace TBSPC_ALUNOS para criar as partições
CREATE TABLE VEICULOS_ELETRICOS_PART (
estado VARCHAR(100),
cidade VARCHAR(200),
eletrico NUMBER(38),
hibrido NUMBER(38),
hibrido_plugin NUMBER(38),
mes VARCHAR(20)
)
PARTITION BY LIST (estado)
(PARTITION norte
VALUES ('ACRE','AMAPA','AMAZONAS','PARA','RONDONIA','RORAIMA','TOCANTINS') TABLESPACE TBSPC_ALUNOS,
PARTITION nordeste
VALUES ('MARANHAO','PIAUI','CEARA','RIO GRANDE DO NORTE','PARAIBA','PERNAMBUCO','ALAGOAS','SERGIPE ','BAHIA') TABLESPACE TBSPC_ALUNOS,
PARTITION centro_oeste
VALUES ('MATO GROSSO,','MATO GROSSO DO SUL','GOIAS ','DISTRITO FEDERAL') TABLESPACE TBSPC_ALUNOS, 
PARTITION sudeste
VALUES ('SAO PAULO','RIO DE JANEIRO','MINAS GERAIS','ESPIRITO SANTO') TABLESPACE TBSPC_ALUNOS,
PARTITION sul
VALUES ('RIO GRANDE DO SUL','PARANA','SANTA CATARINA') TABLESPACE TBSPC_ALUNOS);

-- Crie uma visão chamada VEICULOS_ELETRICOS_SP que irá selecionar todas as colunas da tabela VEICULOS_ELETRICOS_HIBRIDOS do estado de SAO PAULO. 
-- Garanta que os dados da coluna estado não sejam alterados quando a visão for utilizada.
CREATE VIEW veiculos_eletricos_sp
AS SELECT estado, cidade, eletrico, hibrido, hibrido_plugin, mes
FROM pf0645.veiculos_eletricos_hibridos
WHERE estado = 'SAO PAULO'
WITH READ ONLY;