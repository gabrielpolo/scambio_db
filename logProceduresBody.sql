create or replace package body logProcedures as -- ESPEC DA PROCEDURE
  -- PROCEDURES RELACIONADAS A TABELA DE LOG DO SISTEMA.
  --
  -- insere logs custom
  --
  procedure scambioLog_DBMS (
    pinProcedure  in  varchar2,
    pinDesc       in  varchar2,
    pinTipo       in  varchar2--I/D/U/N/O(insert/delete/update/negocio/operacional)
  ) as
  begin
    --
    insert into log
    values (log_sequence.NEXTVAL, pinProcedure, sysdate, pinDesc, pinTipo);
    --
  end;
  --
  --
  --insere log padrao de inicio de procedure
  procedure inicioProcedure_DBMS (
    pinProcedure in varchar2,
    pinTipo      in varchar2--I/D/U/N(insert/delete/update/negocio)
  ) as
  begin
    --
    insert into log
      values (log_sequence.NEXTVAL, pinProcedure, sysdate, '=====Inicio da procedure=====', pinTipo);
    --
  end;
  --
  --
  --inser log padrao de fim de procedure
  procedure fimProcedure_DBMS (
    pinProcedure in varchar2,
    pinTipo      in varchar2--I/D/U/N(insert/delete/update/negocio/operacional)
  ) as
  begin
    --
    insert into log
      values (log_sequence.NEXTVAL, pinProcedure, sysdate, '=====Fim da procedure=====', pinTipo);
    --
  end;
--
-- FIM DO BODY DA PACKAGE
--
end logProcedures;
