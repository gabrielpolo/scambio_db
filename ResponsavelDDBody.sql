create or replace package body ResponsavelDD as
--
  -- PROCEDURE DE INSERT
  --
  procedure insertResp (
         pNome      IN        responsavel.nome%TYPE,
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE,
         pCelular   IN        responsavel.celular%TYPE,
         pSenha     IN        responsavel.senha%TYPE,
         pStatus    IN        repsonsavel.status%TYPE
  ) as
    procedureName varchar2 := 'insertResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    insert into responsavel
    values (seq_resp.nextval, pNome, pCpf, pEmail, pCelular, pSenha, true);
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE DELETAR RESPONSAVEL
  --
  procedure deleteResp (
    pinCpf  IN  responsavel.cpf%TYPE
  ) as
    procedureName varchar2 := 'deleteResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.status = false
    where  r.cpf = pinCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE REATIVAR RESPONSAVEL
  --
  procedure reActiveResp (
    pinCpf  IN  responsavel.cpf%TYPE
  ) as
    procedureName varchar2 := 'reActivarResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.status = true
    where  r.cpf = pinCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE UPDATE DO CPF
  --
  procedure updateCpfResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pCpf       IN        responsavel.cpf%TYPE
  ) as
    procedureName varchar2 := 'updateCpfResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.cpf = pCpf
    where  r.cpf = pCpfAntigo;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE UPDATE DO NOME
  --
  procedure updateNomeResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pNome      IN        responsavel.nome%TYPE
  ) as
    procedureName varchar2 := 'updateNomeResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.nome = pNome
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE UPDATE DO EMAIL
  --
  procedure updateEmailResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE
  ) as
    procedureName varchar2 := 'updateEmailResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.email = pEmail
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE UPDATE DO CELULAR
  --
  procedure updateCelularlResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pCelular   IN        responsavel.celular%TYPE
  ) as
    procedureName varchar2 := 'updateCelularlResp';
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.celular = pCelular
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
  --
  -- PROCEDURE DE UPDATE DE SENHA.
  --
  procedure updateSenhalResp (
         pCpf       IN        responsavel.cpf%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  ) as
    procedureName varchar2 := 'updateSenhalResp'
  begin
    --
    -- log de entrada
    --
    inicioProcedure_DBMS(procedureName, 'O');
    --
    update responsavel r
    set    r.senha = pSenha
    where  r.cpf = pCpf;
    --
    -- log de saida
    --
    fimProcedure_DBMS(procedureName, 'O');
    --
  exception
    when others then
      --
      null; -- log do erro.
      --
  end;
--
end ResponsavelDD;
