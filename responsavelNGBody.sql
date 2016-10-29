create or replace package body responsavelNG as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  pioSucesso IN OUT boolean
)
  as
  --
  procedureName varchar2(30) := 'login';
  vboolSucesso  boolean      := false;
  --
  Begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    pioSucesso := responsavelDD.confirmaLogin(pinEmail, pinSenha);
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
--
end responsavelNG;
