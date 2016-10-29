create or replace package body responsavelNG as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  pioSucesso IN OUT boolean
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
    pioSucesso := responsavelDD.confirmaLogin(pinEmail, pinSenha);
    --
    --logProcedures.scambioLog_DBMS(procedureName, 'Email => ' || pinEmail || ' Senha => ' || pinSenha || ' pioSucesso <= ' || pioSucesso, 'N');
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
--
end responsavelNG;
