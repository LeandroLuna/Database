/*
Leandro de Jesus Luna               - RM86492 
Pedro Fernandes                     - RM84244
Fabbio Augusto de Souza Moura Boli  - RM84695
Rafael Procopio Bondezam            - RM84346
*/

/*Estrutura das tabelas*/
desc PF0645.GEO_AREAS;
desc PF0645.SERIES_DESCRIPTIONS;
desc PF0645.ODS_06;

/*1. Crie uma consulta que exiba o objetivo (GOAL), alvo (TARGET), indicador
(INDICATOR), descri��o (DESCRIPTION), nome do pa�s (NAME - apelidado de
GEO_AREA_NAME), ano (TIME_PERIOD) e o valor (VALUES) para o BRAZIL.
Selecione somente as informa��es dos anos (TIME_PERIOD) de 2019 e 2020 onde
os valores (VALUES) n�o s�o nulos e o c�digo da s�rie (SERIES) igual a
SH_H2O_SAFE
Ordene o resultado em ordem decrescente de valor (VALUE)*/

select O.GOAL, O.TARGET, O.INDICATOR, S.DESCRIPTION, G.NAME GEO_AREA_NAME, O.TIME_PERIOD, O.VALUE
from PF0645.ODS_06 O join PF0645.SERIES_DESCRIPTIONS S
on (O.SERIES_CODE = S.CODE)
join PF0645.GEO_AREAS G
on (O.GEO_AREA_CODE = G.CODE)
where G.NAME = 'Brazil' and S.CODE = 'SH_H2O_SAFE' and O.VALUE is not null and O.TIME_PERIOD in (2019, 2020)
order by O.VALUE desc;

/*2.  Crie uma consulta que exiba o nome do pa�s (NAME - apelidado de GEO_AREA_NAME)
e a quantidade de indicadores (INDICATOR) - Apelidado de QTD para os pa�ses que
iniciam com a letra A ou B ou C onde as quantidades (INDICATOR) est�o entre
200 (inclusive) e 300 (inclusive). */

select G.NAME GEO_AREA_NAME, COUNT(O.INDICATOR) QTD
from PF0645.ODS_06 O join PF0645.SERIES_DESCRIPTIONS S
on (O.SERIES_CODE = S.CODE)
join PF0645.GEO_AREAS G
on (O.GEO_AREA_CODE = G.CODE)
group by G.NAME
having (G.NAME LIKE 'A%' or G.NAME LIKE 'B%' or G.NAME LIKE 'C%')
and COUNT(O.INDICATOR) BETWEEN 200 and 300;

/*3. Selecione o nome do pa�s (NAME - apelidado de GEO_AREA_NAME) e a quantidade
de objetivos (GOAL) de cada um deles. Exclua da consulta o pa�s (NAME) com o nome
World. Exiba somente as 10 (DEZ) primeiras linhas.
Ordene o relat�rio por QTD em ordem decrescente.*/

select G.NAME GEO_AREA_NAME, count(O.GOAL) QTD
from PF0645.ODS_06 O join PF0645.GEO_AREAS G
on (O.GEO_AREA_CODE = G.CODE)
group by G.NAME, O.GOAL
having not G.NAME = 'World'
order by count(O.GOAL) desc
fetch first 10 rows only;

/*4.  Selecione o c�digo da �rea (CODE) e o nome do pa�s (NAME) que n�o possuem
indicadores relativos ao ODS 06.*/

select G.CODE, G.NAME
from PF0645.ODS_06 O right join PF0645.GEO_AREAS G
on (O.GEO_AREA_CODE = G.CODE)
where o.geo_area_code is null
group by g.code, g.name;

/*5. Selecione o c�digo da s�rie (SERIES_CODE), o c�digo da �rea (GEO_AREA_CODE)
e o valor (VALUE) dos ODS 06 para as �reas de c�digo igual a 76 e 780 no ano
(TIME_PERIOD) de 2000 para o c�digo de serie (SERIES_CODE) igual a
ER_H2O_WUEYST e SH_SAN_DEFECT
Ordene o relat�rio em ordem ascendente pelo c�digo da �rea (GEO_AREA_CODE).
N�o selecione os valores (VALUE) que s�o nulos.*/

select S.CODE SERIES_CODE, G.CODE GEO_AREA_CODE, O.VALUE 
from PF0645.ODS_06 O join PF0645.SERIES_DESCRIPTIONS S
on (O.SERIES_CODE = S.CODE)
join PF0645.GEO_AREAS G
on (O.GEO_AREA_CODE = G.CODE)
where G.CODE in (76, 780)
and O.TIME_PERIOD = '2000'
and (O.SERIES_CODE = 'ER_H2O_WUEYST' OR O.SERIES_CODE = 'SH_SAN_DEFECT') 
and O.VALUE is not null
order by G.CODE asc;
