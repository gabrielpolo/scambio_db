drop sequence log_sequence;
drop sequence seq_resp;
drop sequence seq_troca;
drop sequence seq_endereco;
drop sequence seq_item;
drop sequence seq_img;
-- ARQUIVO RESPONSAVEL PELAS SEQUENCES DOS OBJETOS DE DADOS.
--
-- SEQUENCE DO ID DO LOG.
create sequence log_sequence
  increment by 1
  NOCACHE
  NOCYCLE;
--
--
--SEQUENCE DO ID DO REPSONSAVEL
create sequence seq_resp
  increment by 1
  NOCACHE
  NOCYCLE;
--
--
--SEQUENCE DO ID DA TROCA
create sequence seq_troca
  increment by 1
  NOCACHE
  NOCYCLE;
--
--
--SEQUENCE DO ID DA TROCA
create sequence seq_endereco
  increment by 1
  NOCACHE
  NOCYCLE;
--
--
--SEQUENCE DO ID DO ITEM
create sequence seq_item
  increment by 1
  NOCACHE
  NOCYCLE;
--
--
--SEQUENCE DO ID DA IMAGEM
create sequence seq_img
  increment by 1
  NOCACHE
  NOCYCLE;
