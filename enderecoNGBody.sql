create or replace package body enderecoNG as
  --
  procedure CadastrarEnd (
    pinLogradouro  IN  endereco.logradouro%TYPE,
    pinNumero      IN  endereco.numero%TYPE,
    pinCep         IN  endereco.cep%TYPE,
    pinComplemento IN  endereco.complemento%TYPE,
    pinTipo        IN  endereco.tipo%TYPE,
    pinCidade      IN  endereco.cidade%TYPE,
    pinEstado      IN  endereco.estado%TYPE,
    pinResponsavel IN  endereco.responsavel%TYPE,
    poSucesso      OUT number
  ) as
  --
  procedureName varchar2(30) := 'insertEndereco';
  --
  Begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'I');
  --
  if pinLogradouro  is not null and
     pinNumero      is not null and
     pinCep         is not null and
     pinComplemento is not null and
     pinTipo        is not null and
     pinCidade      is not null and
     pinEstado      is not null and
     pinResponsavel id not null          then
     --
     enderecoDD.insertEndereco( pinLogradouro,
                                pinNumero,
                                pinCep,
                                pinComplemento,
                                pinTipo,
                                pinCidade,
                                pinEstado,
                                pinResponsavel   );
     --
     poSucesso := 1;
     --
  else
    --
    poSucesso := 0;
    --
 end if;
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'I');
  --
  end;
  --
end enderecoNG;
