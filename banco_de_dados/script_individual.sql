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
  categoria VARCHAR(15),
	CONSTRAINT chkCategoria CHECK (categoria IN('Doce', 'Salgado',
    'Integral', 'Sem glúten')),
  tecnica VARCHAR(25),
	CONSTRAINT chkTecnica CHECK (tecnica IN('Fermentação natural', 'Fermentação biológica',
    'Massa enriquecida'))
  );

CREATE TABLE receita(
  idReceita INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  modoPreparo TEXT,
  nivelReceita VARCHAR(15),
	CONSTRAINT chkNivelReceita CHECK (nivelReceita IN('Básico', 'Intermediário', 'Avançado')),
  fkUsuario INT,
	CONSTRAINT fkUsuarioReceita FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),
  fkCategoria INT,
	CONSTRAINT fkCategoriaReceita FOREIGN KEY (fkCategoria)
	REFERENCES categoria(idCategoria)
  );
  
  CREATE TABLE ingrediente (
  idIngrediente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  tipo VARCHAR(20),
	CONSTRAINT chkTipo CHECK (tipo IN('Pó/Seco', 'Líquido', 'Pastoso/Derretido', 'In natura'))
  );
  
  CREATE TABLE medida (
  idMedida INT,
  fkReceita INT,
  fkIngrediente INT,
  quantidade DECIMAL(10,2),
  unidade_medida VARCHAR(15),
	CONSTRAINT chkUnidade CHECK(unidade_medida IN('g', 'kg', 'ml',
    'l', 'colher de sopa', 'colher de chá', 'xícara', 'unidade')),
	PRIMARY KEY (idMedida, fkReceita, fkIngrediente),
	CONSTRAINT fkReceitaMedida FOREIGN KEY (fkReceita)
	REFERENCES receita(idReceita),
	CONSTRAINT fkIngredienteMedida FOREIGN KEY (fkIngrediente)
	REFERENCES ingrediente(idIngrediente)
  );

CREATE TABLE comentario(
  idComentario INT PRIMARY KEY AUTO_INCREMENT,
  comentario VARCHAR(250),
  fkReceita INT,
	CONSTRAINT fkReceitaComentario FOREIGN KEY (fkReceita)
    REFERENCES receita(idReceita),
  fkUsuario INT,
	CONSTRAINT fkUsuarioComentario FOREIGN KEY (fkUsuario)
	REFERENCES usuario(idUsuario),  
  fkComentario INT,
    CONSTRAINT fkComentario FOREIGN KEY (fkComentario)
    REFERENCES comentario(idComentario)
  );

CREATE TABLE preferencia(
  idPreferencia INT PRIMARY KEY AUTO_INCREMENT,
  nivelExperiencia VARCHAR(15),
	CONSTRAINT chkNivelPreferencia CHECK (nivelExperiencia IN ('iniciante', 
	'intermediário', 'profissional')),
  objetivo VARCHAR(60),
	CONSTRAINT chkObjetivo CHECK (objetivo IN ('Terapia e Lazer', 
    'Presentear', 'Socializar', 'Consumo Familiar', 'Estilo de Vida')),
  fkUsuario INT,
	CONSTRAINT fkUsuarioPreferencia FOREIGN KEY (fkUsuario)
    REFERENCES usuario(idUsuario)
  );

