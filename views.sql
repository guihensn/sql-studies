--View que retorne o nome curso com a quantidade de alunos
CREATE OR REPLACE VIEW QtdCAlunos AS
	SELECT nom_curso,  COUNT(mat_alu) 
	FROM alunos natural join cursos 
    GROUP BY  nom_curso;


--View que retorne o nome do curso com aquantidade de professores
CREATE OR REPLACE VIEW QtdProfessores AS
	SELECT nom_curso,  COUNT(cod_prof) 
	FROM professores natural join cursos 
    GROUP BY  nom_curso;

--Para cada turma mostrar o nome das diciplinas e dos professores
CREATE OR REPLACE VIEW Professores_Disciplinas AS
	SELECT nom_disc , nom_prof
	FROM professores natural join turmas natural join disciplinas
	
--Boletim dos alunos da turma '52A'
--Mostrar o nome, cod_disc, semestre, ano, faltas, media e notas
CREATE OR REPLACE VIEW Historico AS
	SELECT nom_alu , cod_disc , semestre , ano , faltas , media , nota_1, nota_2, nota_3, nota_4
	FROM alunos natural join historicos_escolares natural join turmas_matriculadas
	where turma = '52A';

--Quandidade de alunos e a média da disciplina por mês
CREATE OR REPLACE VIEW Media AS 
	SELECT count (mat_alu), media
	FROM disciplinas natural join historicos_escolares  natural join alunos
    GROUP BY  media, ano
    Order by ano;