-- Last modification date: 2016-10-21 02:03:37.771

-- tables
-- Table: CATEGORIA
CREATE TABLE CATEGORIA (
    id int NOT NULL,
    descricao varchar(45) NOT NULL,
    CONSTRAINT CATEGORIA_pk PRIMARY KEY (id)
);

-- Table: ENDERECO
CREATE TABLE ENDERECO (
    id int NOT NULL,
    logradouro varchar(60) NOT NULL,
    numero int NOT NULL,
    cep varchar(11) NOT NULL,
    complemento varchar(30) NULL,
    tipo varchar(20) NOT NULL,
    ativo boolean NULL,
    cidade varchar(45) NOT NULL,
    estado varchar(2) NOT NULL,
    id_responsavel int NOT NULL,
    CONSTRAINT ENDERECO_pk PRIMARY KEY (id)
);

-- Table: ITEM
CREATE TABLE ITEM (
    id int NOT NULL,
    nome varchar(45) NOT NULL,
    descricao varchar(150) NOT NULL,
    usado boolean NOT NULL,
    ativo boolean NOT NULL,
    id_marca int NOT NULL,
    id_tamanho int NOT NULL,
    id_subcategoria int NOT NULL,
    id_responsavel int NOT NULL,
    CONSTRAINT ITEM_pk PRIMARY KEY (id)
);

-- Table: MARCA
CREATE TABLE MARCA (
    id int NOT NULL,
    descricao varchar(45) NOT NULL,
    CONSTRAINT MARCA_pk PRIMARY KEY (id)
);

-- Table: REL_TROCA_ITEM
CREATE TABLE REL_TROCA_ITEM (
    id int NOT NULL,
    id_item int NOT NULL,
    id_troca int NOT NULL,
    CONSTRAINT REL_TROCA_ITEM_pk PRIMARY KEY (id)
);

-- Table: RESPONSAVEL
CREATE TABLE RESPONSAVEL (
    id int NOT NULL,
    nome varchar(45) NOT NULL,
    cpf varchar(11) NOT NULL,
    email varchar(45) NOT NULL,
    celular varchar(11) NULL,
    senha varchar(100) NOT NULL,
    status boolean NOT NULL,
    CONSTRAINT RESPONSAVEL_pk PRIMARY KEY (id)
);

-- Table: SUBCATEGORIA
CREATE TABLE SUBCATEGORIA (
    id int NOT NULL,
    descricao varchar(45) NOT NULL,
    id_categoria int NOT NULL,
    CONSTRAINT SUBCATEGORIA_pk PRIMARY KEY (id)
);

-- Table: TAMANHO
CREATE TABLE TAMANHO (
    id int NOT NULL,
    descricao varchar(45) NOT NULL,
    CONSTRAINT TAMANHO_pk PRIMARY KEY (id)
);

-- Table: TROCA
CREATE TABLE TROCA (
    id int NOT NULL,
    id_trocadorA int NOT NULL,
    id_trocadorB int NOT NULL,
    data_concretizada timestamp NULL,
    concretizacaoTrocadorA boolean NULL,
    concretizacaoTrocadorB boolean NULL,
    CONSTRAINT TROCA_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: ENDERECO_RESPONSAVEL (table: ENDERECO)
ALTER TABLE ENDERECO ADD CONSTRAINT ENDERECO_RESPONSAVEL FOREIGN KEY ENDERECO_RESPONSAVEL (id_responsavel)
    REFERENCES RESPONSAVEL (id);

-- Reference: ITEM_MARCA (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_MARCA FOREIGN KEY ITEM_MARCA (id_marca)
    REFERENCES MARCA (id);

-- Reference: ITEM_RESPONSAVEL (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_RESPONSAVEL FOREIGN KEY ITEM_RESPONSAVEL (id_responsavel)
    REFERENCES RESPONSAVEL (id);

-- Reference: ITEM_SUBCATEGORIA (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_SUBCATEGORIA FOREIGN KEY ITEM_SUBCATEGORIA (id_subcategoria)
    REFERENCES SUBCATEGORIA (id);

-- Reference: ITEM_TAMANHO (table: ITEM)
ALTER TABLE ITEM ADD CONSTRAINT ITEM_TAMANHO FOREIGN KEY ITEM_TAMANHO (id_tamanho)
    REFERENCES TAMANHO (id);

-- Reference: REL_TROCA_ITEM_ITEM (table: REL_TROCA_ITEM)
ALTER TABLE REL_TROCA_ITEM ADD CONSTRAINT REL_TROCA_ITEM_ITEM FOREIGN KEY REL_TROCA_ITEM_ITEM (id_item)
    REFERENCES ITEM (id);

-- Reference: REL_TROCA_ITEM_TROCA (table: REL_TROCA_ITEM)
ALTER TABLE REL_TROCA_ITEM ADD CONSTRAINT REL_TROCA_ITEM_TROCA FOREIGN KEY REL_TROCA_ITEM_TROCA (id_troca)
    REFERENCES TROCA (id);

-- Reference: SUBCATEGORIA_CATEGORIA (table: SUBCATEGORIA)
ALTER TABLE SUBCATEGORIA ADD CONSTRAINT SUBCATEGORIA_CATEGORIA FOREIGN KEY SUBCATEGORIA_CATEGORIA (id_categoria)
    REFERENCES CATEGORIA (id);

-- Reference: TROCA_RESPONSAVEL_A (table: TROCA)
ALTER TABLE TROCA ADD CONSTRAINT TROCA_RESPONSAVEL_A FOREIGN KEY TROCA_RESPONSAVEL_A (id_trocadorA)
    REFERENCES RESPONSAVEL (id);

-- Reference: TROCA_RESPONSAVEL_B (table: TROCA)
ALTER TABLE TROCA ADD CONSTRAINT TROCA_RESPONSAVEL_B FOREIGN KEY TROCA_RESPONSAVEL_B (id_trocadorB)
    REFERENCES RESPONSAVEL (id);

-- End of file.
