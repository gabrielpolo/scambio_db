create or replace package responsavelNGBody as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail IN responsavel.email%TYPE,
  pinSenha IN responsavel.senha%TYPE,
  pioSucesso IN/OUT boolean
) As
--
vboolSucesso boolean := FALSE;
--
Begin
  --
  vboolSucesso := responsavelNG.confirmaLogin(pinEmail, pinSenha);
  --
  if vboolSucesso then
    --
    pioSucesso := true;
    --
  End if;
  --
end;
--
--
End responsavelNGBody;
