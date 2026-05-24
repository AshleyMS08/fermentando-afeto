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
  fkCategoria INT,
	CONSTRAINT fkCategoriaReceita FOREIGN KEY (fkCategoria)
	REFERENCES categoria(idCategoria)
  );
  
  CREATE TABLE receitas_favoritas (
	fkUsuario INT,
		CONSTRAINT fkUsuarioReceita FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),
	fkReceita INT,
		CONSTRAINT fkReceitaFavorita FOREIGN KEY (fkReceita)
		REFERENCES receita(idReceita),
	PRIMARY KEY(fkUsuario, fkReceita),
    dtSalvamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  );
   
  CREATE TABLE tipo (
  idTipo INT PRIMARY KEY AUTO_INCREMENT,
  estado VARCHAR(20)
  );
  
  CREATE TABLE ingrediente (
  idIngrediente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  fkTipo INT,
	CONSTRAINT fkTipoIngrediente FOREIGN KEY (fkTipo)
    REFERENCES tipo(idTipo)
  );
  
  CREATE TABLE medida (
  idMedida INT,
  fkReceita INT,
  fkIngrediente INT,
  quantidade DECIMAL(10,2),
  unidade_medida VARCHAR(15),
	CONSTRAINT chkUnidade CHECK(unidade_medida IN('gramas', 'kilogramas', 'mililitros',
    'litros', 'colher de sopa', 'colher de chá', 'xícara', 'unidade')),
	PRIMARY KEY (idMedida, fkReceita, fkIngrediente),
	CONSTRAINT fkReceitaMedida FOREIGN KEY (fkReceita)
	REFERENCES receita(idReceita),
	CONSTRAINT fkIngredienteMedida FOREIGN KEY (fkIngrediente)
	REFERENCES ingrediente(idIngrediente)
  );

CREATE TABLE comentario(
  idComentario INT PRIMARY KEY AUTO_INCREMENT,
  comentario VARCHAR(250),
 dtComentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  fkReceita INT,
	CONSTRAINT fkReceitaComentario FOREIGN KEY (fkReceita)
    REFERENCES receita(idReceita),
  idUsuario INT,
	CONSTRAINT fkUsuarioComentario FOREIGN KEY (idUsuario)
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

INSERT INTO tipo (estado)
VALUES
('Pó/Seco'),
('Líquido'),
('Pastoso/Derretido'),
('In natura');

INSERT INTO categoria(categoria, tecnica)
VALUES
('Doce', 'Fermentação natural'),
('Salgado', 'Fermentação natural'),
('Integral', 'Fermentação natural'),
('Sem glúten', 'Fermentação natural'),
('Doce', 'Fermentação biológica'),
('Salgado', 'Fermentação biológica'),
('Integral', 'Fermentação biológica'),
('Sem glúten', 'Fermentação biológica'),
('Doce', 'Massa enriquecida'),
('Salgado', 'Massa enriquecida'),
('Integral', 'Massa enriquecida'),
('Sem glúten', 'Massa enriquecida');

INSERT INTO ingrediente(nome, fkTipo)
VALUES
('Farinha de trigo', 1),
('Fermento biológico seco', 1),
('Açúcar refinado', 1),
('Sal', 1),
('Água morna', 2),
('Azeite de oliva', 2),
('Leite gordo', 2),
('Manteiga sem sal', 3),
('Ovo', 4),
('Açúcar mascavo', 1),
('Manteiga ponto de pomada', 3),
('Canela em pó', 1),
('Água fria', 2),
('Alecrim fresco e sal grosso', 4),
('Leite morno', 2),
('Natas(creme de leite)', 3);

INSERT INTO receita (nome, modoPreparo, nivelReceita, fkCategoria)
VALUES
('Pizza', 'Numa tigela, misture o fermento e o açúcar. Regue com a água morna e, com uma colher, misture bem para dissolver. Deixe em temperatura ambiente até espumar cerca de 5 minutos.
Enquanto isso, na tigela da batedeira, misture a farinha com o sal e abra um buraco no centro. Separe uma tigela ou outro recipiente grande e unte com 2 colheres de sopa de azeite ela tem que ter espaço suficiente para a massa crescer bastante.
Assim que espumar, despeje a mistura de fermento no centro da tigela com farinha. Adicione um quarto de xícara de chá de azeite e misture, com uma espátula, apenas para incorporar.
Para sovar a massa, encaixe a tigela na batedeira com o gancho. Comece a bater em velocidade baixa por 5 minutos, aumente a velocidade aos poucos para alta e deixe bater por mais 15 minutos até formar uma massa lisa. Ela vai descolar da lateral da tigela e formar uma bola no gancho da batedeira.
Com as pontas dos dedos ou uma espátula, desgrude a massa da tigela da batedeira e transfira para o recipiente untado com azeite. Cubra com filme e deixe descansar por 1 hora, até crescer e dobrar de volume.
Quando faltarem 30 minutos para completar o tempo de crescimento da massa, preaqueça o forno a 250 graus. Se for utilizar uma assadeira de pedra sabão, coloque-a dentro do forno ainda frio para aquecer desde o início. Caso contrário, ela pode rachar com o choque térmico.
Polvilhe uma bancada lisa com farinha de trigo, transfira a massa de pizza para a bancada e, com uma espátula ou faca, divida em 4 porções.
Utilize a seguir ou, se preferir, embale individualmente com filme e armazene na geladeira por 3 dias ou no congelador por até 1 mês.', 'Básico', 6),

('Cinnamon Rolls', 'Ativação: Numa taça, misture o leite, o fermento seco e uma colher de sopa do açúcar total. Deixe repousar por 10 minutos até criar uma leve espuma.
Amassar: Na batedeira (com o gancho de amassar) ou à mão na bancada, junte a farinha, o restante açúcar e o sal. Adicione os ovos batidos, a manteiga derretida e a mistura do leite.
Desenvolvimento do Glúten: Sove a massa continuamente por 12 a 15 minutos. Como usamos muito menos fermento, a estrutura da massa depende de uma sova excelente. Ela deve transformar-se numa bola completamente lisa, elástica e acetinada (deve passar no teste do véu sem rasgar).
O Descanso Lento: Coloque a massa numa taça levemente untada. Vede a boca da taça perfeitamente com película aderente (não use apenas um pano, para a massa não secar durante este longo período).
Crescimento: Deixe a massa descansar num local fresco e resguardado (idealmente entre os 20°C e 22°C) por 2 horas e meia a 3 horas. Ela vai duplicar de volume muito devagar, desenvolvendo os açúcares e criando uma textura incrivelmente macia.
Extensão: Despeje a massa crescida na bancada polvilhada com uma fina camada de farinha. Com o rolo, estenda-a com calma até obter um retângulo uniforme de cerca de 45x35 cm.
Camada de Canela: Espalhe a manteiga em ponto pomada por toda a superfície. Numa taça à parte, misture o açúcar mascavado com a canela em pó e salpique esta mistura sobre a manteiga, pressionando suavemente com as palmas das mãos para fixar o recheio.
Corte Perfeito: Enrole a massa a partir do lado mais comprido para gerar um rolo firme e apertado. Utilizando um pedaço de fio dental (sem sabor) ou linha de costura resistente, faça laços ao redor do rolo para cortar 12 fatias iguais sem esmagar o desenho espiral.
Crescimento Final: Disponha os rolos numa assadeira retangular grande previamente untada com manteiga, mantendo um espaçamento de 1,5 cm entre eles. Tape com um pano leve e deixe crescer por mais 45 a 60 minutos à temperatura ambiente (eles vão expandir e encostar uns nos outros).
Cozedura: Nos últimos 20 minutos de crescimento, pré-aqueça o forno a 180°C. Coloque a assadeira na grade central e coza por 22 a 25 minutos. Estarão prontos assim que o topo apresentar uma cor dourada uniforme. Retire imediatamente para não secar o interior.', 'Intermediário', 9),

('Focaccia', 'Inicial: Numa taça grande, dissolva o fermento na água fria. Adicione a farinha e misture com uma espátula até que não haja farinha seca. Deixe descansar tapado por 15 minutos (Autólise).
Adicionar Sal e Azeite: Junte o sal e os 40 ml de azeite. Integre bem na massa apertando com as mãos. A massa vai parecer desajeitada e muito húmida, é normal.
Com as mãos húmidas, pegue num lado da massa, puxe para cima e dobre sobre o centro. Repita nos 4 lados da massa.
Tape e espere 15 minutos. Faça mais uma série de dobras. A massa começará a ficar mais lisa e elástica.
A Longa Espera (12h a 24h): Regue a massa com um fio de azeite, cubra a taça hermeticamente (ou com película aderente bem vedada) e leve ao frigorífico por 12 a 24 horas. É lá dentro, no frio, que a mágica acontece e o sabor se desenvolve.
Transferência: Retire a massa do frigorífico (notará que ela já tem algumas bolhas). Despeje uma quantidade generosa de azeite no fundo da sua assadeira. Transfira a massa fria diretamente para a assadeira.
O Segundo Descanso (Crucial): Vire a massa no azeite para que fique lubrificada de ambos os lados. Deixe a massa descansar à temperatura ambiente, destapada, por 2 a 4 horas (dependendo da temperatura do dia). Ela precisa perder o frio do frigorífico, relaxar e expandir sozinha até cobrir quase toda a assadeira.
Pré-aqueça o forno a 230°C (o mais quente que conseguir) uns 30 minutos antes de cozer.
Regue o topo da massa com mais um pouco de azeite.
Unte os dedos e afunde-os firmemente na massa até tocar o fundo da forma. Verá bolhas gigantes a rebentar e a formar-se.
Finalização: Distribua o sal grosso, o alecrim ou os seus ingredientes favoritos por cima.
Cozer: Leve ao forno a 230°C por 20 a 25 minutos, até que a base esteja bem dourada e estaladiça e o topo bem tostado.', 'Avançado', 6),

('Pão de Lã(Woll Roll Bread)', 'Na taça da batedeira, coloque todos os ingredientes da massa.
Com o gancho de amassar, trabalhe a massa por 10 minutos. O ponto ideal é uma massa lisa, elástica e que se solte totalmente das paredes da taça.
Tape a taça (pano ou película) e deixe levedar num local ameno por 2 horas ou até doolar de volume.
Coloque a massa na bancada, forme uma bola única e pese-a. Divida em 5 porções iguais e molde pequenas bolas.
Tape as 5 bolas com um pano e deixe descansar por 20-25 minutos (isso facilita a extensão da massa).
Estenda cada bola com um rolo, formando um oval alongado.
Com uma faca ou cortador, faça cortes finos (tiras de 0,5 mm) em apenas metade da massa (no sentido do comprimento).
Enrole a partir do lado do recheio em direção às tiras.
Unte ou forre com papel vegetal uma forma de aro amovível (20 cm). Disponha os 5 rolos em círculo, acompanhando a lateral da forma.
Tape e deixe crescer por mais 1 hora.
Pincele delicadamente com leite ou ovo batido. Leve ao forno pré-aquecido a 180°C por cerca de 40 minutos (até dourar bem).
Deixe arrefecer ligeiramente antes de desenformar para não murchar.', 'Intermediário', 9);

INSERT INTO medida(idMedida, fkReceita, fkIngrediente, quantidade, unidade_medida)
VALUES
(1, 1, 1, 740.00, 'gramas'),
(2, 1, 2, 20.00, 'gramas'),
(3, 1, 3, 2.00, 'colher de chá'),
(4, 1, 4, 2.00, 'colher de chá'),
(5, 1, 5, 2.50, 'xícara'),
(6, 1, 6, 0.25, 'xícara');

INSERT INTO medida(idMedida, fkReceita, fkIngrediente, quantidade, unidade_medida)
VALUES
(7, 2, 1, 500.00, 'gramas'),
(8, 2, 7, 220.00, 'mililitros'),
(9, 2, 8, 75.00, 'gramas'),
(10, 2, 3, 60.00, 'gramas'),
(11, 2, 9, 2.00, 'unidade'),
(12, 2, 2, 3.50, 'gramas'),
(13, 2, 4, 8.00, 'gramas'),
(14, 2, 10, 150.00, 'gramas'),
(15, 2, 11, 80.00, 'gramas'),
(16, 2, 12, 2.50, 'colher de sopa');

INSERT INTO medida(idMedida, fkReceita, fkIngrediente, quantidade, unidade_medida)
VALUES
(17, 3, 1, 500.00, 'gramas'),
(18, 3, 13, 400.00, 'mililitros'),
(19, 3, 2, 3.00, 'gramas'),
(20, 3, 4, 10.00, 'gramas'),
(21, 3, 6, 40.00, 'mililitros'),
(22, 3, 14, 1.00, 'unidade');

INSERT INTO medida(idMedida, fkReceita, fkIngrediente, quantidade, unidade_medida)
VALUES
(23, 4, 1, 300.00, 'gramas'),
(24, 4, 15, 80.00, 'mililitros'),
(25, 4, 16, 100.00, 'mililitros'),
(26, 4, 9, 1.00, 'unidade'),
(27, 4, 3, 30.00, 'gramas'),
(28, 4, 2, 6.00, 'gramas'),
(29, 4, 4, 5.00, 'gramas');