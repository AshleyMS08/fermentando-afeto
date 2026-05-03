CREATE DATABASE fermentando_afeto;
USE fermentando_afeto;

CREATE TABLE usuario(
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) UNIQUE NOT NULL,
	CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
  senha VARCHAR(100) NOT NULL,
  dtCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  );

CREATE TABLE categoria(
  idCategoria INT PRIMARY KEY AUTO_INCREMENT,
  categoria VARCHAR(45),
	CONSTRAINT chkCategoria CHECK (categoria IN('Doce', 'Salgado',
    'Integral', 'Sem glúten')),
  tecnica VARCHAR(45),
	CONSTRAINT chkTecnica CHECK (tecnica IN('Fermentação natural', 'Fermentação biológica',
    'Massa enriquecida'))
  );

CREATE TABLE receita(
  idReceita INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  ingredientes VARCHAR(1000),
  modoPreparo TEXT,
  nivelReceita VARCHAR(20),
	CONSTRAINT chkNivelReceita CHECK (nivelReceita IN('Básico', 'Intermediário', 'Avançado')),
  fkUsuario INT,
	CONSTRAINT fkUsuarioReceita FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
  fkCategoria INT,
	CONSTRAINT fkCategoriaReceita FOREIGN KEY (fkCategoria)
	REFERENCES categoria(idCategoria)
  );

CREATE TABLE comentario(
  idComentario INT PRIMARY KEY AUTO_INCREMENT,
  comentario VARCHAR(250),
  fkReceita INT,
	CONSTRAINT fkReceitaComentario FOREIGN KEY (fkReceita)
    REFERENCES receita(idReceita),
  fkComentarioPai INT,
    CONSTRAINT fkComentarioPai FOREIGN KEY (fkComentarioPai)
    REFERENCES comentario(idComentario)
  );

CREATE TABLE preferencia(
  idPreferencia INT PRIMARY KEY AUTO_INCREMENT,
  nivelExperiencia VARCHAR(15),
	CONSTRAINT chkNivelPreferencia CHECK (nivelExperiencia IN ('iniciante', 
	'intermediário', 'profissional')),
  objetivo VARCHAR(60),
  fkUsuario INT,
	CONSTRAINT fkUsuarioPreferencia FOREIGN KEY (fkUsuario)
    REFERENCES usuario(idUsuario)
  );

