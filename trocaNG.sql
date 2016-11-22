create or replace package featureTROCA as
  --
    procedure TrocaItem(
      pinIdItem     IN item.id%TYPE,
      pinIdUsuario  IN responsavel.id%TYPE,
      poSucesso     OUT number
    );
    --
    function lBuscaUsuarioPorIDItem (
    pinIdItem IN item.id%TYPE
    ) return responsavel%ROWTYPE;
    --
end featureTROCA;
