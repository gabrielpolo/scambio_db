create or replace package responsavelNG as
--
-- PACKAGE DE NEGÓCIOS
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  poResult   OUT    responsavel.id%TYPE
);
--
end responsavelNG;
