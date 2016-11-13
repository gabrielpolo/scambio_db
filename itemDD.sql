create or replace package itemDD as
--
  function insertItem(
    pinDescricao      IN  item.descricao%TYPE,
    pinUsado          IN  item.usado%TYPE,
    pinIdMarca        IN  item.id_marca%TYPE,
    pinIdTamanho      IN  item.id_tamanho%TYPE,
    pinIdSubCategoria IN  item.id_subcategoria%TYPE,
    pinIdResponsavel  IN  item.id_responsavel%TYPE,
    pinGenero         IN  item.id_genero%TYPE
  ) return number;
--
  function buscaItemPorID (
    pinId   IN item.id%TYPE
  ) return item%ROWTYPE;
--
end itemDD;
