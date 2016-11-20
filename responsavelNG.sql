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
--
procedure cadastrar (
  pNome      IN        responsavel.nome%TYPE,
  pCpf       IN        responsavel.cpf%TYPE,
  pEmail     IN        responsavel.email%TYPE,
  pCelular   IN        responsavel.celular%TYPE,
  pSenha     IN        responsavel.senha%TYPE,
  poSucesso  OUT       number
);
--
procedure editarPerfil (
  pinID     IN  responsavel.id%TYPE,
  pinNome   IN  responsavel.nome%TYPE,
  pinCpf    IN  responsavel.cpf%TYPE,
  pinEmail  IN  responsavel.email%TYPE,
  pinCelular IN responsavel.celular%TYPE,
  pinSenha  IN  responsavel.senha%TYPE,
  pinConfirmaSenha IN responsavel.senha%TYPE,
  pinLogradouro  IN  endereco.logradouro%TYPE,
  pinNumero  IN endereco.numero%TYPE,
  pinCep  IN  endereco.cep%TYPE,
  pinComplemento IN endereco.complemento%TYPE,
  pinTipo IN endereco.tipo%TYPE,
  pinCidade IN endereco.cidade%TYPE,
  pinEstado IN endereco.estado%TYPE,
  poSucesso OUT number
);
--
end responsavelNG;
