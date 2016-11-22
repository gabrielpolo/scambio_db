create or replace procedure trocaNG as
  --
    procedure efetivaTroca(
      pinIdItem     IN item.id%TYPE,
      pinIdUsuario  IN responsavel.id%TYPE,
      poSucesso     OUT number;
    );
end trocaNG;
