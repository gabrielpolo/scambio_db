create or replace package body imagemDD as
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
