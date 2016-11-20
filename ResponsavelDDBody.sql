create or replace package body ResponsavelDD as
--
  --
  -- FUNCTION QUE CONFIRMA DADOS DO LOGIN
  --
  procedure confirmaLogin (
    pinEmail IN responsavel.email%TYPE,
    pinSenha IN responsavel.senha%TYPE,
    poResultId   OUT responsavel.id%TYPE,
    poResultNome OUT responsavel.Nome%TYPE
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
    select r.id,
           r.nome
    into   poResultId,
           poResultNome
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
         pId IN        responsavel.id%TYPE,
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
    where  r.id = pId;
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
         pId       IN        responsavel.id%TYPE,
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
    where  r.id = pId;
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
         pId       IN        responsavel.id%TYPE,
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
    where  r.id = pId;
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
         pId       IN        responsavel.id%TYPE,
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
    where  r.id = pId;
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
         pId       IN        responsavel.id%TYPE,
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
    where  r.id = pid;
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
