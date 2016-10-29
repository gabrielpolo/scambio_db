create or replace package body trocaDD as
--
  procedure insertTroca(
    pIdTrocadorA    IN  troca.id_trocadorA%TYPE,
    pIdTrocadorB    IN  troca.id_trocadorB%TYPE,
    pData           IN  troca.data_concretizada%TYPE,
    concretizacaoA  IN  troca.concretizacaoTrocadorA%TYPE,
    concretizacaoB  IN  troca.concretizacaoTrocadorB%TYPE
  ) as
    --
    procedureName varchar2(30) := 'insertTroca';
    --
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    insert into troca
    values (seq_troca.nextval, pIdTrocadorA, pIdTrocadorB, pData, concretizacaoA, concretizacaoB);
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
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
