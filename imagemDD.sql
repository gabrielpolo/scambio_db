create or replace package imagemDD as
--
TYPE vTbrImagem IS TABLE OF  imagem%ROWTYPE
   INDEX BY BINARY_INTEGER;
--
/*
  function buscaImgItemData (
    pinIdItem     IN   item.id%TYPE
  ) return imagemDD.vTbrImagem;
*/
--
  function insertImg (
    pinBlobImg  IN  imagem.imagem_arquivo%TYPE,
    pinIdItem   IN  imagem.id_item%TYPE
  ) return number;
--
end;
