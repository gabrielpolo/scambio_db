create or replace package body responsavelNG as
--
-- Body da classe de negócios da tabela responsavel.
--
procedure login (
  pinEmail   IN     responsavel.email%TYPE,
  pinSenha   IN     responsavel.senha%TYPE,
  poResultId   OUT  responsavel.id%TYPE,
  poResultNome OUT  responsavel.nome%TYPE
) as
  --
  procedureName varchar2(30) := 'login';
  --
  Begin
    --
    -- log de entrada
    --
    logProcedures.inicioProcedure_DBMS(procedureName, 'O');
    --
    responsavelDD.confirmaLogin(pinEmail, pinSenha, poResultId, poResultNome );
    --
    -- log de saida
    --
    logProcedures.fimProcedure_DBMS(procedureName, 'O');
    --
  end;

  procedure cadastrar (
    pNome      IN        responsavel.nome%TYPE,
    pCpf       IN        responsavel.cpf%TYPE,
    pEmail     IN        responsavel.email%TYPE,
    pCelular   IN        responsavel.celular%TYPE,
    pSenha     IN        responsavel.senha%TYPE,
    poSucesso  OUT       number
  ) as
  --
  procedureName varchar2(30) := 'cadastrar';
  --
  begin
  --
  logProcedures.inicioProcedure_DBMS(procedureName, 'O');
  --
  if pNome    is not null and
     pCpf     is not null and
     pEmail   is not null and
     pCelular is not null and
     pSenha   is not null       then
    --
    poSucesso := responsavelDD.insertResp(pNome, pCpf, pEmail, pCelular, pSenha);
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
  procedure editarPerfil (
    pinID     IN  responsavel.id%TYPE,
    pinNome   IN  responsavel.nome%TYPE,
    pinCpf    IN  responsavel.cpf%TYPE,
    pinEmail  IN  responsavel.email%TYPE,
    pinCelular IN responsavel.celular%TYPE,
    pinSenha  IN  responsavel.senha%TYPE,
    pinConfirmaSenha IN responsavel.senha%TYPE,
    pinLogradouro  IN  endereco.logradouro%TYPE,
    pinNumero  IN endereco.numero%TYPE,
    pinCep  IN  endereco.cep%TYPE,
    pinComplemento IN endereco.complemento%TYPE,
    pinTipo IN endereco.tipo%TYPE,
    pinCidade IN endereco.cidade%TYPE,
    pinEstado IN endereco.estado%TYPE,
    poSucesso OUT number
  ) as
  --
  procedureName varchar2(30) := 'editarPerfil';
  --
  begin
  --
  if pinSenha = pinConfirmaSenha then
    --
    ResponsavelDD.updateCpfResp(pinID, pinCpf);
    ResponsavelDD.updateNomeResp(pinID, pinNome);
    ResponsavelDD.updateEmailResp(pinID, pinEmail);
    ResponsavelDD.updateCelularResp(pinID, pinCelular);
    ResponsavelDD.updateSenhalResp(pinID, pinSenha);
    --
    enderecoDD.updateEndereco(pinID, pinLogradouro, pinNumero, pinCep, pinComplemento, pinTipo, pinCidade, pinEstado);
    --
    poSucesso := 0;
    --
  else
    --
    poSucesso := 2;
    --
  end if;
  --
  exception
    when others then
      --
      poSucesso := 1;
      --
  end;
--
end responsavelNG;
