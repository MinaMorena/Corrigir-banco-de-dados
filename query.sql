create table tabela_completa as select arquivo1.c1 as data, arquivo1.c2 as id_marca, arquivo1.c3 as vendas, 
arquivo1.c4 as valor_do_veiculo, arquivo1.c5 as nome, arquivo2.c2 as marca
from arquivo1 join arquivo2 on arquivo1.c2 = arquivo2.c1;

SELECT marca, sum(cast(vendas as INTEGER)) as total_vendas from tabela_completa1 GROUP by marca
ORDER BY total_vendas desc;

select nome, sum(cast(vendas as INTEGER)*cast(valor_do_veiculo as INTEGER)) as receita
from tabela_completa1 group by nome ORDER by receita;

select nome, sum(cast(vendas as INTEGER)*cast(valor_do_veiculo as INTEGER)) as receita
from tabela_completa1 group by nome ORDER by receita desc;

SELECT marca, ROUND(AVG(cast(vendas as INTEGER))) AS media_vendas 
FROM tabela_completa1 GROUP BY marca ORDER BY media_vendas;

SELECT marca, sum(cast(vendas as INTEGER)*cast(valor_do_veiculo as INTEGER)) 
/ SUM(cast(vendas as INTEGER)) AS receita_por_venda FROM tabela_completa1 
GROUP BY marca ORDER BY receita_por_venda DESC;

select data, marca, nome, sum(cast(vendas as INTEGER)) AS VENDAS, 
ROUND(avg(cast(valor_do_veiculo as INTEGER))) AS media_valor_veiculo
from tabela_completa1 group by nome, marca, data order by data;

select marca, nome, sum(cast(vendas as INTEGER)) AS VENDAS, 
ROUND(avg(cast(valor_do_veiculo as INTEGER))) AS media_valor_veiculo
from tabela_completa1 group by nome, marca order by vendas DESC;

select data, marca, nome, sum(cast(vendas as INTEGER)) AS VENDAS, 
ROUND(avg(cast(valor_do_veiculo as INTEGER))) AS media_valor_veiculo
from tabela_completa1 where nome = 'Mobi' or nome = 'Up' or nome = 'Picanto'
group by nome, marca, data order by data;