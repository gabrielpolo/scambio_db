create or replace package body imagemDD as
--
/*
  function buscaImgItemData (
    pinIdItem     IN   item.id%TYPE
  ) return imagemDD.vTbrImagem as
    --
    procedureName varchar2(30) := 'cadastraImg';
    --
    vcImagemBLob  imagemDD.vTbrImagem;
    --
    i BINARY_INTEGER := 0;
    --
    cursor c1 is
      select *
      from   imagem i
      where  i.id_item = pinIdItem;
    --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'I');
    --
    open c1;
    loop
      i := i+1;
      fetch c1 into vcImagemBLob(i);
      exit when c1%NOTFOUND;
    end loop;
    close c1;
    --
    return vcImagemBLob;
    --
  end;
*/
--
  function insertImg (
    pinBlobImg  IN  imagem.imagem_arquivo%TYPE,
    pinIdItem   IN  imagem.id_item%TYPE
  ) return number
  as
  --
  procedureName varchar2(30) := 'cadastraImg';
  --
  vnIDImagem number;
  --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'I');
    --
    vnIDImagem := seq_img.nextval;
    --
    insert into imagem
      values (vnIDImagem, pinBlobImg, pinIdItem, sysdate);
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'I');
    --
    commit;
    --
    return vnIDImagem;
    --
  exception
    when others then
      --
      return null;
      --
  end;
--
end imagemDD;
