create or replace package imagemNG as
--
  procedure cadastraImg (
    pinBlobImg  IN  imagem.imagem_arquivo%TYPE,
    pinIdItem   IN  imagem.id_item%TYPE,
    poSucesso   OUT number
  );
--
end imagemNG;
