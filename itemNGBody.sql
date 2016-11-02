create or replace package body itemNG as
--
  procedure cadastraItem (
    pinDescricao      IN  item.descricao%TYPE,
    pinUsado          IN  item.usado%TYPE,
    pinIdMarca        IN  item.id_marca%TYPE,
    pinIdTamanho      IN  item.id_tamanho%TYPE,
    pinIdSubCategoria IN  item.id_subcategoria%TYPE,
    pinIdResponsavel  IN  item.id_responsavel%TYPE,
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
       pinIdResponsavel   is not null        then
       --
       poSucesso := itemDD.insertItem( pinDescricao ,
                                      pinUsado ,
                                      pinIdMarca ,
                                      pinIdTamanho ,
                                      pinIdSubCategoria ,
                                      pinIdResponsavel
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
end itemNG;
