create or replace package body itemDD as
--
  function insertItem(
    pinDescricao      IN  item.descricao%TYPE,
    pinUsado          IN  item.usado%TYPE,
    pinIdMarca        IN  item.id_marca%TYPE,
    pinIdTamanho      IN  item.id_tamanho%TYPE,
    pinIdSubCategoria IN  item.id_subcategoria%TYPE,
    pinIdResponsavel  IN  item.id_responsavel%TYPE
  ) return number
  as
  --
  procedureName varchar2(30) := 'insertItem';
  --
  vnIdItemAdicionado number;
  --
  begin
  --
    logProcedures.inicioProcedure_DBMS(procedureName, 'I');
    --
    vnIdItemAdicionado := seq_item.nextval;
    --
    insert into item
    values (vnIdItemAdicionado,
            pinDescricao,
            pinUsado,
            'A',
            pinIdMarca,
            pinIdTamanho,
            pinIdSubCategoria,
            pinIdResponsavel  );
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'I');
    --
    commit;
    --
    return vnIdItemAdicionado;
  --
  exception
    when others then
      --
      return null;
      --
  end;
--
end itemDD;
