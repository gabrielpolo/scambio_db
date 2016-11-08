create or replace package body responsavelNG as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  poResultId   OUT  responsavel.id%TYPE,
  poResultNome OUT  responsavel.nome%TYPE
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
    responsavelDD.confirmaLogin(pinEmail, pinSenha, poResultId, poResultNome );
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;

  procedure cadastrar (
    pNome      IN        responsavel.nome%TYPE,
    pCpf       IN        responsavel.cpf%TYPE,
    pEmail     IN        responsavel.email%TYPE,
    pCelular   IN        responsavel.celular%TYPE,
    pSenha     IN        responsavel.senha%TYPE,
    poSucesso  OUT       number
  ) as
  --
  procedureName varchar2(30) := 'cadastrar';
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  if pNome    is not null and
     pCpf     is not null and
     pEmail   is not null and
     pCelular is not null and
     pSenha   is not null       then
    --
    poSucesso := responsavelDD.insertResp(pNome, pCpf, pEmail, pCelular, pSenha);
    --
  else
   --
   poSucesso := 0;
   --
  end if;
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'O');
  --
  end;
--
end responsavelNG;
