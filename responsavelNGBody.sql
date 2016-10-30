create or replace package body responsavelNG as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  poResult   OUT    responsavel.id%TYPE
) as
  --
  procedureName varchar2(30) := 'login';
  --
  Begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    responsavelDD.confirmaLogin(pinEmail, pinSenha, poResult);
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
--
end responsavelNG;
