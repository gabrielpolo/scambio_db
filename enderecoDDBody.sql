create or replace package body enderecoDD as
--
--
  procedure insertEndereco (
    pinLogradouro  IN  endereco.logradouro%TYPE,
    pinNumero      IN  endereco.numero%TYPE,
    pinCep         IN  endereco.cep%TYPE,
    pinComplemento IN  endereco.complemento%TYPE,
    pinTipo        IN  endereco.tipo%TYPE,
    pinCidade      IN  endereco.cidade%TYPE,
    pinEstado      IN  endereco.estado%TYPE,
    pinResponsavel IN  endereco.responsavel%TYPE
  )
  as
  --
  procedureName varchar2(30) := 'insertEndereco';
  --
  Begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  insert into endereco
    values (seq_endereco.nextval, pinLogradouro, pinNumero, pinCep, pinComplemento,
             pinTipo, pinCidade, pinEstado, pinResponsavel );
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'O');
  --
  end;
--
end enderecoDD;
