create or replace package ItemUtilDD as
--
  function buscaMarcaPorID (
    pinIdMarca  IN marca.id%TYPE
  ) return marca.descricao%TYPE;
  --
  procedure buscaCategoriaESubPorID (
    pinIdSubCategoria  IN item.id_subcategoria%TYPE,
    poCategoria        OUT categoria.descricao%TYPE,
    poSubCategoria     OUT subcategoria.descricao%TYPE
  );
  --
  function buscaTamanhoPorID (
    pinIdTamanho   IN  item.id_tamanho%TYPE
  ) return tamanho.descricao%TYPE;
--
end ItemUtilDD;
