create or replace package imagemDD as
--
  function insertImg (
    pinBlobImg  IN  imagem.imagem_arquivo%TYPE,
    pinIdItem   IN  imagem.id_item%TYPE
  ) return number;
--
end;
