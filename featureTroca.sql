create or replace package featureTROCA as
--
  procedure recusaTroca (
    pinIdTroca  IN  troca.id%TYPE,
    poSucesso   OUT number
  );
--
  procedure efetivaTroca (
    pinIdItemA       IN item.id%TYPE,
    pinIdItemB       IN item.id%TYPE,
    pinIdResponsavel IN responsavel.id%TYPE,
    poSucesso        OUT number
  );
--
end featureTROCA;
