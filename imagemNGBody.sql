create or replace package body imagemNG as
--
  procedure cadastraImg (
    pinBlobImg  IN  imagem.imagem_arquivo%TYPE,
    pinIdItem   IN  imagem.id_item%TYPE,
    poSucesso   OUT number
  ) as
  --
  procedureName varchar2(30) := 'cadastraImg';
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  if pinIdItem  is not null and
     pinBlobImg is not null       then
    --
    poSucesso := imagemDD.insertImg( pinBlobImg,
                                     pinIdItem
                                    );
    --
    if poSucesso is null then
      --
      logProcedures.scambioLog_DBMS(procedureName,
                                    'poSucesso = '|| poSucesso,
                                    'N'
                                   );
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
end imagemNG;
