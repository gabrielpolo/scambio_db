create or replace package body ResponsavelDD as
--
  --
  -- FUNCTION QUE CONFIRMA DADOS DO LOGIN
  --
  procedure confirmaLogin (
    pinEmail IN responsavel.email%TYPE,
    pinSenha IN responsavel.senha%TYPE,
    poResult OUT responsavel.id%TYPE
  ) as
  --
  procedureName varchar2(30) := 'confirmaLogin';
  --
  Begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    select r.id
    into   poResult
    from   responsavel r
    where  r.email  = pinEmail and
           r.senha  = pinSenha and
           r.status = 'A';
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
  --
  -- PROCEDURE DE INSERT
  --
  function insertResp (
         pNome      IN        responsavel.nome%TYPE,
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE,
         pCelular   IN        responsavel.celular%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  ) return number
  as
    procedureName varchar2(30) := 'insertResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    insert into responsavel
    values (seq_resp.nextval, pNome, pCpf, pEmail, pCelular, pSenha, 'A');
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
    return 1;
    --
  exception
    when DUP_VAL_ON_INDEX then
      return 2;
    --
  end;
  --
  -- PROCEDURE DE DELETAR RESPONSAVEL
  --
  procedure deleteResp (
    pinCpf  IN  responsavel.cpf%TYPE
  ) as
    procedureName varchar2(30) := 'deleteResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.status = 'D'
    where  r.cpf = pinCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE REATIVAR RESPONSAVEL
  --
  procedure reActiveResp (
    pinCpf  IN  responsavel.cpf%TYPE
  ) as
    procedureName varchar2(30) := 'reActivarResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.status = 'A'
    where  r.cpf = pinCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE UPDATE DO CPF
  --
  procedure updateCpfResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pCpf       IN        responsavel.cpf%TYPE
  ) as
    procedureName varchar2(30) := 'updateCpfResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.cpf = pCpf
    where  r.cpf = pCpfAntigo;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE UPDATE DO NOME
  --
  procedure updateNomeResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pNome      IN        responsavel.nome%TYPE
  ) as
    procedureName varchar2(30) := 'updateNomeResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.nome = pNome
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE UPDATE DO EMAIL
  --
  procedure updateEmailResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE
  ) as
    procedureName varchar2(30) := 'updateEmailResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.email = pEmail
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE UPDATE DO CELULAR
  --
  procedure updateCelularResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pCelular   IN        responsavel.celular%TYPE
  ) as
    procedureName varchar2(30) := 'updateCelularlResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.celular = pCelular
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
  --
  -- PROCEDURE DE UPDATE DE SENHA.
  --
  procedure updateSenhalResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  ) as
    procedureName varchar2(30) := 'updateSenhalResp';
  begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.senha = pSenha
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
--
end ResponsavelDD;
