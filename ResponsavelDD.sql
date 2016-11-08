create or replace package ResponsavelDD as
  -- PACKEGE REPSONSAVEL PELOS COMANDO DE ACESSO A TABELA.
  --
  procedure confirmaLogin (
         pinEmail IN responsavel.email%TYPE,
         pinSenha IN responsavel.senha%TYPE,
         poResultId   OUT responsavel.id%TYPE,
         poResultNome OUT responsavel.nome%TYPE
  );
  --
  -- PROCEDURE DE INSERT
  --
  function insertResp (
         pNome      IN        responsavel.nome%TYPE,
         pCpf       IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE,
         pCelular   IN        responsavel.celular%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  ) return number;
  --
  -- PROCEDURE DE DELETE
  --
  procedure deleteResp (
    pinCpf  IN  responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE REATIVAR CONTA
  --
  procedure reActiveResp (
    pinCpf IN responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE UPDATE CPF
  --
  procedure updateCpfResp (
         pCpfAntigo IN        responsavel.cpf%TYPE,
         pCpf       IN        responsavel.cpf%TYPE
  );
  --
  -- PROCEDURE DE UPDATE NOME
  --
  procedure updateNomeResp (
         pCpf IN        responsavel.cpf%TYPE,
         pNome      IN        responsavel.nome%TYPE
  );
  --
  -- PROCEDURE DE UPDATE EMAIL
  --
  procedure updateEmailResp (
         pCpf IN        responsavel.cpf%TYPE,
         pEmail     IN        responsavel.email%TYPE
  );
  --
  -- PROCEDURE DE UPDATE CELULAR
  --
  procedure updateCelularResp (
         pCpf IN        responsavel.cpf%TYPE,
         pCelular   IN        responsavel.celular%TYPE
  );
  --
  -- PROCEDURE DE UPDATE SENHA
  --
  procedure updateSenhalResp (
         pCpf IN        responsavel.cpf%TYPE,
         pSenha     IN        responsavel.senha%TYPE
  );
  --
end ResponsavelDD;
