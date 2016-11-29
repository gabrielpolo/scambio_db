create or replace package trocaDD as
-- PACKAGE PARA TRATAMENTO DOS DADOS NA TABELA TROCA.
--
  --
  -- RECUSA TROCA
  function recusaTroca (
    pinIdTroca   IN troca.id%TYPE
  ) return number;
  --
  -- BUSCA PARA VER SE O ITEM E O USUARIO JA N ESTAO EM TROCA CORRENTE.
  function buscaTrocaCorrente (
    pinIdItem   IN item.id%TYPE,
    pinIdResponsavel IN responsavel.id%TYPE
  ) return boolean;
  --
  --
  -- FINALIZA A TROCA
  --
  function completaTroca (
    pinItemB    IN item.id%TYPE,
    pinIdTroca  IN troca.id%TYPE,
    pinRelTroca IN rel_troca_item.id%TYPE
  ) return boolean;
  --
  -- BUSCA ID EVENTO RELAÇÃO DE TROCA.
  --
  function buscaIdRelTrocaItem (
    pinIdTroca  IN troca.id%TYPE
  ) return rel_troca_item.id%TYPE;
  --
  -- FUNCTION QUE BUSCA ID DA TROCA
  --
  function buscaIdTrocaPorCompletar (
    pinIdDono         IN responsavel.id%TYPE,
    pinIdItemOriginal IN item.id%TYPE
  ) return troca.id%TYPE;
  --
  -- FUNCTION DE INSERT NA TABELA TROCA.
  --
  function insertTroca(
    pIdTrocadorA    IN  troca.id_trocadorA%TYPE,
    pIdTrocadorB    IN  troca.id_trocadorB%TYPE,
    pData           IN  troca.data_concretizada%TYPE,
    concretizacaoA  IN  troca.concretizacaoTrocadorA%TYPE,
    concretizacaoB  IN  troca.concretizacaoTrocadorB%TYPE
  ) return troca.id%TYPE;
  --
  -- PROCEDURE DE INSERT NA TABELA DE REL_TROCA_ITEM
  --
  function insertRelacaoTroca (
    pinIdItem  IN item.id%TYPE,
    pinIdTroca IN troca.id%TYPE
  ) return rel_troca_item.id%TYPE;
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
