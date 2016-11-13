create or replace package body itemNG as
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
  ) as
  --
  procedureName varchar2(30) := 'cadastraItem';
  --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    if pinDescricao       is not null and
       pinUsado           is not null and
       pinIdMarca         is not null and
       pinIdTamanho       is not null and
       pinIdSubCategoria  is not null and
       pinIdResponsavel   is not null and
       pinGenero          is not null        then
       --
       poSucesso := itemDD.insertItem( pinDescricao ,
                                      pinUsado ,
                                      pinIdMarca ,
                                      pinIdTamanho ,
                                      pinIdSubCategoria ,
                                      pinIdResponsavel,
                                      pinGenero
                                    );
       --
       logProcedures.scambioLog_DBMS(procedureName, 'ID = '|| poSucesso, 'N');
       --
       if poSucesso is null then
         --
         poSucesso := 0;
         --
      end if;
       --
    else
       --
       poSucesso := 0;
       --
    end if;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
  --
  -- BUSCA DADOS ITENS
  procedure buscaDadosItens (
    pinId          IN  item.id%TYPE,
    poCategoria    OUT categoria.descricao%TYPE,
    poSubCategoria OUT subcategoria.descricao%TYPE,
    poMarca        OUT marca.descricao%TYPE,
    poUsado        OUT item.usado%TYPE,
    poGenero       OUT item.id_genero%TYPE,
    poTamanho      OUT tamanho.descricao%TYPE,
    poDescricao    OUT item.descricao%TYPE
  ) as
  --
  procedureName varchar2(30) := 'buscaDadosItens';
  --
  resultItem item%ROWTYPE;
  --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    resultItem := itemDD.buscaItemPorID(pinId);
    --
    if resultItem.id is not null then
      --
      poGenero    := resultItem.ID_GENERO;
      poDescricao := resultItem.descricao;
      poUsado     := resultItem.usado;
      --
      poMarca := ItemUtilDD.buscaMarcaPorID(resultItem.id_marca);
      --
      poTamanho := ItemUtilDD.buscaTamanhoPorID(resultItem.id_tamanho);
      --
      ItemUtilDD.buscaCategoriaESubPorID(resultItem.id_subcategoria, poCategoria, poSubCategoria);
      --
    end if;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
--
end itemNG;
