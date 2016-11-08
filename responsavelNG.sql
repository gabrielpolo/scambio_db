create or replace package responsavelNG as
--
-- PACKAGE DE NEGÓCIOS
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  poResultId   OUT  responsavel.id%TYPE,
  poResultNome OUT  responsavel.nome%TYPE 
);

procedure cadastrar (
  pNome      IN        responsavel.nome%TYPE,
  pCpf       IN        responsavel.cpf%TYPE,
  pEmail     IN        responsavel.email%TYPE,
  pCelular   IN        responsavel.celular%TYPE,
  pSenha     IN        responsavel.senha%TYPE,
  poSucesso  OUT       number
);
--
end responsavelNG;
