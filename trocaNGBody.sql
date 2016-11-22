create or replace procedure body trocaNG as
--
  --
  function buscaUsuarioPorIDItem (
    pinIdItem IN item.id%TYPE
  ) return responsavel%ROWTYPE
  as
    vrResp responsavel%ROWTYPE;
  begin
    select r.*
    into   vrResp
    from   item i,
           responsavel r
    where  i.id = pinIdItem and
           r.id = i.id_responsavel;
    --
    return vrResp;
  exception
    when other then
      return null;
  --
  end;
  --
  -- insere a primeira vez a troca.
  procedure lInserePreTroca (
    pinDonoDoItem  IN responsavel%ROWTYPE,
    pinSolicitador IN responsavel%ROWTYPE,
    pinIdItem      IN item.id%TYPE
  ) as
  vnIDTROCA number;
  begin
    --
    vnIDTROCA := seq_troca.nextval;
    --
    insert into troca values (vnIDTROCA,
                               pinDonoDoItem.id,
                               pinSolicitador.id,
                               sysdate,
                               'N',
                               'S');
    --
    insert into REL_TROCA_ITEM values (seq_rel_troca_item.nextval,
                                       pinIdItem,
                                       vnIDTROCA );
    --
  end;
--
function lTrocaAtiva(
  pinIdItem IN item.id%TYPE,
  pvrTrocador IN responsavel%ROWTYPE
) return troca%ROWTYPE
as
  vrTroca troca%ROWTYPE;
begin
  --
  for i in (select * from REL_TROCA_ITEM rel where rel.id_item = pinIdItem) loop
    --
    select *
    into   vrTroca
    from   troca t
    where t.concretizacaoTrocadorA = 'N' and
          t.concretizacaoTrocadorB = 'S' and
          t.id_trocadorA = pvrTrocador.id;
    --
    if vrTroca is not null then
      --
      return vrTroca;
      --
    end if;
    --
  end loop;
  --
  return null;
end;
--
procedure efetivaTroca(
  pinIdItem     IN item.id%TYPE,
  pinIdUsuario  IN responsavel.id%TYPE,
  poSucesso     OUT number;
) as
  --
  vnIdItem      item.id%TYPE := pinIdItem;
  vnIdResp      responsavel.id%TYPE := pinIdUsuario;
  vrDonoDoItem  responsavel%ROWTYPE;
  vrSolicitador responsavel%ROWTYPE;
  --
begin
  -- busco o dono do item
  vrDonoDoItem  := buscaUsuarioPorIDItem(vnIdItem);
  vrSolicitador := ResponsavelDD.buscaPorId(vnIdResp);
  -- vejo se o item ja nao esta com a troca ativa.
  if lTrocaAtiva(vnIdItem, vrSolicitador) then
    --
    lConcretizaTroca(vnIdItem);
    --
  else
    --
    lInserePreTroca(vrDonoDoItem, vrSolicitador, vnIdItem);
    --
  end if;
end;
--
end trocaNG;
