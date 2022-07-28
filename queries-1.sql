UPDATE empregado
   SET salario = 28000
     WHERE nome = 'Ana Bacana';


SELECT nome
   FROM empregado
     WHERE salario > 30000;

SELECT empregado.nome 
   FROM empregado 
		INNER JOIN trabalhaEm ON (trabalhaEm.codEmp = empregado.codEmp) 
		      INNER JOIN projeto ON (trabalhaEM.codProj = projeto.codProj AND projeto.titulo = 'Emissor de Raios Z' );
	
SELECT empregado.nome
   FROM empregado INNER JOIN departamento ON (departamento.CodDepto = empregado.CodDepto AND departamento.nome = 'Pesquisa' )
	  
SELECT titulo
   FROM projeto
      ORDER BY titulo ASC;
	  
SELECT empregado.nome , trabalhaEm.horas 
   FROM empregado 
		INNER JOIN trabalhaEm ON (trabalhaEm.codEmp = empregado.codEmp) 
		      INNER JOIN projeto ON (trabalhaEM.codProj = projeto.codProj AND projeto.titulo = 'Emissor de Raios Z' )
                  ORDER BY trabalhaEm.horas  DESC;

SELECT dependente.nome , empregado.nome
   FROM empregado 
       INNER JOIN dependente ON (empregado.codSuperv = dependente.codEmp);

ALTER TABLE dependente RENAME nome TO nomedep;
    
ALTER TABLE empregado DROP sexo;
   
ALTER TABLE empregado ADD COLUMN  genero varchar(20) NOT NULL DEFAULT 'VAZIO';

DROP TABLE dependente;

	  
	  