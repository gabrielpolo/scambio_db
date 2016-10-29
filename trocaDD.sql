create or replace package trocaDD as
-- PACKAGE PARA TRATAMENTO DOS DADOS NA TABELA TROCA.
--
--
-- PROCEDURE DE INSERT NA TABELA TROCA.
  procedure insertTroca (
    pIdTrocadorA    IN  troca.id_trocadorA%TYPE,
    pIdTrocadorB    IN  troca.id_trocadorB%TYPE,
    pData           IN  troca.data_concretizada%TYPE,
    concretizacaoA  IN  troca.concretizacaoTrocadorA%TYPE,
    concretizacaoB  IN  troca.concretizacaoTrocadorB%TYPE
  );
  --
  --PROCEDURE DE UPDATE DATA
  --
  procedure updateData (
    pIdTroca  IN  troca.id%TYPE,
    pNovaData     IN  troca.data_concretizada%TYPE
  );
  --
  --PROCEDURE DE UPDATE CONCRETIZACAO
  --
  procedure alterConcretizacao (
    -- Genérica, voce envia A ou B no IdConcretizador e o valor de como deve
    --   ficar.
    pIdTroca          IN  troca.id%TYPE,
    pIdConcretizador  IN  varchar2,
    pIndConcretizacao IN  troca.concretizacaoTrocadorA%TYPE
  );
--
end trocaDD;
