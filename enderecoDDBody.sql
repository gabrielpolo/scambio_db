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
    pinResponsavel IN  endereco.id_responsavel%TYPE
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
               pinTipo, 'A', pinCidade, pinEstado, pinResponsavel);
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
    commit;
    --
  end;
--
  procedure updateEndereco (
    pinIdResp in responsavel.id%TYPE,
    pinLogradouro  IN  endereco.logradouro%TYPE,
    pinNumero  IN endereco.numero%TYPE,
    pinCep  IN  endereco.cep%TYPE,
    pinComplemento IN endereco.complemento%TYPE,
    pinTipo IN endereco.tipo%TYPE,
    pinCidade IN endereco.cidade%TYPE,
    pinEstado IN endereco.estado%TYPE
  ) as
  --
  procedureName varchar2(30) := 'updateEndereco';
  --
  begin
    --
    update endereco e
      set e.logradouro = pinLogradouro,
          e.numero = pinNumero,
          e.cep = pinCep,
          e.complemento = pinComplemento,
          e.tipo = pinTipo,
          e.cidade = pinCidade,
          e.estado = pinEstado
      where e.id_responsavel = pinIdResp;
    --
    commit;
    --
  end;
--
end enderecoDD;
