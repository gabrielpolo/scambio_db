create or replace package body logProcedures as -- ESPEC DA PROCEDURE
  -- PROCEDURES RELACIONADAS A TABELA DE LOG DO SISTEMA.
  --
  -- insere logs custom
  --
  create or replace procedure scambioLog_DBMS (
    pinProcedure  in  varchar2(100),
    pinDesc       in  varchar2,
    pinTipo       in  varchar2(1)--I/D/U/N/O(insert/delete/update/negocio/operacional)
  ) as
  begin
    --
    insert on scambio_log
    values (log_sequence.NEXTVAL, pinProcedure, pinTipo, sysdate, pinDesc);
    --
  end;
  --
  --
  --insere log padrao de inicio de procedure
  create or replace inicioProcedure_DBMS (
    pinProcedure in varchar2(100),
    pinTipo      in varchar2(1)--I/D/U/N(insert/delete/update/negocio)
  ) as
  begin
    --
    insert on scambio_log
      values (log_sequence.NEXTVAL, pinProcedure, pinTipo, sysdate, '=====Inicio da procedure=====');
    --
  end;
  --
  --
  --inser log padrao de fim de procedure
  create or replace fimProcedure_DBMS (
    pinProcedure in varchar2(100),
    pinTipo      in varchar2(1)--I/D/U/N(insert/delete/update/negocio/operacional)
  ) as
  begin
    --
    insert on scambio_log
      values (log_sequence.NEXTVAL, pinProcedure, pinTipo, sysdate, '=====Fim da procedure=====');
    --
  end;
--
-- FIM DO BODY DA PACKAGE
--
end logProcedures;
