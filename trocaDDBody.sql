create or replace package body trocaDD as
--
  function buscaTrocaCorrente (
    pinIdItem   IN item.id%TYPE,
    pinIdResponsavel IN responsavel.id%TYPE
  ) return boolean as
    --
    procedureName varchar2(30) := 'buscaTrocaCorrente';
    --
    vresp char(1);
    --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    select 'S'
    into   vresp
    from   troca t,
           rel_troca_item rel
    where  rel.id_item_a    = pinIdItem and
           t.id             = rel.id_troca and
           t.id_trocadorB   = pinIdResponsavel;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    if vresp = 'S' then
      --
      return true;
      --
    end if;
    --
    return false;
    --
  exception
    when others then
      return false;
  end;
--
  function completaTroca (
    pinItemB    IN item.id%TYPE,
    pinIdTroca  IN troca.id%TYPE,
    pinRelTroca IN rel_troca_item.id%TYPE
  ) return boolean as
    --
    procedureName varchar2(30) := 'completaTroca';
    --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    -- Atualizamos a data da troca.
    updateData(pinIdTroca, sysdate);
    -- Atualizamos o status da aprovação.
    alterConcretizacao(pinIdTroca, 'A', 'S');
    --
    update  rel_troca_item rel
      set   rel.id_item_b = pinItemB
      where rel.id_troca = pinIdTroca;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    return true;
  exception
    when others then
      return false;
  end;
--
  function buscaIdRelTrocaItem (
    pinIdTroca  IN troca.id%TYPE
  ) return rel_troca_item.id%TYPE as
    --
    procedureName varchar2(30) := 'buscaIdRelTrocaItem';
    --
    vnIdRelTrocaItem rel_troca_item.id%TYPE;
    --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    select rel.id
    into   vnIdRelTrocaItem
    from   rel_troca_item rel
    where  rel.id = pinIdTroca;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    return vnIdRelTrocaItem;
    --
  exception
    when others then
      return null;
  end;
--
  function buscaIdTrocaPorCompletar (
    pinIdDono         IN responsavel.id%TYPE,
    pinIdItemOriginal IN item.id%TYPE
  ) return troca.id%TYPE as
   --
   procedureName varchar2(30) := 'buscaIdTrocaPorCompletar';
   --
   vnIdTroca     troca.id%TYPE;
   --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    select t.id
    into   vnIdTroca
    from   troca t,
           rel_troca_item rel
    where  t.id_trocadorA           = pinIdDono           and
           t.concretizacaoTrocadorA = 'N'                 and
           rel.id_troca             = t.id                and
           rel.id_item_a            = pinIdItemOriginal;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    return vnIdTroca;
    --
  exception
    when others then
      return null;
  end;
--
  function insertRelacaoTroca (
    pinIdItem  IN item.id%TYPE,
    pinIdTroca IN troca.id%TYPE
  ) return rel_troca_item.id%TYPE as
  --
  procedureName varchar2(30) := 'insertRelacaoTroca';
  --
  vnIdEventoRel number := seq_rel_troca_item.nextval;
  --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    insert into rel_troca_item
      values (vnIdEventoRel, pinIdItem, null, pinIdTroca);
    --
    commit;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    return vnIdEventoRel;
    --
  end;
--
  function insertTroca(
    pIdTrocadorA    IN  troca.id_trocadorA%TYPE,
    pIdTrocadorB    IN  troca.id_trocadorB%TYPE,
    pData           IN  troca.data_concretizada%TYPE,
    concretizacaoA  IN  troca.concretizacaoTrocadorA%TYPE,
    concretizacaoB  IN  troca.concretizacaoTrocadorB%TYPE
  ) return troca.id%TYPE as
    --
    procedureName varchar2(30) := 'insertTroca';
    --
    vnIdTroca troca.id%TYPE;
    --
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    vnIdTroca := seq_troca.nextval;
    --
    insert into troca
    values (vnIdTroca, pIdTrocadorA, pIdTrocadorB, pData, concretizacaoA, concretizacaoB);
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
    return vnIdTroca;
    --
  end;
  --
  --PROCEDURE DE UPDATE DA DATA.
  --
  procedure updateData (
    pIdTroca  IN  troca.id%TYPE,
    pNovaData     IN  troca.data_concretizada%TYPE
  ) as
    --
    procedureName varchar2(30) := 'updateData';
    --
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update troca t
    set    t.data_concretizada = pNovaData
    where  t.id = pIdTroca;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  --PROCEDURE DE UPDATE CONCRETIZACAO
  --
  procedure alterConcretizacao (
    -- Genérica, voce envia A ou B no IdConcretizador e o valor de como deve
    --   ficar.
    pIdTroca          IN  troca.id%TYPE,
    pIdConcretizador  IN  varchar2,
    pIndConcretizacao IN  troca.concretizacaoTrocadorA%TYPE
  ) as
    procedureName varchar2(30) := 'alterConcretizacao';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    if pIdConcretizador = 'A' then
      --
      update troca t
      set    t.concretizacaoTrocadorA = pIndConcretizacao
      where  t.id = pIdTroca;
      --
      logProcedures.scambioLog_DBMS(procedureName, 'Alterado concretizacaoTrocadorA <= '|| pIndConcretizacao, 'U');
      --
    else
      --
      update troca t
      set    t.concretizacaoTrocadorB = pIndConcretizacao
      where  t.id = pIdTroca;
      --
      logProcedures.scambioLog_DBMS(procedureName, 'Alterado concretizacaoTrocadorB <= '|| pIndConcretizacao, 'U');
      --
    end if;
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
--
end trocaDD;
