create or replace package enderecoDD as
--
-- PROCEDURE DE DADOS DA TABELA ENDERECO.
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
  );
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
  );
end enderecoDD;
