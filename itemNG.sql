create or replace package itemNG as
--
  procedure cadastraItem (
    pinDescricao      IN  item.descricao%TYPE,
    pinUsado          IN  item.usado%TYPE,
    pinIdMarca        IN  item.id_marca%TYPE,
    pinIdTamanho      IN  item.id_tamanho%TYPE,
    pinIdSubCategoria IN  item.id_subcategoria%TYPE,
    pinIdResponsavel  IN  item.id_responsavel%TYPE,
    pinGenero         IN  item.id_genero%TYPE,
    poSucesso         OUT number
  );
--
  procedure buscaDadosItens (
    pinId          IN  item.id%TYPE,
    poCategoria    OUT categoria.descricao%TYPE,
    poSubCategoria OUT subcategoria.descricao%TYPE,
    poMarca        OUT marca.descricao%TYPE,
    poUsado        OUT varchar2,
    poGenero       OUT varchar2,
    poTamanho      OUT tamanho.descricao%TYPE,
    poDescricao    OUT item.descricao%TYPE
  );
--
end itemNG;
