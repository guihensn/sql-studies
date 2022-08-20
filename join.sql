--Banco SAKILA

--Quantidade de autores 
SELECT COUNT(*)
   FROM ator;

--Total de pagamentos
SELECT SUM(valor)
   FROM pagamento;
   
--Classificações dos filmes sem repetiçõs
SELECT DISTINCT(classificacao)
   FROM filme;
   
--Quantitativo de filmes por classicação
SELECT classificacao, COUNT(*)
   FROM filme
      GROUP BY classificacao;

--Produto carteziano das tabelas autores e filmes
SELECT *
   FROM  ator CROSS JOIN filme;
   
--Filmes com os respetivos autores utilizado produto carteziano
SELECT *
   FROM  ator CROSS JOIN filme CROSS JOIN filme_ator
       WHERE ator.ator_id = filme_ator.ator_id AND filme.filme_id = filme_ator.filme_id;
	   
--Quantidade de filmes que cada ator participa
SELECT ator.ator_id, count(*)
   FROM  ator CROSS JOIN filme CROSS JOIN filme_ator
       WHERE ator.ator_id = filme_ator.ator_id AND filme.filme_id = filme_ator.filme_id
	      GROUP BY ator.ator_id;
		  
   
--Nome dos clientes que mais alugaram filmes 
SELECT primeiro_nome || ' ' || ultimo_nome , COUNT(*)
   FROM cliente INNER JOIN aluguel ON cliente.cliente_id = aluguel.cliente_id
      GROUP BY cliente.cliente_id 
	       ORDER BY COUNT(*) DESC LIMIT 10;
   
--Quantidade de atores que participaram em cada um dos filmes em ordem crescente de participantes
SELECT filme.titulo , COUNT(*)
   FROM  ator CROSS JOIN filme CROSS JOIN filme_ator
       WHERE ator.ator_id = filme_ator.ator_id AND filme.filme_id = filme_ator.filme_id
	       GROUP BY filme.filme_id
		       ORDER BY COUNT(*) ;
		       