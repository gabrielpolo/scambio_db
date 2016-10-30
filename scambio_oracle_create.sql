-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-10-22 19:57:15.253

-- tables
-- Table: CATEGORIA
CREATE TABLE CATEGORIA (
    id integer  NOT NULL,
    descricao varchar2(45)  NOT NULL,
    CONSTRAINT CATEGORIA_pk PRIMARY KEY (id)
) ;

-- Table: ENDERECO
CREATE TABLE ENDERECO (
    id integer  NOT NULL,
    logradouro varchar2(60)  NOT NULL,
    numero integer  NOT NULL,
    cep varchar2(11)  NOT NULL,
    complemento varchar2(30)  NULL,
    tipo varchar2(20)  NOT NULL,
    ativo char(1)  NOT NULL,
    cidade varchar2(45)  NOT NULL,
    estado char(2)  NOT NULL,
    id_responsavel integer  NOT NULL,
    CONSTRAINT ENDERECO_pk PRIMARY KEY (id)
) ;

-- Table: IMAGEM
CREATE TABLE IMAGEM (
    id integer  NOT NULL,
    imagem_arquivo blob  NOT NULL,
    id_item integer  NOT NULL,
    CONSTRAINT IMAGEM_pk PRIMARY KEY (id)
) ;

-- Table: ITEM
CREATE TABLE ITEM (
    id integer  NOT NULL,
    descricao varchar2(150)  NOT NULL,
    usado char(1)  NOT NULL,
    ativo char(1)  NOT NULL,
    id_marca integer  NOT NULL,
    id_tamanho integer  NOT NULL,
    id_subcategoria integer  NOT NULL,
    id_responsavel integer  NOT NULL,
    CONSTRAINT ITEM_pk PRIMARY KEY (id)
) ;

-- Table: LOG
CREATE TABLE LOG (
    id integer  NOT NULL,
    nome_procedure varchar2(45)  NOT NULL,
    horario timestamp  NOT NULL,
    descricao varchar2(100)  NOT NULL,
    tipo_operacao varchar2(100)  NOT NULL,
    CONSTRAINT LOG_pk PRIMARY KEY (id)
) ;

-- Table: MARCA
CREATE TABLE MARCA (
    id integer  NOT NULL,
    descricao varchar2(45)  NOT NULL,
    CONSTRAINT MARCA_pk PRIMARY KEY (id)
) ;

-- Table: PERGUNTA
CREATE TABLE PERGUNTA (
    id integer  NOT NULL,
    pergunta varchar2(150)  NOT NULL,
    id_resposta integer  NOT NULL,
    id_criador integer  NOT NULL,
    id_questionado integer  NOT NULL,
    CONSTRAINT PERGUNTA_pk PRIMARY KEY (id)
) ;

-- Table: REL_TROCA_ITEM
CREATE TABLE REL_TROCA_ITEM (
    id integer  NOT NULL,
    id_item integer  NOT NULL,
    id_troca integer  NOT NULL,
    CONSTRAINT REL_TROCA_ITEM_pk PRIMARY KEY (id)
) ;

-- Table: RESPONSAVEL
CREATE TABLE RESPONSAVEL (
    id integer  NOT NULL,
    nome varchar2(45)  NOT NULL,
    cpf varchar2(11)  NOT NULL,
    email varchar2(45)  NOT NULL,
    celular varchar2(11)  NULL,
    senha varchar2(100)  NOT NULL,
    status char(1)  DEFAULT 1 NOT NULL,
    CONSTRAINT RESPONSAVEL_pk PRIMARY KEY (id),
    CONSTRAINT RESPONSAVEL_unique UNIQUE (cpf, email)
) ;

-- Table: RESPOSTA
CREATE TABLE RESPOSTA (
    id integer  NOT NULL,
    resposta varchar2(150)  NOT NULL,
    CONSTRAINT RESPOSTA_pk PRIMARY KEY (id)
) ;

-- Table: SUBCATEGORIA
CREATE TABLE SUBCATEGORIA (
    id integer  NOT NULL,
    descricao varchar2(45)  NOT NULL,
    id_categoria integer  NOT NULL,
    CONSTRAINT SUBCATEGORIA_pk PRIMARY KEY (id)
) ;

-- Table: TAMANHO
CREATE TABLE TAMANHO (
    id integer  NOT NULL,
    descricao varchar2(45)  NOT NULL,
    CONSTRAINT TAMANHO_pk PRIMARY KEY (id)
) ;

-- Table: TROCA
CREATE TABLE TROCA (
    id integer  NOT NULL,
    id_trocadorA integer  NOT NULL,
    id_trocadorB integer  NOT NULL,
    data_concretizada timestamp  NULL,
    concretizacaoTrocadorA char(1)  NULL,
    concretizacaoTrocadorB char(1)  NULL,
    CONSTRAINT TROCA_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: ENDERECO_RESPONSAVEL (table: ENDERECO)
ALTER TABLE ENDERECO ADD CONSTRAINT ENDERECO_RESPONSAVEL
    FOREIGN KEY (id_responsavel)
    REFERENCES RESPONSAVEL (id);

-- Reference: IMAGEM_ITEM (table: IMAGEM)
ALTER TABLE IMAGEM ADD CONSTRAINT IMAGEM_ITEM
    FOREIGN KEY (id_item)
    REFERENCES ITEM (id);

-- Reference: ITEM_MARCA (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_MARCA
    FOREIGN KEY (id_marca)
    REFERENCES MARCA (id);

-- Reference: ITEM_RESPONSAVEL (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_RESPONSAVEL
    FOREIGN KEY (id_responsavel)
    REFERENCES RESPONSAVEL (id);

-- Reference: ITEM_SUBCATEGORIA (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_SUBCATEGORIA
    FOREIGN KEY (id_subcategoria)
    REFERENCES SUBCATEGORIA (id);

-- Reference: ITEM_TAMANHO (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_TAMANHO
    FOREIGN KEY (id_tamanho)
    REFERENCES TAMANHO (id);

-- Reference: PERGUNTA_RESPOSTA (table: PERGUNTA)
ALTER TABLE PERGUNTA ADD CONSTRAINT PERGUNTA_RESPOSTA
    FOREIGN KEY (id_resposta)
    REFERENCES RESPOSTA (id);

-- Reference: PERGUNTA_RESP_CRIADOR (table: PERGUNTA)
ALTER TABLE PERGUNTA ADD CONSTRAINT PERGUNTA_RESP_CRIADOR
    FOREIGN KEY (id_criador)
    REFERENCES RESPONSAVEL (id);

-- Reference: PERGUNTA_RESP_QUESTIONADO (table: PERGUNTA)
ALTER TABLE PERGUNTA ADD CONSTRAINT PERGUNTA_RESP_QUESTIONADO
    FOREIGN KEY (id_questionado)
    REFERENCES RESPONSAVEL (id);

-- Reference: REL_TROCA_ITEM_ITEM (table: REL_TROCA_ITEM)
ALTER TABLE REL_TROCA_ITEM ADD CONSTRAINT REL_TROCA_ITEM_ITEM
    FOREIGN KEY (id_item)
    REFERENCES ITEM (id);

-- Reference: REL_TROCA_ITEM_TROCA (table: REL_TROCA_ITEM)
ALTER TABLE REL_TROCA_ITEM ADD CONSTRAINT REL_TROCA_ITEM_TROCA
    FOREIGN KEY (id_troca)
    REFERENCES TROCA (id);

-- Reference: SUBCATEGORIA_CATEGORIA (table: SUBCATEGORIA)
ALTER TABLE SUBCATEGORIA ADD CONSTRAINT SUBCATEGORIA_CATEGORIA
    FOREIGN KEY (id_categoria)
    REFERENCES CATEGORIA (id);

-- Reference: TROCA_RESPONSAVEL_A (table: TROCA)
ALTER TABLE TROCA ADD CONSTRAINT TROCA_RESPONSAVEL_A
    FOREIGN KEY (id_trocadorA)
    REFERENCES RESPONSAVEL (id);

-- Reference: TROCA_RESPONSAVEL_B (table: TROCA)
ALTER TABLE TROCA ADD CONSTRAINT TROCA_RESPONSAVEL_B
    FOREIGN KEY (id_trocadorB)
    REFERENCES RESPONSAVEL (id);

-- End of file.
