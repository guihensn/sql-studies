CREATE DATABASE Livraria;

DROP TABLE IF EXISTS Emprestimo;
DROP TABLE IF EXISTS Leitor;
DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Editora;
DROP TABLE IF EXISTS Endereco;

CREATE TABLE Endereco(
	id int  PRIMARY KEY, 
	rua varchar(30), 
	cep varchar(8),
	bairro varchar(100),
	cidade varchar(100),
	uf_estado varchar(2), 
	complemento varchar(255)
);

CREATE TABLE Editora(
	id int PRIMARY KEY, 
	nome varchar(100),
	id_endereco  int REFERENCES Endereco(id)
);

CREATE TABLE Autor(
	id int PRIMARY KEY, 
	nome varchar(100),
	id_endereco  int REFERENCES Endereco(id)
);

CREATE TABLE Livro(
	id int PRIMARY KEY,
	titulo VARCHAR(100),
	id_editora int REFERENCES Editora(id),
	id_autor int REFERENCES autor(id),
	categoria VARCHAR(30)
);


CREATE TABLE Leitor(
	id INT PRIMARY KEY,
	nome VARCHAR(100),
	id_endereco INT REFERENCES endereco(id)
);


CREATE TABLE Emprestimo(
	id INT PRIMARY KEY,
	data_empresatimo INT,
	id_leitor INT REFERENCES leitor(id),
	id_livro INT REFERENCES livro(id)
)