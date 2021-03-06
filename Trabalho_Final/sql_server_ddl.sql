USE [CURSODB10]
GO
/****** Object:  Table [dbo].[Bairro]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bairro](
	[Cd_Bairro] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nm_Bairro] [varchar](50) NOT NULL,
	[Cd_Municipio] [int] NOT NULL,
 CONSTRAINT [XPKBairro] PRIMARY KEY CLUSTERED 
(
	[Cd_Bairro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Cd_Compra] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Qt_Quantidade] [int] NOT NULL,
	[Cd_NF] [int] NOT NULL,
	[Cd_Produto] [int] NOT NULL,
 CONSTRAINT [XPKCompra] PRIMARY KEY CLUSTERED 
(
	[Cd_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duplicata]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duplicata](
	[Cd_Duplicata] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Dt_Vencimento] [datetime] NOT NULL,
	[Vl_Valor] [int] NOT NULL,
	[Cd_NF] [int] NOT NULL,
	[Dt_Pagamento] [datetime] NULL,
	[Vl_Pagamento] [int] NULL,
 CONSTRAINT [XPKDuplicata] PRIMARY KEY CLUSTERED 
(
	[Cd_Duplicata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[Cd_Endereco] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nm_Complemento] [varchar](50) NULL,
	[Nu_Numero] [varchar](20) NOT NULL,
	[Nm_Endereco] [varchar](200) NOT NULL,
	[Cd_Bairro] [int] NOT NULL,
	[Cd_Municipio] [int] NOT NULL,
	[Cd_UF] [int] NOT NULL,
	[Nu_CEP] [varchar](20) NOT NULL,
 CONSTRAINT [XPKEndereco] PRIMARY KEY CLUSTERED 
(
	[Cd_Endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[Cd_Municipio] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nm_Municipio] [varchar](50) NOT NULL,
	[Cd_UF] [int] NOT NULL,
 CONSTRAINT [XPKMunicipio] PRIMARY KEY CLUSTERED 
(
	[Cd_Municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotaFiscal]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotaFiscal](
	[Dt_Emissao] [datetime] NOT NULL,
	[Cd_NF] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_NumeroSerie] [int] NOT NULL,
	[Ds_Informacao] [varchar](20) NULL,
	[Cd_PJ] [int] NOT NULL,
	[Tp_EntradaSaida] [bit] NOT NULL,
	[Dt_EntradaSaida] [datetime] NOT NULL,
	[Tp_FreteConta] [bit] NULL,
	[Cd_Transportadora] [int] NULL,
	[Cd_CFOP] [char](4) NOT NULL,
	[Nu_Via] [int] NOT NULL,
	[Dt_LimiteEmissao] [datetime] NOT NULL,
	[Cd_Pessoa] [int] NOT NULL,
 CONSTRAINT [XPKNotaFiscal] PRIMARY KEY CLUSTERED 
(
	[Cd_NF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[Nm_Pessoa] [varchar](50) NOT NULL,
	[Cd_Pessoa] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_Endereco] [int] NOT NULL,
	[Nu_Telefone] [varchar](20) NULL,
 CONSTRAINT [XPKPessoa] PRIMARY KEY CLUSTERED 
(
	[Cd_Pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa_Fisica]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa_Fisica](
	[Cd_PF] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_CPF] [char](11) NOT NULL,
	[Cd_Pessoa] [int] NOT NULL,
 CONSTRAINT [XPKPessoa_Fisica] PRIMARY KEY CLUSTERED 
(
	[Cd_PF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa_Juridica]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa_Juridica](
	[Cd_CNPJ] [varchar](20) NOT NULL,
	[Cd_InscEstadual] [varchar](20) NOT NULL,
	[Cd_InstTribEst] [varchar](20) NOT NULL,
	[Cd_PJ] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_Pessoa] [int] NOT NULL,
 CONSTRAINT [XPKPessoa_Juridica] PRIMARY KEY CLUSTERED 
(
	[Cd_PJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Ds_Marca] [varchar](20) NULL,
	[Ds_Descricao] [varchar](20) NULL,
	[Ds_SituacaoTrib] [varchar](20) NULL,
	[Vl_Unitario] [money] NOT NULL,
	[In_ICMS] [money] NOT NULL,
	[In_IPI] [money] NOT NULL,
	[Vl_Seguro] [money] NULL,
	[Cd_Produto] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_SituacaoTrib] [int] NOT NULL,
	[Vl_Total] [money] NOT NULL,
 CONSTRAINT [XPKProduto] PRIMARY KEY CLUSTERED 
(
	[Cd_Produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportadora]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportadora](
	[Cd_Transportadora] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Vl_Frete] [int] NOT NULL,
	[Cd_PJ] [int] NOT NULL,
 CONSTRAINT [XPKTransportadora] PRIMARY KEY CLUSTERED 
(
	[Cd_Transportadora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UF]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UF](
	[Cd_UF] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Nm_Estado] [varchar](50) NULL,
	[Sg_UF] [char](2) NULL,
 CONSTRAINT [XPKUF] PRIMARY KEY CLUSTERED 
(
	[Cd_UF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veiculo]    Script Date: 26/05/2021 00:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veiculo](
	[Cd_Veiculo] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Cd_Placa] [varchar](7) NOT NULL,
	[Cd_Transportadora] [int] NOT NULL,
	[Nm_Especie] [varchar](18) NOT NULL,
	[Nm_Marca] [varchar](18) NOT NULL,
	[Cd_UF] [int] NOT NULL,
 CONSTRAINT [XPKVeiculo] PRIMARY KEY CLUSTERED 
(
	[Cd_Veiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bairro] ON 

INSERT [dbo].[Bairro] ([Cd_Bairro], [Nm_Bairro], [Cd_Municipio]) VALUES (1, N'Jardim America', 1)
INSERT [dbo].[Bairro] ([Cd_Bairro], [Nm_Bairro], [Cd_Municipio]) VALUES (2, N'Laranjeiras', 2)
INSERT [dbo].[Bairro] ([Cd_Bairro], [Nm_Bairro], [Cd_Municipio]) VALUES (3, N'Sagrada Familia', 3)
INSERT [dbo].[Bairro] ([Cd_Bairro], [Nm_Bairro], [Cd_Municipio]) VALUES (4, N'Nazareth', 4)
INSERT [dbo].[Bairro] ([Cd_Bairro], [Nm_Bairro], [Cd_Municipio]) VALUES (5, N'Ayrton Senna', 5)
SET IDENTITY_INSERT [dbo].[Bairro] OFF
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([Cd_Compra], [Qt_Quantidade], [Cd_NF], [Cd_Produto]) VALUES (1, 2, 1, 1)
INSERT [dbo].[Compra] ([Cd_Compra], [Qt_Quantidade], [Cd_NF], [Cd_Produto]) VALUES (2, 4, 2, 2)
INSERT [dbo].[Compra] ([Cd_Compra], [Qt_Quantidade], [Cd_NF], [Cd_Produto]) VALUES (3, 10, 3, 3)
INSERT [dbo].[Compra] ([Cd_Compra], [Qt_Quantidade], [Cd_NF], [Cd_Produto]) VALUES (4, 50, 4, 4)
INSERT [dbo].[Compra] ([Cd_Compra], [Qt_Quantidade], [Cd_NF], [Cd_Produto]) VALUES (5, 2000, 5, 5)
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Duplicata] ON 

INSERT [dbo].[Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Cd_NF], [Dt_Pagamento], [Vl_Pagamento]) VALUES (1, CAST(N'2021-05-24T00:00:00.000' AS DateTime), 30, 1, CAST(N'2021-05-24T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Cd_NF], [Dt_Pagamento], [Vl_Pagamento]) VALUES (2, CAST(N'2021-04-25T00:00:00.000' AS DateTime), 40, 2, CAST(N'2021-04-24T00:00:00.000' AS DateTime), 40)
INSERT [dbo].[Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Cd_NF], [Dt_Pagamento], [Vl_Pagamento]) VALUES (3, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 127, 3, CAST(N'2021-03-01T00:00:00.000' AS DateTime), 127)
INSERT [dbo].[Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Cd_NF], [Dt_Pagamento], [Vl_Pagamento]) VALUES (4, CAST(N'2020-04-28T00:00:00.000' AS DateTime), 233, 4, CAST(N'2020-04-16T00:00:00.000' AS DateTime), 233)
INSERT [dbo].[Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Cd_NF], [Dt_Pagamento], [Vl_Pagamento]) VALUES (5, CAST(N'1992-02-07T00:00:00.000' AS DateTime), 2222, 5, CAST(N'1992-02-01T00:00:00.000' AS DateTime), 2222)
SET IDENTITY_INSERT [dbo].[Duplicata] OFF
GO
SET IDENTITY_INSERT [dbo].[Endereco] ON 

INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (1, N'Bloco 3 apt 302', N'121', N'Rua Jose Malaquias Jr', 1, 1, 1, N'21010030')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (2, N'apt 303', N'203', N'Rua Bruno Dantas', 2, 2, 2, N'21010030')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (3, N'apt 201.5', N'212', N'Rua Carlin', 3, 3, 3, N'31010030')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (4, N'Casa 5', N'512', N'Rua Rafael Martins', 4, 4, 4, N'28010030')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (5, N'Mansao 2', N'231', N'Avenida do Surf', 5, 5, 5, N'62010030')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (6, N'apt 101 Frente', N'21', N'Rua Demostenes', 3, 3, 3, N'23489020')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (7, N'ap 202', N'50', N'Rua euclides da cunha', 4, 4, 4, N'34590220')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (8, N'1231', N'39', N'Rua josue marques', 2, 2, 2, N'55598112')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (9, N'4345', N'1289', N'Rua pintor da silva', 2, 2, 2, N'98954602')
INSERT [dbo].[Endereco] ([Cd_Endereco], [Nm_Complemento], [Nu_Numero], [Nm_Endereco], [Cd_Bairro], [Cd_Municipio], [Cd_UF], [Nu_CEP]) VALUES (10, N'541', N'1', N'Rua Padre belo', 5, 5, 5, N'21245644')
SET IDENTITY_INSERT [dbo].[Endereco] OFF
GO
SET IDENTITY_INSERT [dbo].[Municipio] ON 

INSERT [dbo].[Municipio] ([Cd_Municipio], [Nm_Municipio], [Cd_UF]) VALUES (1, N'Sao Paulo', 1)
INSERT [dbo].[Municipio] ([Cd_Municipio], [Nm_Municipio], [Cd_UF]) VALUES (2, N'Rio de Janeiro', 2)
INSERT [dbo].[Municipio] ([Cd_Municipio], [Nm_Municipio], [Cd_UF]) VALUES (3, N'Belo Horizonte', 3)
INSERT [dbo].[Municipio] ([Cd_Municipio], [Nm_Municipio], [Cd_UF]) VALUES (4, N'Vitoria', 4)
INSERT [dbo].[Municipio] ([Cd_Municipio], [Nm_Municipio], [Cd_UF]) VALUES (5, N'Rio Branco', 5)
SET IDENTITY_INSERT [dbo].[Municipio] OFF
GO
SET IDENTITY_INSERT [dbo].[NotaFiscal] ON 

INSERT [dbo].[NotaFiscal] ([Dt_Emissao], [Cd_NF], [Cd_NumeroSerie], [Ds_Informacao], [Cd_PJ], [Tp_EntradaSaida], [Dt_EntradaSaida], [Tp_FreteConta], [Cd_Transportadora], [Cd_CFOP], [Nu_Via], [Dt_LimiteEmissao], [Cd_Pessoa]) VALUES (CAST(N'2020-01-23T00:00:00.000' AS DateTime), 1, 969696, N'Doacao - Josias ', 1, 1, CAST(N'2020-01-23T00:00:00.000' AS DateTime), 1, 1, N'1100', 1, CAST(N'2020-01-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[NotaFiscal] ([Dt_Emissao], [Cd_NF], [Cd_NumeroSerie], [Ds_Informacao], [Cd_PJ], [Tp_EntradaSaida], [Dt_EntradaSaida], [Tp_FreteConta], [Cd_Transportadora], [Cd_CFOP], [Nu_Via], [Dt_LimiteEmissao], [Cd_Pessoa]) VALUES (CAST(N'2020-01-23T00:00:00.000' AS DateTime), 2, 404512, N'Aluguel - Parcela', 2, 0, CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0, 2, N'5432', 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[NotaFiscal] ([Dt_Emissao], [Cd_NF], [Cd_NumeroSerie], [Ds_Informacao], [Cd_PJ], [Tp_EntradaSaida], [Dt_EntradaSaida], [Tp_FreteConta], [Cd_Transportadora], [Cd_CFOP], [Nu_Via], [Dt_LimiteEmissao], [Cd_Pessoa]) VALUES (CAST(N'2020-12-31T00:00:00.000' AS DateTime), 3, 393244, N'Sem Descricao', 3, 1, CAST(N'1999-02-26T00:00:00.000' AS DateTime), 0, 3, N'6666', 3, CAST(N'1999-04-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[NotaFiscal] ([Dt_Emissao], [Cd_NF], [Cd_NumeroSerie], [Ds_Informacao], [Cd_PJ], [Tp_EntradaSaida], [Dt_EntradaSaida], [Tp_FreteConta], [Cd_Transportadora], [Cd_CFOP], [Nu_Via], [Dt_LimiteEmissao], [Cd_Pessoa]) VALUES (CAST(N'2005-10-01T00:00:00.000' AS DateTime), 4, 309876, N'Lorem Ipsum', 4, 0, CAST(N'2005-01-10T00:00:00.000' AS DateTime), 1, 4, N'7878', 2, CAST(N'2005-02-10T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[NotaFiscal] ([Dt_Emissao], [Cd_NF], [Cd_NumeroSerie], [Ds_Informacao], [Cd_PJ], [Tp_EntradaSaida], [Dt_EntradaSaida], [Tp_FreteConta], [Cd_Transportadora], [Cd_CFOP], [Nu_Via], [Dt_LimiteEmissao], [Cd_Pessoa]) VALUES (CAST(N'2009-05-22T00:00:00.000' AS DateTime), 5, 123612, N'melhor venda', 5, 1, CAST(N'2009-05-22T00:00:00.000' AS DateTime), 0, 5, N'3476', 1, CAST(N'2009-07-22T00:00:00.000' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[NotaFiscal] OFF
GO
SET IDENTITY_INSERT [dbo].[Pessoa] ON 

INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Carla Raimunda', 1, 1, N'(11) 2925-4627')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Giovanna Regina ', 2, 2, N'(21) 99386-5445')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Marli Heloise ', 3, 3, N'(31) 92034-3947')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Marli Leticia Elo', 4, 4, N'(27) 95745-3123')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Luiz Joao Anthony', 5, 5, N'(68) 94729-2222')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Fopinha popega LTDA', 6, 6, N'(18) 94669-2123')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Le cremose', 7, 7, N'(55) 94239-0000)')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Acoalhos do seu ze', 8, 8, N'(44) 95219-2425')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Catapimbas LTDA', 9, 9, N'(38) 92239-3996')
INSERT [dbo].[Pessoa] ([Nm_Pessoa], [Cd_Pessoa], [Cd_Endereco], [Nu_Telefone]) VALUES (N'Funeraria Jesus te ama', 10, 10, N'(22) 99876-2557')
SET IDENTITY_INSERT [dbo].[Pessoa] OFF
GO
SET IDENTITY_INSERT [dbo].[Pessoa_Fisica] ON 

INSERT [dbo].[Pessoa_Fisica] ([Cd_PF], [Cd_CPF], [Cd_Pessoa]) VALUES (1, N'13425748600', 1)
INSERT [dbo].[Pessoa_Fisica] ([Cd_PF], [Cd_CPF], [Cd_Pessoa]) VALUES (2, N'13543920830', 2)
INSERT [dbo].[Pessoa_Fisica] ([Cd_PF], [Cd_CPF], [Cd_Pessoa]) VALUES (3, N'12344684702', 3)
INSERT [dbo].[Pessoa_Fisica] ([Cd_PF], [Cd_CPF], [Cd_Pessoa]) VALUES (4, N'29238475069', 4)
INSERT [dbo].[Pessoa_Fisica] ([Cd_PF], [Cd_CPF], [Cd_Pessoa]) VALUES (5, N'29384562910', 5)
SET IDENTITY_INSERT [dbo].[Pessoa_Fisica] OFF
GO
SET IDENTITY_INSERT [dbo].[Pessoa_Juridica] ON 

INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'64149521000198', N'123089743', N'547619047', 1, 7)
INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'36984388000150', N'123083443', N'125532023', 2, 8)
INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'78478833000150', N'547897430', N'123083443', 3, 9)
INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'97832548000130', N'125532023', N'123089743', 4, 10)
INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'54678936513402', N'547897430', N'547897430', 5, 9)
INSERT [dbo].[Pessoa_Juridica] ([Cd_CNPJ], [Cd_InscEstadual], [Cd_InstTribEst], [Cd_PJ], [Cd_Pessoa]) VALUES (N'24572613000161', N'547619047', N'547034798', 6, 6)
SET IDENTITY_INSERT [dbo].[Pessoa_Juridica] OFF
GO
SET IDENTITY_INSERT [dbo].[Produto] ON 

INSERT [dbo].[Produto] ([Ds_Marca], [Ds_Descricao], [Ds_SituacaoTrib], [Vl_Unitario], [In_ICMS], [In_IPI], [Vl_Seguro], [Cd_Produto], [Cd_SituacaoTrib], [Vl_Total]) VALUES (N'Saihomi', N'Celular M200', N'Internacional', 1000.0000, 0.0000, 0.0000, 0.0000, 1, 1, 1000.0000)
INSERT [dbo].[Produto] ([Ds_Marca], [Ds_Descricao], [Ds_SituacaoTrib], [Vl_Unitario], [In_ICMS], [In_IPI], [Vl_Seguro], [Cd_Produto], [Cd_SituacaoTrib], [Vl_Total]) VALUES (N'Semsong', N'Televisao 42', N'Internacional', 200.0000, 0.0000, 0.0000, 0.0000, 2, 1, 200.0000)
INSERT [dbo].[Produto] ([Ds_Marca], [Ds_Descricao], [Ds_SituacaoTrib], [Vl_Unitario], [In_ICMS], [In_IPI], [Vl_Seguro], [Cd_Produto], [Cd_SituacaoTrib], [Vl_Total]) VALUES (N'AiperEcs', N'Teclado Aloha fps', N'Internacional', 300.0000, 0.0000, 0.0000, 0.0000, 3, 1, 300.0000)
INSERT [dbo].[Produto] ([Ds_Marca], [Ds_Descricao], [Ds_SituacaoTrib], [Vl_Unitario], [In_ICMS], [In_IPI], [Vl_Seguro], [Cd_Produto], [Cd_SituacaoTrib], [Vl_Total]) VALUES (N'LongeTeq', N'Mouse G777 gamer', N'Internacional', 450.0000, 0.0000, 0.0000, 0.0000, 4, 1, 450.0000)
INSERT [dbo].[Produto] ([Ds_Marca], [Ds_Descricao], [Ds_SituacaoTrib], [Vl_Unitario], [In_ICMS], [In_IPI], [Vl_Seguro], [Cd_Produto], [Cd_SituacaoTrib], [Vl_Total]) VALUES (N'Abductedragon', N'Microfone Gamer', N'Internacional', 666.0000, 0.0000, 0.0000, 0.0000, 5, 1, 666.0000)
SET IDENTITY_INSERT [dbo].[Produto] OFF
GO
SET IDENTITY_INSERT [dbo].[Transportadora] ON 

INSERT [dbo].[Transportadora] ([Cd_Transportadora], [Vl_Frete], [Cd_PJ]) VALUES (1, 30, 1)
INSERT [dbo].[Transportadora] ([Cd_Transportadora], [Vl_Frete], [Cd_PJ]) VALUES (2, 100, 2)
INSERT [dbo].[Transportadora] ([Cd_Transportadora], [Vl_Frete], [Cd_PJ]) VALUES (3, 60, 3)
INSERT [dbo].[Transportadora] ([Cd_Transportadora], [Vl_Frete], [Cd_PJ]) VALUES (4, 20, 4)
INSERT [dbo].[Transportadora] ([Cd_Transportadora], [Vl_Frete], [Cd_PJ]) VALUES (5, 35, 5)
SET IDENTITY_INSERT [dbo].[Transportadora] OFF
GO
SET IDENTITY_INSERT [dbo].[UF] ON 

INSERT [dbo].[UF] ([Cd_UF], [Nm_Estado], [Sg_UF]) VALUES (1, N'Sao Paulo', N'SP')
INSERT [dbo].[UF] ([Cd_UF], [Nm_Estado], [Sg_UF]) VALUES (2, N'Rio de Janeiro', N'RJ')
INSERT [dbo].[UF] ([Cd_UF], [Nm_Estado], [Sg_UF]) VALUES (3, N'Minas Gerais ', N'MG')
INSERT [dbo].[UF] ([Cd_UF], [Nm_Estado], [Sg_UF]) VALUES (4, N'Espirito Santo', N'ES')
INSERT [dbo].[UF] ([Cd_UF], [Nm_Estado], [Sg_UF]) VALUES (5, N'Acre', N'AC')
SET IDENTITY_INSERT [dbo].[UF] OFF
GO
SET IDENTITY_INSERT [dbo].[Veiculo] ON 

INSERT [dbo].[Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transportadora], [Nm_Especie], [Nm_Marca], [Cd_UF]) VALUES (1, N'HPC5008', 1, N'Carga', N'Volkswagen', 1)
INSERT [dbo].[Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transportadora], [Nm_Especie], [Nm_Marca], [Cd_UF]) VALUES (2, N'HPW6558', 2, N'Carga', N'Chevrolet', 2)
INSERT [dbo].[Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transportadora], [Nm_Especie], [Nm_Marca], [Cd_UF]) VALUES (3, N'KAV4455', 3, N'Misto', N'GMC', 3)
INSERT [dbo].[Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transportadora], [Nm_Especie], [Nm_Marca], [Cd_UF]) VALUES (4, N'NEF0936', 4, N'Misto', N'Mercedes', 4)
INSERT [dbo].[Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transportadora], [Nm_Especie], [Nm_Marca], [Cd_UF]) VALUES (5, N'MUP5688', 5, N'Carga', N'Mercedes', 5)
SET IDENTITY_INSERT [dbo].[Veiculo] OFF
GO
ALTER TABLE [dbo].[Bairro]  WITH CHECK ADD  CONSTRAINT [R_61] FOREIGN KEY([Cd_Municipio])
REFERENCES [dbo].[Municipio] ([Cd_Municipio])
GO
ALTER TABLE [dbo].[Bairro] CHECK CONSTRAINT [R_61]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [R_46] FOREIGN KEY([Cd_Produto])
REFERENCES [dbo].[Produto] ([Cd_Produto])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [R_46]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [R_81] FOREIGN KEY([Cd_NF])
REFERENCES [dbo].[NotaFiscal] ([Cd_NF])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [R_81]
GO
ALTER TABLE [dbo].[Duplicata]  WITH CHECK ADD  CONSTRAINT [R_43] FOREIGN KEY([Cd_NF])
REFERENCES [dbo].[NotaFiscal] ([Cd_NF])
GO
ALTER TABLE [dbo].[Duplicata] CHECK CONSTRAINT [R_43]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [R_58] FOREIGN KEY([Cd_Bairro])
REFERENCES [dbo].[Bairro] ([Cd_Bairro])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [R_58]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [R_63] FOREIGN KEY([Cd_Municipio])
REFERENCES [dbo].[Municipio] ([Cd_Municipio])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [R_63]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [R_64] FOREIGN KEY([Cd_UF])
REFERENCES [dbo].[UF] ([Cd_UF])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [R_64]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [R_62] FOREIGN KEY([Cd_UF])
REFERENCES [dbo].[UF] ([Cd_UF])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [R_62]
GO
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([Cd_PJ])
REFERENCES [dbo].[Pessoa_Juridica] ([Cd_PJ])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [R_26]
GO
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [R_74] FOREIGN KEY([Cd_Transportadora])
REFERENCES [dbo].[Transportadora] ([Cd_Transportadora])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [R_74]
GO
ALTER TABLE [dbo].[NotaFiscal]  WITH CHECK ADD  CONSTRAINT [R_75] FOREIGN KEY([Cd_Pessoa])
REFERENCES [dbo].[Pessoa] ([Cd_Pessoa])
GO
ALTER TABLE [dbo].[NotaFiscal] CHECK CONSTRAINT [R_75]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([Cd_Endereco])
REFERENCES [dbo].[Endereco] ([Cd_Endereco])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[Pessoa_Fisica]  WITH CHECK ADD  CONSTRAINT [R_71] FOREIGN KEY([Cd_Pessoa])
REFERENCES [dbo].[Pessoa] ([Cd_Pessoa])
GO
ALTER TABLE [dbo].[Pessoa_Fisica] CHECK CONSTRAINT [R_71]
GO
ALTER TABLE [dbo].[Pessoa_Juridica]  WITH CHECK ADD  CONSTRAINT [R_70] FOREIGN KEY([Cd_Pessoa])
REFERENCES [dbo].[Pessoa] ([Cd_Pessoa])
GO
ALTER TABLE [dbo].[Pessoa_Juridica] CHECK CONSTRAINT [R_70]
GO
ALTER TABLE [dbo].[Transportadora]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([Cd_PJ])
REFERENCES [dbo].[Pessoa_Juridica] ([Cd_PJ])
GO
ALTER TABLE [dbo].[Transportadora] CHECK CONSTRAINT [R_30]
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD  CONSTRAINT [R_40] FOREIGN KEY([Cd_Transportadora])
REFERENCES [dbo].[Transportadora] ([Cd_Transportadora])
GO
ALTER TABLE [dbo].[Veiculo] CHECK CONSTRAINT [R_40]
GO
ALTER TABLE [dbo].[Veiculo]  WITH CHECK ADD  CONSTRAINT [R_73] FOREIGN KEY([Cd_UF])
REFERENCES [dbo].[UF] ([Cd_UF])
GO
ALTER TABLE [dbo].[Veiculo] CHECK CONSTRAINT [R_73]
GO
