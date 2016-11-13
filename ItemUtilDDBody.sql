create or replace package body ItemUtilDD as
--
  --
  --
  --BUSCA MARCA POR ID
  function buscaMarcaPorID (
    pinIdMarca  IN marca.id%TYPE
  ) return marca.descricao%TYPE
  as
  --
  procedureName varchar2(30) := 'buscaMarcaPorID';
  --
  result marca.descricao%TYPE;
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  select m.descricao
  into   result
  from   marca m
  where  m.id = pinIdMarca;
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'O');
  --
  return result;
  --
  end;
  --
  --
  -- BUSCA TAMANHO POR ID
  function buscaTamanhoPorID (
    pinIdTamanho   IN  item.id_tamanho%TYPE
  ) return tamanho.descricao%TYPE
  as
  --
  procedureName varchar2(30) := 'buscaTamanhoPorID';
  --
  result tamanho.descricao%TYPE;
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  select t.descricao
  into   result
  from   tamanho t
  where  t.id = pinIdTamanho;
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'O');
  --
  return result;
  --
  end;
  --
  --
  -- BUSCA CATEGORIA E SUBCATEGORIA POR ID
    procedure buscaCategoriaESubPorID (
    pinIdSubCategoria  IN item.id_subcategoria%TYPE,
    poCategoria        OUT categoria.descricao%TYPE,
    poSubCategoria     OUT subcategoria.descricao%TYPE
  ) as
  --
  procedureName varchar2(30) := 'buscaCategoriaESubPorID';
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  select c.descricao,
         sc.descricao
  into   poCategoria,
         poSubCategoria
  from   subcategoria sc,
         categoria    c
  where  sc.id = pinIdSubCategoria and
         c.id  = sc.id;
  --
  logProcedures.fimProcedure_DBMS(procedureName, 'O');
  --
  end;
--
end ItemUtilDD;
