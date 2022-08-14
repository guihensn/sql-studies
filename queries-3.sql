--Obter o nome, endenreço e data de emprestimo do livro "Criptografia e segurança de redes"
SELECT leitor.nome, endereco.*, emprestimo.data_empresatimo
	FROM leitor 
		 INNER JOIN emprestimo ON leitor.id = emprestimo.id_leitor
         INNER JOIN endereco ON leitor.id_endereco = endereco.id
         INNER JOIN livro ON livro.id = emprestimo.id
			WHERE livro.titulo = "Criptografia e Segurança de Redes";
            
--Identificar as cidades que possuem mais leitores
SELECT endereco.cidade, COUNT(*)
	FROM leitor INNER JOIN endereco ON leitor.id_endereco = endereco.id
		GROUP BY endereco.cidade
			ORDER BY COUNT(*) DESC LIMIT  1;
            
--Identificar as cidade que possuem menos leitores
SELECT endereco.cidade, COUNT(*)
	FROM leitor INNER JOIN endereco ON leitor.id_endereco = endereco.id
		GROUP BY endereco.cidade
			ORDER BY COUNT(*) ASC LIMIT  1;

--Identificar a quantidade de emprestimos feitos no mês atual.
SELECT COUNT(*)
	FROM emprestimo
		WHERE MONTH(emprestimo.data_empresatimo) = MONTH(current_date());
        