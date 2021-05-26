
CREATE TABLE [Bairro]
(
	[Cd_Bairro]          integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Nm_Bairro]          varchar(50)  NOT NULL ,
	[Cd_Municipio]       integer  NOT NULL
)
go

ALTER TABLE [Bairro]
	ADD CONSTRAINT [XPKBairro] PRIMARY KEY  CLUSTERED ([Cd_Bairro] ASC)
go

CREATE TABLE [Compra]
(
	[Cd_Compra]          integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Qt_Quantidade]      integer  NOT NULL ,
	[Cd_NF]              integer  NOT NULL ,
	[Cd_Produto]         integer  NOT NULL
)
go

ALTER TABLE [Compra]
	ADD CONSTRAINT [XPKCompra] PRIMARY KEY  CLUSTERED ([Cd_Compra] ASC)
go

CREATE TABLE [Duplicata]
(
	[Cd_Duplicata]       integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Dt_Vencimento]      datetime  NOT NULL ,
	[Vl_Valor]           integer  NOT NULL ,
	[Cd_NF]              integer  NOT NULL ,
	[Dt_Pagamento]       datetime  NULL ,
	[Vl_Pagamento]       integer  NULL
)
go

ALTER TABLE [Duplicata]
	ADD CONSTRAINT [XPKDuplicata] PRIMARY KEY  CLUSTERED ([Cd_Duplicata] ASC)
go

CREATE TABLE [Endereco]
(
	[Cd_Endereco]        integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Nm_Complemento]     varchar(50)  NULL ,
	[Nu_Numero]          varchar(20)  NOT NULL ,
	[Nm_Endereco]        varchar(200)  NOT NULL ,
	[Cd_Bairro]          integer  NOT NULL ,
	[Cd_Municipio]       integer  NOT NULL ,
	[Cd_UF]              integer  NOT NULL ,
	[Nu_CEP]             varchar(20)  NOT NULL
)
go

ALTER TABLE [Endereco]
	ADD CONSTRAINT [XPKEndereco] PRIMARY KEY  CLUSTERED ([Cd_Endereco] ASC)
go

CREATE TABLE [Municipio]
(
	[Cd_Municipio]       integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Nm_Municipio]       varchar(50)  NOT NULL ,
	[Cd_UF]              integer  NOT NULL
)
go

ALTER TABLE [Municipio]
	ADD CONSTRAINT [XPKMunicipio] PRIMARY KEY  CLUSTERED ([Cd_Municipio] ASC)
go

CREATE TABLE [NotaFiscal]
(
	[Dt_Emissao]         datetime  NOT NULL ,
	[Cd_NF]              integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_NumeroSerie]     integer  NOT NULL ,
	[Ds_Informacao]      varchar(20)  NULL ,
	[Cd_PJ]              integer  NOT NULL ,
	[Tp_EntradaSaida]    bit  NOT NULL ,
	[Dt_EntradaSaida]    datetime  NOT NULL ,
	[Tp_FreteConta]      bit  NULL ,
	[Cd_Transportadora]  integer  NULL ,
	[Cd_CFOP]            char(4)  NOT NULL ,
	[Nu_Via]             integer  NOT NULL ,
	[Dt_LimiteEmissao]   datetime  NOT NULL ,
	[Cd_Pessoa]          integer  NOT NULL
)
go

ALTER TABLE [NotaFiscal]
	ADD CONSTRAINT [XPKNotaFiscal] PRIMARY KEY  CLUSTERED ([Cd_NF] ASC)
go

CREATE TABLE [Pessoa]
(
	[Nm_Pessoa]          varchar(50)  NOT NULL ,
	[Cd_Pessoa]          integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_Endereco]        integer  NOT NULL ,
	[Nu_Telefone]        varchar(20)  NULL
)
go

ALTER TABLE [Pessoa]
	ADD CONSTRAINT [XPKPessoa] PRIMARY KEY  CLUSTERED ([Cd_Pessoa] ASC)
go

CREATE TABLE [Pessoa_Fisica]
(
	[Cd_PF]              integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_CPF]             char(11)  NOT NULL ,
	[Cd_Pessoa]          integer  NOT NULL
)
go

ALTER TABLE [Pessoa_Fisica]
	ADD CONSTRAINT [XPKPessoa_Fisica] PRIMARY KEY  CLUSTERED ([Cd_PF] ASC)
go

CREATE TABLE [Pessoa_Juridica]
(
	[Cd_CNPJ]            varchar(20)  NOT NULL ,
	[Cd_InscEstadual]    varchar(20)  NOT NULL ,
	[Cd_InstTribEst]     varchar(20)  NOT NULL ,
	[Cd_PJ]              integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_Pessoa]          integer  NOT NULL
)
go

ALTER TABLE [Pessoa_Juridica]
	ADD CONSTRAINT [XPKPessoa_Juridica] PRIMARY KEY  CLUSTERED ([Cd_PJ] ASC)
go

CREATE TABLE [Produto]
(
	[Ds_Marca]           varchar(20)  NULL ,
	[Ds_Descricao]       varchar(20)  NULL ,
	[Ds_SituacaoTrib]    varchar(20)  NULL ,
	[Vl_Unitario]        money  NOT NULL ,
	[In_ICMS]            money  NOT NULL ,
	[In_IPI]             money  NOT NULL ,
	[Vl_Seguro]          money  NULL ,
	[Cd_Produto]         integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_SituacaoTrib]    integer  NOT NULL ,
	[Vl_Total]           money  NOT NULL
)
go

ALTER TABLE [Produto]
	ADD CONSTRAINT [XPKProduto] PRIMARY KEY  CLUSTERED ([Cd_Produto] ASC)
go

CREATE TABLE [Transportadora]
(
	[Cd_Transportadora]  integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Vl_Frete]           integer  NOT NULL ,
	[Cd_PJ]              integer  NOT NULL
)
go

ALTER TABLE [Transportadora]
	ADD CONSTRAINT [XPKTransportadora] PRIMARY KEY  CLUSTERED ([Cd_Transportadora] ASC)
go

CREATE TABLE [UF]
(
	[Cd_UF]              integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Nm_Estado]          varchar(50)  NULL ,
	[Sg_UF]              char(2)  NULL
)
go

ALTER TABLE [UF]
	ADD CONSTRAINT [XPKUF] PRIMARY KEY  CLUSTERED ([Cd_UF] ASC)
go

CREATE TABLE [Veiculo]
(
	[Cd_Veiculo]         integer  NOT NULL  IDENTITY ( 1,1 ) NOT FOR REPLICATION ,
	[Cd_Placa]           varchar(7)  NOT NULL ,
	[Cd_Transportadora]  integer  NOT NULL ,
	[Nm_Especie]         varchar(18)  NOT NULL ,
	[Nm_Marca]           varchar(18)  NOT NULL ,
	[Cd_UF]              integer  NOT NULL
)
go

ALTER TABLE [Veiculo]
	ADD CONSTRAINT [XPKVeiculo] PRIMARY KEY  CLUSTERED ([Cd_Veiculo] ASC)
go


ALTER TABLE [Bairro]
	ADD CONSTRAINT [R_61] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Compra]
	ADD CONSTRAINT [R_46] FOREIGN KEY ([Cd_Produto]) REFERENCES [Produto]([Cd_Produto])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Compra]
	ADD CONSTRAINT [R_81] FOREIGN KEY ([Cd_NF]) REFERENCES [NotaFiscal]([Cd_NF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Duplicata]
	ADD CONSTRAINT [R_43] FOREIGN KEY ([Cd_NF]) REFERENCES [NotaFiscal]([Cd_NF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Endereco]
	ADD CONSTRAINT [R_58] FOREIGN KEY ([Cd_Bairro]) REFERENCES [Bairro]([Cd_Bairro])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Endereco]
	ADD CONSTRAINT [R_63] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Endereco]
	ADD CONSTRAINT [R_64] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Municipio]
	ADD CONSTRAINT [R_62] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [NotaFiscal]
	ADD CONSTRAINT [R_26] FOREIGN KEY ([Cd_PJ]) REFERENCES [Pessoa_Juridica]([Cd_PJ])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [NotaFiscal]
	ADD CONSTRAINT [R_74] FOREIGN KEY ([Cd_Transportadora]) REFERENCES [Transportadora]([Cd_Transportadora])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [NotaFiscal]
	ADD CONSTRAINT [R_75] FOREIGN KEY ([Cd_Pessoa]) REFERENCES [Pessoa]([Cd_Pessoa])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Pessoa]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([Cd_Endereco]) REFERENCES [Endereco]([Cd_Endereco])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Pessoa_Fisica]
	ADD CONSTRAINT [R_71] FOREIGN KEY ([Cd_Pessoa]) REFERENCES [Pessoa]([Cd_Pessoa])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Pessoa_Juridica]
	ADD CONSTRAINT [R_70] FOREIGN KEY ([Cd_Pessoa]) REFERENCES [Pessoa]([Cd_Pessoa])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transportadora]
	ADD CONSTRAINT [R_30] FOREIGN KEY ([Cd_PJ]) REFERENCES [Pessoa_Juridica]([Cd_PJ])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Veiculo]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([Cd_Transportadora]) REFERENCES [Transportadora]([Cd_Transportadora])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Veiculo]
	ADD CONSTRAINT [R_73] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Bairro ON Bairro FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Bairro */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Bairro  Endereco on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023531", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_58", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bairro because Endereco exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Bairro on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM Bairro
          WHERE
            /* %JoinFKPK(Bairro,Municipio," = "," AND") */
            Bairro.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bairro because Municipio exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Bairro ON Bairro FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Bairro */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Bairro integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Bairro  Endereco on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00027714", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_58", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bairro because Endereco exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Bairro on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bairro because Municipio does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Compra ON Compra FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Compra */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NotaFiscal  Compra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000253ee", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_81", FK_COLUMNS="Cd_NF" */
    IF EXISTS (SELECT * FROM deleted,NotaFiscal
      WHERE
        /* %JoinFKPK(deleted,NotaFiscal," = "," AND") */
        deleted.Cd_NF = NotaFiscal.Cd_NF AND
        NOT EXISTS (
          SELECT * FROM Compra
          WHERE
            /* %JoinFKPK(Compra,NotaFiscal," = "," AND") */
            Compra.Cd_NF = NotaFiscal.Cd_NF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Compra because NotaFiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Produto  Compra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_46", FK_COLUMNS="Cd_Produto" */
    IF EXISTS (SELECT * FROM deleted,Produto
      WHERE
        /* %JoinFKPK(deleted,Produto," = "," AND") */
        deleted.Cd_Produto = Produto.Cd_Produto AND
        NOT EXISTS (
          SELECT * FROM Compra
          WHERE
            /* %JoinFKPK(Compra,Produto," = "," AND") */
            Compra.Cd_Produto = Produto.Cd_Produto
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Compra because Produto exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Compra ON Compra FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Compra */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Compra integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* NotaFiscal  Compra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002975f", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_81", FK_COLUMNS="Cd_NF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_NF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NotaFiscal
        WHERE
          /* %JoinFKPK(inserted,NotaFiscal) */
          inserted.Cd_NF = NotaFiscal.Cd_NF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Compra because NotaFiscal does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Produto  Compra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_46", FK_COLUMNS="Cd_Produto" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Produto)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Produto
        WHERE
          /* %JoinFKPK(inserted,Produto) */
          inserted.Cd_Produto = Produto.Cd_Produto
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Compra because Produto does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Duplicata ON Duplicata FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Duplicata */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NotaFiscal  Duplicata on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000140fb", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_43", FK_COLUMNS="Cd_NF" */
    IF EXISTS (SELECT * FROM deleted,NotaFiscal
      WHERE
        /* %JoinFKPK(deleted,NotaFiscal," = "," AND") */
        deleted.Cd_NF = NotaFiscal.Cd_NF AND
        NOT EXISTS (
          SELECT * FROM Duplicata
          WHERE
            /* %JoinFKPK(Duplicata,NotaFiscal," = "," AND") */
            Duplicata.Cd_NF = NotaFiscal.Cd_NF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Duplicata because NotaFiscal exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Duplicata ON Duplicata FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Duplicata */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Duplicata integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* NotaFiscal  Duplicata on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00015b02", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_43", FK_COLUMNS="Cd_NF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_NF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,NotaFiscal
        WHERE
          /* %JoinFKPK(inserted,NotaFiscal) */
          inserted.Cd_NF = NotaFiscal.Cd_NF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Duplicata because NotaFiscal does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Endereco ON Endereco FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Endereco */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Endereco  Pessoa on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00045345", PARENT_OWNER="", PARENT_TABLE="Endereco"
    CHILD_OWNER="", CHILD_TABLE="Pessoa"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="Cd_Endereco" */
    IF EXISTS (
      SELECT * FROM deleted,Pessoa
      WHERE
        /*  %JoinFKPK(Pessoa,deleted," = "," AND") */
        Pessoa.Cd_Endereco = deleted.Cd_Endereco
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Endereco because Pessoa exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Endereco on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_64", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Endereco
          WHERE
            /* %JoinFKPK(Endereco,UF," = "," AND") */
            Endereco.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereco because UF exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Endereco on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_63", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM Endereco
          WHERE
            /* %JoinFKPK(Endereco,Municipio," = "," AND") */
            Endereco.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereco because Municipio exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bairro  Endereco on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_58", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (SELECT * FROM deleted,Bairro
      WHERE
        /* %JoinFKPK(deleted,Bairro," = "," AND") */
        deleted.Cd_Bairro = Bairro.Cd_Bairro AND
        NOT EXISTS (
          SELECT * FROM Endereco
          WHERE
            /* %JoinFKPK(Endereco,Bairro," = "," AND") */
            Endereco.Cd_Bairro = Bairro.Cd_Bairro
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereco because Bairro exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Endereco ON Endereco FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Endereco */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Endereco integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Endereco  Pessoa on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004edca", PARENT_OWNER="", PARENT_TABLE="Endereco"
    CHILD_OWNER="", CHILD_TABLE="Pessoa"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="Cd_Endereco" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Endereco)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Pessoa
      WHERE
        /*  %JoinFKPK(Pessoa,deleted," = "," AND") */
        Pessoa.Cd_Endereco = deleted.Cd_Endereco
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Endereco because Pessoa exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Endereco on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_64", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereco because UF does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Endereco on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_63", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereco because Municipio does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bairro  Endereco on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_58", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bairro
        WHERE
          /* %JoinFKPK(inserted,Bairro) */
          inserted.Cd_Bairro = Bairro.Cd_Bairro
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereco because Bairro does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Municipio ON Municipio FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Municipio */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Municipio  Endereco on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00030a8a", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_63", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because Endereco exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Bairro on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because Bairro exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Municipio on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Municipio
          WHERE
            /* %JoinFKPK(Municipio,UF," = "," AND") */
            Municipio.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Municipio because UF exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Municipio ON Municipio FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Municipio */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Municipio integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Municipio  Endereco on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00035d35", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_63", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because Endereco exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Bairro on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because Bairro exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Municipio on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Municipio because UF does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_NotaFiscal ON NotaFiscal FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on NotaFiscal */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* NotaFiscal  Compra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00059df3", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_81", FK_COLUMNS="Cd_NF" */
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_NF = deleted.Cd_NF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NotaFiscal because Compra exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* NotaFiscal  Duplicata on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_43", FK_COLUMNS="Cd_NF" */
    IF EXISTS (
      SELECT * FROM deleted,Duplicata
      WHERE
        /*  %JoinFKPK(Duplicata,deleted," = "," AND") */
        Duplicata.Cd_NF = deleted.Cd_NF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete NotaFiscal because Duplicata exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa  NotaFiscal on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_75", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (SELECT * FROM deleted,Pessoa
      WHERE
        /* %JoinFKPK(deleted,Pessoa," = "," AND") */
        deleted.Cd_Pessoa = Pessoa.Cd_Pessoa AND
        NOT EXISTS (
          SELECT * FROM NotaFiscal
          WHERE
            /* %JoinFKPK(NotaFiscal,Pessoa," = "," AND") */
            NotaFiscal.Cd_Pessoa = Pessoa.Cd_Pessoa
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NotaFiscal because Pessoa exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transportadora  NotaFiscal on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_74", FK_COLUMNS="Cd_Transportadora" */
    IF EXISTS (SELECT * FROM deleted,Transportadora
      WHERE
        /* %JoinFKPK(deleted,Transportadora," = "," AND") */
        deleted.Cd_Transportadora = Transportadora.Cd_Transportadora AND
        NOT EXISTS (
          SELECT * FROM NotaFiscal
          WHERE
            /* %JoinFKPK(NotaFiscal,Transportadora," = "," AND") */
            NotaFiscal.Cd_Transportadora = Transportadora.Cd_Transportadora
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NotaFiscal because Transportadora exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa_Juridica  NotaFiscal on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (SELECT * FROM deleted,Pessoa_Juridica
      WHERE
        /* %JoinFKPK(deleted,Pessoa_Juridica," = "," AND") */
        deleted.Cd_PJ = Pessoa_Juridica.Cd_PJ AND
        NOT EXISTS (
          SELECT * FROM NotaFiscal
          WHERE
            /* %JoinFKPK(NotaFiscal,Pessoa_Juridica," = "," AND") */
            NotaFiscal.Cd_PJ = Pessoa_Juridica.Cd_PJ
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last NotaFiscal because Pessoa_Juridica exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_NotaFiscal ON NotaFiscal FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on NotaFiscal */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_NF integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* NotaFiscal  Compra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000657aa", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_81", FK_COLUMNS="Cd_NF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_NF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_NF = deleted.Cd_NF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NotaFiscal because Compra exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* NotaFiscal  Duplicata on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="NotaFiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_43", FK_COLUMNS="Cd_NF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_NF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Duplicata
      WHERE
        /*  %JoinFKPK(Duplicata,deleted," = "," AND") */
        Duplicata.Cd_NF = deleted.Cd_NF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update NotaFiscal because Duplicata exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa  NotaFiscal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_75", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa
        WHERE
          /* %JoinFKPK(inserted,Pessoa) */
          inserted.Cd_Pessoa = Pessoa.Cd_Pessoa
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NotaFiscal because Pessoa does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transportadora  NotaFiscal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_74", FK_COLUMNS="Cd_Transportadora" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Transportadora)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Transportadora
        WHERE
          /* %JoinFKPK(inserted,Transportadora) */
          inserted.Cd_Transportadora = Transportadora.Cd_Transportadora
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Transportadora IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NotaFiscal because Transportadora does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa_Juridica  NotaFiscal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa_Juridica
        WHERE
          /* %JoinFKPK(inserted,Pessoa_Juridica) */
          inserted.Cd_PJ = Pessoa_Juridica.Cd_PJ
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update NotaFiscal because Pessoa_Juridica does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Pessoa ON Pessoa FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Pessoa */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Pessoa  NotaFiscal on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042c18", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_75", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa because NotaFiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa  Pessoa_Fisica on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Fisica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_71", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Fisica
      WHERE
        /*  %JoinFKPK(Pessoa_Fisica,deleted," = "," AND") */
        Pessoa_Fisica.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa because Pessoa_Fisica exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa  Pessoa_Juridica on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Juridica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_70", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Juridica
      WHERE
        /*  %JoinFKPK(Pessoa_Juridica,deleted," = "," AND") */
        Pessoa_Juridica.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa because Pessoa_Juridica exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Endereco  Pessoa on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endereco"
    CHILD_OWNER="", CHILD_TABLE="Pessoa"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="Cd_Endereco" */
    IF EXISTS (SELECT * FROM deleted,Endereco
      WHERE
        /* %JoinFKPK(deleted,Endereco," = "," AND") */
        deleted.Cd_Endereco = Endereco.Cd_Endereco AND
        NOT EXISTS (
          SELECT * FROM Pessoa
          WHERE
            /* %JoinFKPK(Pessoa,Endereco," = "," AND") */
            Pessoa.Cd_Endereco = Endereco.Cd_Endereco
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Pessoa because Endereco exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Pessoa ON Pessoa FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Pessoa */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Pessoa integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Pessoa  NotaFiscal on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00049425", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_75", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa because NotaFiscal exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa  Pessoa_Fisica on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Fisica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_71", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Fisica
      WHERE
        /*  %JoinFKPK(Pessoa_Fisica,deleted," = "," AND") */
        Pessoa_Fisica.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa because Pessoa_Fisica exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa  Pessoa_Juridica on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Juridica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_70", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Juridica
      WHERE
        /*  %JoinFKPK(Pessoa_Juridica,deleted," = "," AND") */
        Pessoa_Juridica.Cd_Pessoa = deleted.Cd_Pessoa
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa because Pessoa_Juridica exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Endereco  Pessoa on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endereco"
    CHILD_OWNER="", CHILD_TABLE="Pessoa"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_21", FK_COLUMNS="Cd_Endereco" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Endereco)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Endereco
        WHERE
          /* %JoinFKPK(inserted,Endereco) */
          inserted.Cd_Endereco = Endereco.Cd_Endereco
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Pessoa because Endereco does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Pessoa_Fisica ON Pessoa_Fisica FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Pessoa_Fisica */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Pessoa  Pessoa_Fisica on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014c29", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Fisica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_71", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (SELECT * FROM deleted,Pessoa
      WHERE
        /* %JoinFKPK(deleted,Pessoa," = "," AND") */
        deleted.Cd_Pessoa = Pessoa.Cd_Pessoa AND
        NOT EXISTS (
          SELECT * FROM Pessoa_Fisica
          WHERE
            /* %JoinFKPK(Pessoa_Fisica,Pessoa," = "," AND") */
            Pessoa_Fisica.Cd_Pessoa = Pessoa.Cd_Pessoa
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Pessoa_Fisica because Pessoa exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Pessoa_Fisica ON Pessoa_Fisica FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Pessoa_Fisica */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_PF integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Pessoa  Pessoa_Fisica on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000169e5", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Fisica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_71", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa
        WHERE
          /* %JoinFKPK(inserted,Pessoa) */
          inserted.Cd_Pessoa = Pessoa.Cd_Pessoa
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Pessoa_Fisica because Pessoa does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Pessoa_Juridica ON Pessoa_Juridica FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Pessoa_Juridica */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Pessoa_Juridica  Transportadora on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00034752", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="Transportadora"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_30", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (
      SELECT * FROM deleted,Transportadora
      WHERE
        /*  %JoinFKPK(Transportadora,deleted," = "," AND") */
        Transportadora.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa_Juridica because Transportadora exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa_Juridica  NotaFiscal on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa_Juridica because NotaFiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa  Pessoa_Juridica on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Juridica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_70", FK_COLUMNS="Cd_Pessoa" */
    IF EXISTS (SELECT * FROM deleted,Pessoa
      WHERE
        /* %JoinFKPK(deleted,Pessoa," = "," AND") */
        deleted.Cd_Pessoa = Pessoa.Cd_Pessoa AND
        NOT EXISTS (
          SELECT * FROM Pessoa_Juridica
          WHERE
            /* %JoinFKPK(Pessoa_Juridica,Pessoa," = "," AND") */
            Pessoa_Juridica.Cd_Pessoa = Pessoa.Cd_Pessoa
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Pessoa_Juridica because Pessoa exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Pessoa_Juridica ON Pessoa_Juridica FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Pessoa_Juridica */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_PJ integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Pessoa_Juridica  Transportadora on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00038417", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="Transportadora"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_30", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Transportadora
      WHERE
        /*  %JoinFKPK(Transportadora,deleted," = "," AND") */
        Transportadora.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa_Juridica because Transportadora exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa_Juridica  NotaFiscal on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_26", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa_Juridica because NotaFiscal exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa  Pessoa_Juridica on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Juridica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_70", FK_COLUMNS="Cd_Pessoa" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Pessoa)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa
        WHERE
          /* %JoinFKPK(inserted,Pessoa) */
          inserted.Cd_Pessoa = Pessoa.Cd_Pessoa
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Pessoa_Juridica because Pessoa does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Produto ON Produto FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Produto */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Produto  Compra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010bec", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_46", FK_COLUMNS="Cd_Produto" */
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Produto = deleted.Cd_Produto
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Produto because Compra exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Produto ON Produto FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Produto */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Produto integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Produto  Compra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012bb0", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_46", FK_COLUMNS="Cd_Produto" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Produto)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Produto = deleted.Cd_Produto
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Produto because Compra exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Transportadora ON Transportadora FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Transportadora */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Transportadora  NotaFiscal on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00036754", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_74", FK_COLUMNS="Cd_Transportadora" */
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_Transportadora = deleted.Cd_Transportadora
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Transportadora because NotaFiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transportadora  Veiculo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transportadora" */
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Transportadora = deleted.Cd_Transportadora
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Transportadora because Veiculo exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa_Juridica  Transportadora on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="Transportadora"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_30", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (SELECT * FROM deleted,Pessoa_Juridica
      WHERE
        /* %JoinFKPK(deleted,Pessoa_Juridica," = "," AND") */
        deleted.Cd_PJ = Pessoa_Juridica.Cd_PJ AND
        NOT EXISTS (
          SELECT * FROM Transportadora
          WHERE
            /* %JoinFKPK(Transportadora,Pessoa_Juridica," = "," AND") */
            Transportadora.Cd_PJ = Pessoa_Juridica.Cd_PJ
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Transportadora because Pessoa_Juridica exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Transportadora ON Transportadora FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Transportadora */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Transportadora integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Transportadora  NotaFiscal on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003a9d0", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="NotaFiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_74", FK_COLUMNS="Cd_Transportadora" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Transportadora)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,NotaFiscal
      WHERE
        /*  %JoinFKPK(NotaFiscal,deleted," = "," AND") */
        NotaFiscal.Cd_Transportadora = deleted.Cd_Transportadora
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Transportadora because NotaFiscal exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transportadora  Veiculo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transportadora" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Transportadora)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Transportadora = deleted.Cd_Transportadora
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Transportadora because Veiculo exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa_Juridica  Transportadora on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Juridica"
    CHILD_OWNER="", CHILD_TABLE="Transportadora"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_30", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa_Juridica
        WHERE
          /* %JoinFKPK(inserted,Pessoa_Juridica) */
          inserted.Cd_PJ = Pessoa_Juridica.Cd_PJ
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Transportadora because Pessoa_Juridica does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_UF ON UF FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on UF */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* UF  Veiculo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002a21a", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_73", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Veiculo exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Endereco on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_64", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Endereco exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Municipio on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Municipio
      WHERE
        /*  %JoinFKPK(Municipio,deleted," = "," AND") */
        Municipio.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Municipio exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_UF ON UF FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on UF */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_UF integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* UF  Veiculo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00030192", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_73", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Veiculo exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Endereco on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereco"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_64", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereco
      WHERE
        /*  %JoinFKPK(Endereco,deleted," = "," AND") */
        Endereco.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Endereco exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Municipio on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Municipio
      WHERE
        /*  %JoinFKPK(Municipio,deleted," = "," AND") */
        Municipio.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Municipio exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Veiculo ON Veiculo FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Veiculo */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* UF  Veiculo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000272bf", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_73", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Veiculo
          WHERE
            /* %JoinFKPK(Veiculo,UF," = "," AND") */
            Veiculo.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Veiculo because UF exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transportadora  Veiculo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transportadora" */
    IF EXISTS (SELECT * FROM deleted,Transportadora
      WHERE
        /* %JoinFKPK(deleted,Transportadora," = "," AND") */
        deleted.Cd_Transportadora = Transportadora.Cd_Transportadora AND
        NOT EXISTS (
          SELECT * FROM Veiculo
          WHERE
            /* %JoinFKPK(Veiculo,Transportadora," = "," AND") */
            Veiculo.Cd_Transportadora = Transportadora.Cd_Transportadora
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Veiculo because Transportadora exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Veiculo ON Veiculo FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Veiculo */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Veiculo integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* UF  Veiculo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ba7c", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_73", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Veiculo because UF does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transportadora  Veiculo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transportadora"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transportadora" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Transportadora)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Transportadora
        WHERE
          /* %JoinFKPK(inserted,Transportadora) */
          inserted.Cd_Transportadora = Transportadora.Cd_Transportadora
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */

    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Veiculo because Transportadora does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


