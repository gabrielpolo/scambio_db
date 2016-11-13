/*

SCRIPT DE INSTALAÇÃO.


      A instalação é feita corretamente quando aplicarmos primeiro as classes
      DD's, após todas aplicadas aplicamos as NG, com isso os objetos nao
      ficaram descompilados.
*/
--
prompt ===================================
prompt      INSTALANDO LOGPROCEDURES
prompt ===================================
--
@logProcedures.sql
--
@logProceduresBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO LOGPROCEDURES CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO RESPONSAVELDD
prompt ===================================
--
@ResponsavelDD.sql
--
@ResponsavelDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO RESPONSAVELDD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO TROCADD
prompt ===================================
--
@trocaDD.sql
--
@trocaDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO TROCADD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO ENDERECODD
prompt ===================================
--
@enderecoDD.sql
--
@enderecoDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO ENDERECODD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO ITEMDD
prompt ===================================
--
@itemDD.sql
--
@itemDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO ITEMDD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO ITEMDD
prompt ===================================
--
@ItemUtilDD.sql
--
@ItemUtilDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO ITEMDD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO IMAGEMDD
prompt ===================================
--
@imagemDD.sql
--
@imagemDDBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO IMAGEMDD CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO RESPONSAVELNG
prompt ===================================
--
@responsavelNG.sql
--
@responsavelNGBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO REPONSAVELNG CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO ENDERECONG
prompt ===================================
--
@enderecoNG.sql
--
@enderecoNGBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO ENDERECONG CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO ITEMNG
prompt ===================================
--
@itemNG.sql
--
@itemNGBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO ITEMNG CONCLUIDA.
prompt ==============================================
--
prompt ===================================
prompt      INSTALANDO IMAGEMNG
prompt ===================================
--
@imagemNG.sql
--
@imagemNGBody.sql
--
prompt ==============================================
prompt      INSTALAÇÃO IMAGEMNG CONCLUIDA.
prompt ==============================================
--
commit;
--
/
