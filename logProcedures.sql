create or replace package logProcedures as -- ESPEC DA PROCEDURE
  -- PROCEDURES RELACIONADAS A TABELA DE LOG DO SISTEMA.
  --
  -- insere logs custom
  --
  create or replace procedure scambioLog_DBMS (
    pinProcedure  in  varchar2(100),
    pinDesc       in  varchar2,
    pinTipo       in  varchar2(1)--I/D/U/N/O(insert/delete/update/negocio/operacional)
  );
  --
  -- insere log padrao de inicio de procedure
  --
  create or replace inicioProcedure_DBMS (
    pinProcedure in varchar2(100),
    pinTipo      in varchar2(1)--I/D/U/N(insert/delete/update/negocio)
  );
  --
  --inser log padrao de fim de procedure
  --
  create or replace fimProcedure_DBMS (
    pinProcedure in varchar2(100),
    pinTipo      in varchar2(1)--I/D/U/N(insert/delete/update/negocio/operacional)
  );
--
-- FIM DA PACKAGE
--
end logProcedures;
