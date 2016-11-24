create or replace package body featureTROCA as
--
  procedure efetivaTroca (
    pinIdItemA       IN item.id%TYPE,
    pinIdItemB       IN item.id%TYPE,
    pinIdResponsavel IN responsavel.id%TYPE,
    poSucesso        OUT number
  ) as
    --
    procedureName   varchar2(30) := 'efetivaTroca';
    --
    vnIdItemA           item.id%TYPE := pinIdItemA;
    vnIdItemB           item.id%TYPE := pinIdItemB;
    vnIdReponsavel      responsavel.id%TYPE := pinIdResponsavel;
    --
    vnIdEventoTroca     troca.id%TYPE;
    vnIdEventoRelTroca  rel_troca_item.id%TYPE;
    --
    vrResponsavelDono   responsavel%ROWTYPE;
    vrRespSolicitante   responsavel%ROWTYPE;
    --
  begin
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    -- Se o item B estiver nullo significa q é uma troca onde os dois usuarios ainda
    --    nao possuem ligação, nem seus itens.
    if vnIdItemB is null then
      logProcedures.scambioLog_DBMS(procedureName, '[DEBUG]ENTROU NO IF', 'N');
      -- buscamos se n é uma solicitação repetida.
      if trocaDD.buscaTrocaCorrente(vnIdItemA, vnIdReponsavel) then
        --
        poSucesso := 2;
        logProcedures.scambioLog_DBMS(procedureName, '[DEBUG]poSucesso => '||poSucesso , 'N');
        --
      else
        -- Pegamos as informações dos usuarios e do item.
        vrResponsavelDono := ResponsavelDD.buscaPorIdItem(vnIdItemA);
        --
        vrRespSolicitante := ResponsavelDD.buscaPorId(vnIdReponsavel);
        -- Agora fazemos a pre incersão da troca.
        logProcedures.scambioLog_DBMS(procedureName, '[DEBUG]idDONO => '||vrResponsavelDono.id , 'N');
        logProcedures.scambioLog_DBMS(procedureName, '[DEBUG]idresp => '||vrRespsolicitante.id , 'N');
        if vrResponsavelDono.id is not null and vrRespSolicitante.id is not null then
          --
          vnIdEventoTroca := trocaDD.insertTroca( vrResponsavelDono.id,
                                                  vrRespSolicitante.id,
                                                  sysdate,
                                                  'N',
                                                  'S'
                                                );
          -- Agora inserimos a relação da troca com o item e o futuro item.
          vnIdEventoRelTroca := trocaDD.insertRelacaoTroca(vnIdItemA, vnIdEventoTroca);
          --
          poSucesso := 0;
          --
        else
          --
          poSucesso := 1;
          --
        end if;
        --
      end if;
    -- Nesse else nos sabemos que um item foi escolhido e que precisaremos continuar
    else
      -- Pegamos as informações dos usuarios e do item.
      vrResponsavelDono := ResponsavelDD.buscaPorIdItem(vnIdItemA);
      vrRespSolicitante := ResponsavelDD.buscaPorId(vnIdReponsavel);
      -- Buscamos o Id da troca referente ao item e ususeario em questao.
      vnIdEventoTroca := trocaDD.buscaIdTrocaPorCompletar(vnIdReponsavel, vnIdItemA);
      --
      if vnIdEventoTroca is not null then
        -- Buscamos o Id da relação de troca.
        vnIdEventoRelTroca := trocaDD.buscaIdRelTrocaItem(vnIdEventoTroca);
        -- efetivamos a troca
        if trocaDD.completaTroca(vnIdItemB, vnIdEventoTroca, vnIdEventoRelTroca) then
          --
          poSucesso := 0;
          --
        else
          --
          poSucesso := 1;
          --
        end if;
        --
      else
        --
        poSucesso := 1;
        --
      end if;
      --
    end if;
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;
end featureTROCA;
