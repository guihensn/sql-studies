--Quantidade de produtos cadastrados por categoria
SELECT cat.id_categoria, COUNT(*)
	FROM categoria as cat 
		 NATURAL JOIN produto as prod 
			GROUP BY cat.id_categoria
		
--Todos os clientes os clientes que fizeram mais de dez pedidos no mês atual
SELECT cli.id_cliente, COUNT(*) as soma_pedidos
	FROM cliente as cli 
		NATURAL JOIN pedido as ped
			WHERE EXTRACT(MONTH FROM ped.data_cadastro) = EXTRACT(MONTH FROM CURRENT_DATE) 
				  AND EXTRACT(YEAR FROM ped.data_cadastro) = EXTRACT(YEAR FROM CURRENT_DATE) 
				GROUP BY (cli.id_cliente) HAVING COUNT(*) > 10

	
--Todos os clientes que fizeram menos de dez pedidos, inclusive aqueles que não fizeram nenhum pedido.
SELECT cli.id_cliente, COUNT(*) as soma_pedidos
	FROM cliente as cli 
		NATURAL LEFT OUTER JOIN pedido as ped
				GROUP BY (cli.id_cliente) HAVING COUNT(*) < 10


--Listagem dos três produtos mais vendidos do mês atual por estado
SELECT id_estado, COUNT(*) as quantidade
	FROM cliente as cli 
		 NATURAL JOIN pedido as ped
		 NATURAL JOIN item_pedido as itpd
		 NATURAL JOIN produto as prod
			WHERE EXTRACT(MONTH FROM ped.data_cadastro) = EXTRACT(MONTH FROM CURRENT_DATE)
				AND EXTRACT(YEAR FROM ped.data_cadastro) = EXTRACT(YEAR FROM CURRENT_DATE) 
				GROUP BY cli.id_estado
					ORDER BY COUNT(*) DESC LIMIT 3

--Consulta de qual o produto mais vendido
SELECT prod.id_produto
	FROM  item_pedido as itpd
		  NATURAL JOIN produto as prod
			GROUP BY prod.id_produto
				ORDER BY COUNT(*) DESC LIMIT 1

--Consulta de qual o produto menos vendido
SELECT prod.id_produto
	FROM  item_pedido as itpd
		  NATURAL JOIN produto as prod
			GROUP BY prod.id_produto
				ORDER BY COUNT(*) ASC LIMIT 1
