-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-10-30 00:42:31.667

-- foreign keys
ALTER TABLE ENDERECO DROP CONSTRAINT ENDERECO_RESPONSAVEL;

ALTER TABLE IMAGEM DROP CONSTRAINT IMAGEM_ITEM;

ALTER TABLE ITEM DROP CONSTRAINT ITEM_MARCA;

ALTER TABLE ITEM DROP CONSTRAINT ITEM_RESPONSAVEL;

ALTER TABLE ITEM DROP CONSTRAINT ITEM_SUBCATEGORIA;

ALTER TABLE ITEM DROP CONSTRAINT ITEM_TAMANHO;

ALTER TABLE PERGUNTA DROP CONSTRAINT PERGUNTA_ITEM;

ALTER TABLE PERGUNTA DROP CONSTRAINT PERGUNTA_RESPOSTA;

ALTER TABLE PERGUNTA DROP CONSTRAINT PERGUNTA_RESP_CRIADOR;

ALTER TABLE REL_TROCA_ITEM DROP CONSTRAINT REL_TROCA_ITEM_ITEM;

ALTER TABLE REL_TROCA_ITEM DROP CONSTRAINT REL_TROCA_ITEM_TROCA;

ALTER TABLE SUBCATEGORIA DROP CONSTRAINT SUBCATEGORIA_CATEGORIA;

ALTER TABLE TROCA DROP CONSTRAINT TROCA_RESPONSAVEL_A;

ALTER TABLE TROCA DROP CONSTRAINT TROCA_RESPONSAVEL_B;

-- tables
DROP TABLE CATEGORIA;

DROP TABLE ENDERECO;

DROP TABLE IMAGEM;

DROP TABLE ITEM;

DROP TABLE LOG;

DROP TABLE MARCA;

DROP TABLE PERGUNTA;

DROP TABLE REL_TROCA_ITEM;

DROP TABLE RESPONSAVEL;

DROP TABLE RESPOSTA;

DROP TABLE SUBCATEGORIA;

DROP TABLE TAMANHO;

DROP TABLE TROCA;

-- End of file.

