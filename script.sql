--Teste
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PedidoVenda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Modificacao] [datetime] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[VendedorId] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[DataLiberacao] [datetime] NULL,
	[TotalProdutos] [money] NOT NULL,
	[QuantidadeItens] [int] NOT NULL,
	[ValorDesconto] [money] NOT NULL,
	[ValorAcrescimo] [money] NOT NULL,
	[DataEntrega] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PedidoVendaItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PedidoVendaId] [int] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Modificacao] [datetime] NOT NULL,
	[ProdutoId] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [money] NOT NULL,
	[ValorDesconto] [money] NOT NULL,
	[ValorAcrescimo] [money] NOT NULL,
	[TipoPreco] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pessoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Modificacao] [datetime] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
	[Grupo] [varchar](30) NOT NULL,
	[DataNascimento] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Modificacao] [datetime] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[PrecoBase] [money] NOT NULL,
	[GrupoProduto] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [PedidoVenda] ON 

INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (1, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 21, 6, N'L', CAST(N'2018-10-11T00:00:00.000' AS DateTime), 120.0000, 4, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (2, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 22, 6, N'C', NULL, 300.8000, 2, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (3, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 23, 6, N'F', CAST(N'2018-02-18T00:00:00.000' AS DateTime), 51.2000, 2, 0.0000, 0.0000, CAST(N'2018-05-23T00:00:00.000' AS DateTime))
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (4, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 25, 6, N'A', NULL, 108.4000, 2, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (5, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 26, 13, N'C', NULL, 619.5000, 5, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (6, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 27, 24, N'L', CAST(N'2018-09-21T00:00:00.000' AS DateTime), 1826.6000, 8, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (7, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 28, 13, N'A', NULL, 2220.7000, 7, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (8, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 29, 24, N'C', NULL, 211.9900, 4, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (9, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 16, 51, N'L', CAST(N'2018-11-09T00:00:00.000' AS DateTime), 889.2000, 12, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (10, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 17, 51, N'L', CAST(N'2018-09-21T00:00:00.000' AS DateTime), 1545.8200, 15, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (11, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 18, 51, N'L', CAST(N'2018-10-27T00:00:00.000' AS DateTime), 4384.2000, 17, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (12, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 19, 51, N'C', NULL, 4103.5700, 18, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (13, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 20, 51, N'F', CAST(N'2018-02-26T00:00:00.000' AS DateTime), 2780.0000, 18, 0.0000, 0.0000, CAST(N'2018-05-21T00:00:00.000' AS DateTime))
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (14, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 21, 13, N'A', NULL, 533.5400, 15, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (15, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 22, 24, N'A', NULL, 596.4000, 20, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (16, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 23, 31, N'L', CAST(N'2018-10-26T00:00:00.000' AS DateTime), 1296.1200, 20, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (17, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 25, 31, N'C', NULL, 1042.8000, 11, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (18, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 26, 49, N'F', CAST(N'2018-05-11T00:00:00.000' AS DateTime), 4232.0000, 22, 0.0000, 0.0000, CAST(N'2018-07-31T00:00:00.000' AS DateTime))
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (19, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 40, 6, N'F', CAST(N'2018-04-23T00:00:00.000' AS DateTime), 1138.5200, 14, 0.0000, 0.0000, CAST(N'2018-05-06T00:00:00.000' AS DateTime))
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (20, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 41, 13, N'C', NULL, 48.6000, 9, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (21, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 42, 24, N'L', CAST(N'2018-10-11T00:00:00.000' AS DateTime), 174.6600, 5, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (22, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 43, 31, N'A', NULL, 231.8000, 9, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (23, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 44, 49, N'L', CAST(N'2018-10-13T00:00:00.000' AS DateTime), 3708.9000, 11, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (24, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 33, 51, N'L', CAST(N'2018-09-14T00:00:00.000' AS DateTime), 1202.7800, 15, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (25, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 34, 6, N'L', CAST(N'2018-08-30T00:00:00.000' AS DateTime), 3015.4000, 19, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (26, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 35, 6, N'C', NULL, 1111.0000, 12, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (27, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 36, 6, N'A', NULL, 1955.2000, 17, 0.0000, 0.0000, NULL)
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (28, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 37, 13, N'F', CAST(N'2018-06-09T00:00:00.000' AS DateTime), 441.3000, 10, 0.0000, 0.0000, CAST(N'2018-07-24T00:00:00.000' AS DateTime))
INSERT [PedidoVenda] ([Id], [Criacao], [Modificacao], [ClienteId], [VendedorId], [Status], [DataLiberacao], [TotalProdutos], [QuantidadeItens], [ValorDesconto], [ValorAcrescimo], [DataEntrega]) VALUES (29, CAST(N'2018-08-09T23:46:02.687' AS DateTime), CAST(N'2018-08-09T23:46:02.687' AS DateTime), 38, 24, N'A', NULL, 1705.8000, 12, 0.0000, 0.0000, NULL)
SET IDENTITY_INSERT [PedidoVenda] OFF
SET IDENTITY_INSERT [PedidoVendaItem] ON 

INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (269, 1, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 4, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (270, 2, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 2, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (271, 3, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 2, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (272, 4, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 2, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (273, 5, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 5, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (274, 6, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 6, 254.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (275, 7, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 7, 5, 433.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (276, 8, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 8, 1, 49.3900, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (277, 9, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 9, 6, 24.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (278, 10, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 10, 4, 87.3300, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (279, 11, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 11, 1, 231.8000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (280, 12, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 12, 8, 412.1000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (281, 13, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 13, 8, 234.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (282, 14, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 14, 2, 54.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (283, 15, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 2, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (284, 16, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 3, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (285, 17, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 1, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (286, 18, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 9, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (287, 19, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 6, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (288, 20, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 7, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (289, 21, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 7, 3, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (290, 22, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 8, 8, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (291, 23, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 9, 2, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (292, 24, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 10, 6, 87.3300, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (293, 25, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 11, 9, 231.8000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (294, 26, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 12, 2, 412.1000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (295, 27, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 13, 2, 234.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (296, 28, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 14, 3, 54.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (297, 29, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 6, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (298, 6, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 2, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (299, 7, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 2, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (300, 8, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 3, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (301, 9, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 6, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (302, 10, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 3, 254.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (303, 11, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 7, 7, 433.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (304, 12, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 8, 3, 49.3900, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (305, 13, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 9, 7, 24.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (306, 14, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 10, 2, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (307, 15, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 11, 7, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (308, 16, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 12, 9, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (309, 17, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 13, 6, 0.0000, 0.0000, 0.0000, N'B')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (310, 18, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 14, 5, 54.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (311, 12, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 5, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (312, 13, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 2, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (313, 14, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 5, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (314, 15, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 9, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (315, 16, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 4, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (316, 17, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 4, 254.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (317, 18, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 7, 8, 433.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (318, 19, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 8, 8, 49.3900, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (319, 20, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 9, 2, 24.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (320, 21, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 10, 2, 87.3300, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (321, 23, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 12, 9, 412.1000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (322, 24, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 13, 2, 234.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (323, 26, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 7, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (324, 27, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 7, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (325, 28, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 6, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (326, 10, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 8, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (327, 11, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 9, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (328, 12, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 2, 254.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (329, 13, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 7, 1, 433.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (330, 14, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 8, 6, 49.3900, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (331, 15, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 9, 2, 24.3000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (332, 16, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 10, 4, 87.3300, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (333, 22, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 11, 1, 231.8000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (334, 25, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 14, 6, 54.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (335, 24, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 1, 7, 30.0000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (336, 25, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 2, 4, 150.4000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (337, 26, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 3, 3, 25.6000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (338, 27, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 4, 8, 54.2000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (339, 28, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 5, 1, 123.9000, 0.0000, 0.0000, N'N')
INSERT [PedidoVendaItem] ([Id], [PedidoVendaId], [Criacao], [Modificacao], [ProdutoId], [Quantidade], [ValorUnitario], [ValorDesconto], [ValorAcrescimo], [TipoPreco]) VALUES (340, 29, CAST(N'2018-08-10T00:00:43.730' AS DateTime), CAST(N'2018-08-10T00:00:43.730' AS DateTime), 6, 6, 254.3000, 0.0000, 0.0000, N'N')
SET IDENTITY_INSERT [PedidoVendaItem] OFF
SET IDENTITY_INSERT [Pessoa] ON 

INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (1, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Heloise Camacho', N'00027562000', N'Autoserviço', CAST(N'1959-10-18T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (2, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Maria Vitória Calixto', N'00002364115', N'Autoserviço', CAST(N'1960-10-05T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (3, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Elisa Farias', N'00002047810', N'Autoserviço', CAST(N'1967-09-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (4, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Maria Flor Baptista', N'10441918808', N'Autoserviço', CAST(N'1974-04-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (5, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Malu Assunção', N'99234793587', N'Autoserviço', CAST(N'1977-03-11T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (6, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Mariana D’Ávila', N'15331928803', N'Vendedor Diamante', CAST(N'1972-07-17T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (7, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Sophia Alencastro', N'05108701802', N'Grandes Redes', CAST(N'1988-10-15T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (8, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Agatha Ibrahim', N'00020223544', N'Autoserviço', CAST(N'1975-08-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (9, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Alice Esteves', N'00020223625', N'Camelô', CAST(N'1969-08-23T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (10, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Nicole Capelo', N'11456458876', N'Autoserviço', CAST(N'1992-11-02T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (11, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Joana Aparício', N'01107156750', N'Grandes Redes', CAST(N'1982-01-09T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (12, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Lorena Jesus', N'80926835815', N'Camelô', CAST(N'1971-10-05T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (13, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Agatha Frutuoso', N'28189620134', N'Vendedor Diamante', CAST(N'1960-12-11T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (14, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Allana Jaques', N'29870348904', N'Autoserviço', CAST(N'1972-09-22T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (15, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Allana Gonzaga', N'22434070191', N'Autoserviço', CAST(N'1985-04-16T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (16, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Rebeca Arruda', N'69720010568', N'Autoserviço', CAST(N'1979-02-15T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (17, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Júlia Caetano', N'97722694578', N'Grandes Redes', CAST(N'1961-09-23T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (18, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Laís Albuquerque', N'00314927972', N'Autoserviço', CAST(N'1990-09-21T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (19, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Letícia Galvão', N'16942931578', N'Bodega', CAST(N'1993-01-08T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (20, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Maria Júlia Brito', N'19307762848', N'Autoserviço', CAST(N'1962-09-11T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (21, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Letícia Ibrahim', N'56983479130', N'Autoserviço', CAST(N'1975-08-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (22, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Isabel Gouveia', N'99868989868', N'Autoserviço', CAST(N'1983-05-11T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (23, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Isis Domingues', N'00130082775', N'Autoserviço', CAST(N'1976-05-29T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (24, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Helena Félix', N'10695052420', N'Vendedor Bronze', CAST(N'1993-12-27T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (25, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Bento Assunção', N'13924338272', N'Autoserviço', CAST(N'1977-03-11T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (26, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Fernando Fogaça', N'00008889074', N'Autoserviço', CAST(N'1962-11-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (27, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Pietro Guimarães', N'00000000191', N'Grandes Redes', CAST(N'1981-06-04T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (28, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Vicente Domingues', N'00000000272', N'Camelô', CAST(N'1976-05-29T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (29, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'André Lacerda', N'00000000353', N'Autoserviço', CAST(N'1969-10-29T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (30, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Breno Figueiroa', N'00000000434', N'Autoserviço', CAST(N'1964-10-23T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (31, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Pietro Ávila', N'00000000604', N'Vendedor Diamante', CAST(N'1976-03-23T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (32, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Enzo Miguel Brites', N'00000000787', N'Bodega', CAST(N'1963-08-30T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (33, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Daniel Hipólito', N'00000000868', N'Camelô', CAST(N'1976-08-04T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (34, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Cauã Baptista', N'00000000949', N'Autoserviço', CAST(N'1974-04-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (35, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Emanuel Infante', N'00000001163', N'Bodega', CAST(N'1973-09-10T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (36, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Breno Gonzaga', N'00000001244', N'Autoserviço', CAST(N'1985-04-16T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (37, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'João Lucas Ilha', N'00000001325', N'Autoserviço', CAST(N'1974-08-29T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (38, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Caleb Antunes', N'00000001406', N'Autoserviço', CAST(N'1982-12-28T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (39, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Pedro Lucas Antunes', N'00000001597', N'Autoserviço', CAST(N'1982-12-28T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (40, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Bruno Farias', N'00000001678', N'Bodega', CAST(N'1967-09-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (41, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'João Lucas Custódio', N'00000001759', N'Autoserviço', CAST(N'1982-03-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (42, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Fernando Alvim', N'00000001830', N'Camelô', CAST(N'1985-11-21T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (43, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Lucas Hernandes', N'00000001910', N'Bodega', CAST(N'1978-07-11T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (44, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Luan Agostinho', N'00000002054', N'Autoserviço', CAST(N'1992-08-27T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (45, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Luiz Otávio Gonzaga', N'00000002135', N'Grandes Redes', CAST(N'1985-04-16T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (46, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Luiz Henrique Bonfim', N'00000002216', N'Grandes Redes', CAST(N'1965-08-05T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (47, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Ruan Furtado', N'00000002305', N'Autoserviço', CAST(N'1994-12-15T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (48, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Caio Dinís', N'00000002488', N'Bodega', CAST(N'1977-05-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (49, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Luiz Miguel Drumond', N'00000002569', N'Vendedor Diamante', CAST(N'1973-07-05T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (50, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Enrico Farias', N'00000002640', N'Autoserviço', CAST(N'1967-09-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (51, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Miguel Agostinho', N'00000002720', N'Vendedor Bronze', CAST(N'1992-08-27T00:00:00.000' AS DateTime), N'V', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (52, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Davi Miguel Damásio', N'00000002801', N'Camelô', CAST(N'1980-04-10T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (53, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Victor Boaventura', N'00000002992', N'Grandes Redes', CAST(N'1966-07-24T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (54, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Pedro Dinís', N'00000003026', N'Camelô', CAST(N'1977-05-17T00:00:00.000' AS DateTime), N'C', 1)
INSERT [Pessoa] ([Id], [Criacao], [Modificacao], [Nome], [CPF], [Grupo], [DataNascimento], [Tipo], [Ativo]) VALUES (55, CAST(N'2018-08-09T22:45:07.520' AS DateTime), CAST(N'2018-08-09T22:45:07.520' AS DateTime), N'Heitor Lancastre', N'00000003107', N'Autoserviço', CAST(N'1968-11-10T00:00:00.000' AS DateTime), N'C', 1)
SET IDENTITY_INSERT [Pessoa] OFF
SET IDENTITY_INSERT [Produto] ON 

INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (1, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Bracelete de Couro', N'ASS0001', 30.0000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (2, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Bracelete de Aço', N'ASS0002', 150.4000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (3, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Anel Rock’n’roll', N'ASS0003', 25.6000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (4, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Gravata York', N'ASS0004', 54.2000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (5, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Anel Ouro Liso', N'ASS0005', 123.9000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (6, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Anel Ouro Escovado', N'ASS0006', 254.3000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (7, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Anel Ouro Branco', N'ASS0007', 433.9000, N'Acessorios')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (8, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Fone de Ouvido Gamer', N'ELT2020', 49.3900, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (9, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Fone de Ouvido IntraAur', N'ELT2021', 24.3000, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (10, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Smartwach MI 399', N'ELT2022', 87.3300, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (11, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Smartwach MI 899', N'ELT2023', 231.8000, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (12, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Drone Phantom 4', N'ELT2024', 412.1000, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (13, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'Drone Phantom 3', N'ELT2025', 234.4000, N'Eletronico')
INSERT [Produto] ([Id], [Criacao], [Modificacao], [Nome], [Codigo], [PrecoBase], [GrupoProduto]) VALUES (14, CAST(N'2018-08-09T23:25:19.300' AS DateTime), CAST(N'2018-08-09T23:25:19.300' AS DateTime), N'HD 8T King', N'ELT2026', 54.6000, N'Eletronico')
SET IDENTITY_INSERT [Produto] OFF
ALTER TABLE [PedidoVendaItem] ADD  CONSTRAINT [UQ_PVI_PDV_PRD] UNIQUE NONCLUSTERED 
(
	[ProdutoId] ASC,
	[PedidoVendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PedidoVenda]  WITH CHECK ADD FOREIGN KEY([ClienteId])
REFERENCES [Pessoa] ([Id])
GO
ALTER TABLE [PedidoVenda]  WITH CHECK ADD FOREIGN KEY([VendedorId])
REFERENCES [Pessoa] ([Id])
GO
ALTER TABLE [PedidoVendaItem]  WITH CHECK ADD FOREIGN KEY([ProdutoId])
REFERENCES [Produto] ([Id])
GO
