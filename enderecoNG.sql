create or replace package enderecoNG as
  --
  procedure insert (
    pinLogradouro  IN  endereco.logradouro%TYPE,
    pinNumero      IN  endereco.numero%TYPE,
    pinCep         IN  endereco.cep%TYPE,
    pinComplemento IN  endereco.complemento%TYPE,
    pinTipo        IN  endereco.tipo%TYPE,
    pinCidade      IN  endereco.cidade%TYPE,
    pinEstado      IN  endereco.estado%TYPE,
    pinResponsavel IN  endereco.responsavel%TYPE,
    poSucesso      OUT number
  );
  --
end enderecoNG;
