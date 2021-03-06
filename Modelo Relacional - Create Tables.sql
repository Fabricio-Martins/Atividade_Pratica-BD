DROP TABLE IF EXISTS CONTEUDO_ADICIONAL;
DROP TABLE IF EXISTS PLATAFORMA_TEM_COPIAS;
DROP TABLE IF EXISTS PLATAFORMA;
DROP TABLE IF EXISTS COPIAS;
DROP TABLE IF EXISTS PROGRAMADORES;
DROP TABLE IF EXISTS ENGENHEIROS_DE_SOM;
DROP TABLE IF EXISTS DESIGNERS;
DROP TABLE IF EXISTS PROGRAMACAO;
DROP TABLE IF EXISTS PRODUCAO_DE_AUDIO;
DROP TABLE IF EXISTS PRODUCAO_DE_ARTE;
DROP TABLE IF EXISTS FORMADO;
DROP TABLE IF EXISTS A_ENGINE;
DROP TABLE IF EXISTS JOGO;
DROP TABLE IF EXISTS FUNCIONARIOS;
DROP TABLE IF EXISTS ESPECIALIZACAO;

CREATE TABLE ESPECIALIZACAO (
	id_treinamento INTEGER PRIMARY KEY,
    area_treinamento VARCHAR(255),
    nome_treinamento VARCHAR(255)
);
    
CREATE TABLE FUNCIONARIOS (
	id_funcionario INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(255)
);

CREATE TABLE JOGO (
	nome VARCHAR(255) PRIMARY KEY,
    categoria VARCHAR(255),
    milestone VARCHAR(255),
    faixa_etaria VARCHAR(255)
);

CREATE TABLE A_ENGINE (
	id_engine INTEGER PRIMARY KEY,
	nome VARCHAR(255),
    versao VARCHAR(255),
    api VARCHAR(255)
);

CREATE TABLE FORMADO (
	id_treinamento INTEGER,
    id_funcionario INTEGER,
    PRIMARY KEY (id_treinamento, id_funcionario),
    FOREIGN KEY (id_treinamento) REFERENCES ESPECIALIZACAO(id_treinamento),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario)
);

CREATE TABLE PRODUCAO_DE_ARTE (
	id_criacao INTEGER PRIMARY KEY,
    nivel VARCHAR(255),
    roteiro_nivel VARCHAR(255),
    assets_graficos VARCHAR(255),
    nome_jogo VARCHAR(255),
    FOREIGN KEY (nome_jogo) REFERENCES JOGO(nome)
);

CREATE TABLE PRODUCAO_DE_AUDIO (
	id_som INTEGER PRIMARY KEY,
    tipo_som VARCHAR(255),
    letra_script VARCHAR(255),
    nome_jogo VARCHAR(255),
    FOREIGN KEY (nome_jogo) REFERENCES JOGO(nome)
);

CREATE TABLE PROGRAMACAO (
	id_codigo INTEGER PRIMARY KEY,
    linguagem VARCHAR(255),
    classe VARCHAR(255),
    nome_jogo VARCHAR(255),
    id_engine INTEGER,
    FOREIGN KEY (nome_jogo) REFERENCES JOGO(nome),
    FOREIGN KEY (id_engine) REFERENCES A_ENGINE(id_engine)
);
    
CREATE TABLE DESIGNERS (
	id_funcionario INTEGER PRIMARY KEY,
    id_criacao INTEGER,
	cargo VARCHAR(255),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario),
    FOREIGN KEY (id_criacao) REFERENCES PRODUCAO_DE_ARTE(id_criacao)
);
    
CREATE TABLE ENGENHEIROS_DE_SOM (
	id_funcionario INTEGER PRIMARY KEY,
    id_som INTEGER,
	cargo VARCHAR(255),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario),
    FOREIGN KEY (id_som) REFERENCES PRODUCAO_DE_AUDIO(id_som)
);
    
CREATE TABLE PROGRAMADORES (
	id_funcionario INTEGER PRIMARY KEY,
    id_codigo INTEGER,
	cargo VARCHAR(255),
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario),
    FOREIGN KEY (id_codigo) REFERENCES PROGRAMACAO(id_codigo)
);

CREATE TABLE COPIAS (
	id_copia INTEGER PRIMARY KEY,
    preco DECIMAL(10,2),
    midia VARCHAR(255),
    nome_jogo VARCHAR(255),
    FOREIGN KEY (nome_jogo) REFERENCES JOGO(nome)
);

CREATE TABLE PLATAFORMA (
	 id_plataforma INTEGER PRIMARY KEY,
	 marca VARCHAR(255),
     fabricante VARCHAR(255),
     versao VARCHAR(255)
);

CREATE TABLE PLATAFORMA_TEM_COPIAS (
	id_plataforma INTEGER,
    id_copia INTEGER,
    FOREIGN KEY (id_plataforma) REFERENCES PLATAFORMA(id_plataforma),
    FOREIGN KEY(id_copia) REFERENCES COPIAS(id_copia)
);

CREATE TABLE CONTEUDO_ADICIONAL (
    nome_dlc VARCHAR(255),
    preco_dlc DECIMAL(10,2),
    tamanho_dlc VARCHAR(255),
    nome_jogo VARCHAR(255),
    PRIMARY KEY (nome_dlc, nome_jogo),
    FOREIGN KEY (nome_jogo) REFERENCES JOGO(nome)
);
