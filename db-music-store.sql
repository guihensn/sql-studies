CREATE TABLE autor( 
	 idAutor INT PRIMARY KEY NOT NULL,   
	 Nome_Autor  VARCHAR(60) NOT NULL
);

CREATE TABLE gravadora( 
	 idGravadora INT PRIMARY KEY NOT NULL,     
	 NomeGravadora  VARCHAR(50) NOT NULL,
	 Endereco VARCHAR(50),
	 Telefone VARCHAR(20),
	 Contato VARCHAR(20),
	 URL VARCHAR(80)				
);

CREATE TABLE gravadora_bkp( 
	 idGravadora INT PRIMARY KEY NOT NULL,     
	 NomeGravadora VARCHAR(50) NOT NULL,
	 Endereco VARCHAR(50),
	 Telefone VARCHAR(20),
	 Contato VARCHAR(20),
	 URL VARCHAR(80)				
);

CREATE TABLE musica(
     idMusica Int PRIMARY KEY NOT NULL,
	 NomeMusica VARCHAR(60) NOT NULL,
	 Duracao TIME
);

CREATE TABLE musica_autor(
     idAutor int REFERENCES autor(idAutor ) NOT NULL,
	 idMusica int REFERENCES musica(idMusica) NOT NULL
);

CREATE TABLE cd(
	idCD INT PRIMARY KEY NOT NULL,
	Cd_Indicado INT,
	idGravadora INT REFERENCES gravadora(idGravadora) NOT NULL,
	Nome_CD VARCHAR(60) NOT NULL,
	Preco_Venda  DECIMAL(14,2),
	Dt_Lancamento DATE
);

CREATE TABLE faixa(
	Numero_Faixa INT PRIMARY KEY NOT NULL,
	idMusica INT REFERENCES musica(idMusica) NOT NULL,
	idCD INT REFERENCES cd(idCD) NOT NULL
);

CREATE TABLE cd_categoria(
    idCategoria INT PRIMARY KEY NOT NULL,
	Menor_Preco DECIMAL(14,2),
	Maior_Preco DECIMAL(14,2)
);
   
CREATE TABLE musica_auditoria(
	idMusica INT PRIMARY KEY NOT NULL,
	lastNomeMusica VARCHAR(60),
	lastDuracao TIME,
	dataevento DATE,
	acao VARCHAR(50)
);


