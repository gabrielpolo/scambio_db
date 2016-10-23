create or replace package ResponsavelDD as
  -- PACKEGE REPSONSAVEL PELOS COMANDO DE ACESSO A TABELA.
  --
  -- PROCEDURE DE INSERT
  --
  create or replace procedure insertResp (
         pNome      IN        responsavel.nome%TYPE,
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE,
         pCelular   IN        responsavel.celular%TYPE,
         pSenha     IN        responsavel.senha%TYPE,
         pStatus    IN        repsonsavel.status%TYPE
  );
  --
  -- PROCEDURE DE DELETE
  --
  create or replace procedure deleteResp (
    pinCpf  IN  responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE REATIVAR CONTA
  --
  create or replace procedure reActiveResp (
    pinCpf IN responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE UPDATE CPF
  --
  create or replace procedure updateCpfResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pCpf       IN        responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE UPDATE NOME
  --
  create or replace procedure updateNomeResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pNome      IN        responsavel.nome%TYPE
  );
  --
  -- PROCEDURE DE UPDATE EMAIL
  --
  create or replace procedure updateEmailResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE
  );
  --
  -- PROCEDURE DE UPDATE CELULAR
  --
  create or replace procedure updateCelularResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pCelular   IN        responsavel.celular%TYPE
  );
  --
  -- PROCEDURE DE UPDATE SENHA
  --
  create or replace procedure updateSenhalResp (
         pCpf IN        responsavel.cpf%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  )
  --
end ResponsavelDD;
