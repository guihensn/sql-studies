CREATE DATABASE hospital

CREATE TABLE Medicos (
	codM SERIAL PRIMARY KEY,
	celular integer,
	foneRes integer,
	dataAdm integer,
	endereco varchar,
	crm varchar,
	especialidade varchar,
	salaria integer,
    nome varchar
);

CREATE TABLE Pacientes (
	codP SERIAL PRIMARY KEY,
	problema varchar,
	nome varchar[50],
	idade int,
	bairro varchar,
    endereco varchar,
	dataNasc integer,
	rg  integer
);

CREATE TABLE Postos(
    codPosto SERIAL PRIMARY KEY,
    ruaPosto varchar(50),
	numPosto integer,
	bairroPosto varchar,
	cep integer,
	fonePosto integer
);

CREATE TABLE Atendimento(
    atendimento SERIAL PRIMARY KEY,   
	codPosto integer,
	CodM integer,
	dat integer,
	sala integer,
	horaEntrada integer,
	horaSaida integer,
	FOREIGN KEY (codPosto) REFERENCES Postos(codPosto),
	FOREIGN KEY (CodM) REFERENCES Medicos(CodM)
);


CREATE TABLE Funcionarios(
    codFunc SERIAL PRIMARY KEY,
	CodPosto integer,
	nomConsulta varchar(50),
	salario integer,
	bairro varchar,
	cpf integer,
	dataAdm integer,
	FOREIGN KEY (CodPosto) REFERENCES Postos(CodPosto)
);

CREATE TABLE Consulta(
	CodP integer,
	atendimento integer,
    dat integer,
	hora integer,
	FOREIGN KEY (CodP) REFERENCES Pacientes(CodP),  
	FOREIGN KEY (atendimento) REFERENCES Atendimento(atendimento), 
	PRIMARY KEY (CodP,atendimento)
);

INSERT INTO Medicos (especialidade ,  nome ) VALUES ('Clinico Geral','Pedro');
INSERT INTO Medicos (especialidade ,  nome ) VALUES ('Cirurgiao','Maria');

INSERT INTO Funcionarios (salario , cpf) VALUES (3000,444);
INSERT INTO Funcionarios(salario ,  cpf ) VALUES (1,111);

INSERT INTO Pacientes  (rg , problema) VALUES (123,'Gripe');
INSERT INTO Pacientes (rg , problema) VALUES (456,'Dor de cabeça');


SELECT *
    FROM Medicos 
	    where especialidade='Clinico Geral' ; 
		

SELECT * 
    FROM Funcionarios
	    where (salario>= 2000 AND salario <=5000 ); 

SELECT nome, idade
    FROM Pacientes
	    where (problema = 'Dor de cabeça'OR problema = 'Febre'); 
