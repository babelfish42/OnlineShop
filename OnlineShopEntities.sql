/****** Object:  ForeignKey [FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[BeanBags]'))
ALTER TABLE [dbo].[BeanBags] DROP CONSTRAINT [FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]
GO
/****** Object:  ForeignKey [FK_dbo.Carts_dbo.BeanBags_BeanBagId]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Carts_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts] DROP CONSTRAINT [FK_dbo.Carts_dbo.BeanBags_BeanBagId]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetails_dbo.Orders_OrderId]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND type in (N'U'))
DROP TABLE [dbo].[Carts]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[BeanBags]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BeanBags]') AND type in (N'U'))
DROP TABLE [dbo].[BeanBags]
GO
/****** Object:  Table [dbo].[BeanBagTypes]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BeanBagTypes]') AND type in (N'U'))
DROP TABLE [dbo].[BeanBagTypes]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Default [DF__Carts__BeanBagId__0BC6C43E]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Carts__BeanBagId__0BC6C43E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Carts__BeanBagId__0BC6C43E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Carts] DROP CONSTRAINT [DF__Carts__BeanBagId__0BC6C43E]
END


End
GO
/****** Object:  Default [DF__OrderDeta__BeanB__0CBAE877]    Script Date: 06/15/2013 14:41:18 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__OrderDeta__BeanB__0CBAE877]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__OrderDeta__BeanB__0CBAE877]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [DF__OrderDeta__BeanB__0CBAE877]
END


End
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/15/2013 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[FirstName] [nvarchar](160) COLLATE Latin1_General_CI_AS NOT NULL,
	[LastName] [nvarchar](160) COLLATE Latin1_General_CI_AS NOT NULL,
	[street] [nvarchar](70) COLLATE Latin1_General_CI_AS NOT NULL,
	[hno] [nvarchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
	[Zip] [nvarchar](4) COLLATE Latin1_General_CI_AS NOT NULL,
	[City] [nvarchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[Phone] [nvarchar](24) COLLATE Latin1_General_CI_AS NOT NULL,
	[Email] [nvarchar](max) COLLATE Latin1_General_CI_AS NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (1, N'bla', N'hjhgh', N'jhgjh', N'hghjg', N'7676', N'4444', N'jhgj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D800D45005 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (2, N'bla', N'hjhgh', N'jhgjh', N'hghjg', N'7676', N'4444', N'jhgj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D800D49E1B AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (3, N'test', N'hkjh', N'khk', N'kjh', N'kjh', N'0987', N'kh', N'02345667', N'kjh@jh.csa', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D800EFD5D6 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (4, N'test', N'Sandra', N'Roth', N'boh', N'987', N'9876', N'jhgj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D800F068B4 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (5, N'test', N'jhg', N'jhg', N'hkg', N'jhg', N'0000', N'jkkjhjh', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D800F812C9 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (6, N'test', N'Sandra', N'Roth', N'sadas', N'lkj', N'9876', N'scas', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8012C00DF AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (7, N'test', N'jkh', N'ljh', N'lj', N'kljh', N'9876', N'88888', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D80144B4F1 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (8, N'test', N'asd', N'asd', N'asd', N'asd', N'1234', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801453147 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (9, N'test', N'asd', N'asd', N'asd', N'asd', N'1234', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801466894 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (10, N'test', N'asd', N'jhg', N'asd', N'987', N'0000', N'88888', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D80147F879 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (11, N'test', N'asd', N'asd', N'asd', N'7676', N'0000', N'88888', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801486A27 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (12, N'test', N'asd', N'asd', N'asd', N'asd', N'1234', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014A3659 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (13, N'test', N'qwe', N'qwe', N'qwe', N'123', N'1234', N'qwe', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014ABF8A AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (14, N'test', N'asd', N'asd', N'asd', N'asd', N'123', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014BB8EE AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (15, N'test', N'asd', N'asd', N'asd', N'asd', N'1234', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014C48F3 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (16, N'test', N'asd', N'asd', N'asd', N'asd', N'1234', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014C6D3C AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (17, N'test', N'k', N'kjh', N'kjh', N'kh', N'9876', N'kjh', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014CCCFF AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (18, N'test', N'asd', N'asd', N'asd', N'asd', N'asd', N'asd', N'123123', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014EDDD3 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (19, N'test', N'asd', N'asd', N'asd', N'asd', N'asd', N'asd', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8014F81FC AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (20, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8015180BE AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (21, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D80151E9A6 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (22, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801525E86 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (23, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8015C9F85 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (24, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D80163E208 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (25, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801644BE3 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (26, N'test', N'ljk', N'ljk', N'lkj', N'ljk', N'lkj', N'lkj', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8016A539D AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (27, N'test', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'lkj', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8016BEB2D AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (28, N'test', N'Sandra', N'Roth', N'Strasse', N'12', N'1234', N'Winti', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8016D065A AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (29, N'test', N'asd', N'asd', N'asd', N'12', N'0000', N'88888', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8016DE037 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (30, N'test', N'oiu', N'oiu', N'oiu', N'oiu', N'oiu', N'oiu', N'02345667', N'hhggjhg@jhk.ccc', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D8017185B8 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (31, N'test', N'Sandra', N'Roth', N'binzhofstrasse', N'41', N'8404', N'Winti', N'02345667', N's.roth@crif.com', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801761745 AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (32, N'test', N'Sandra', N'Roth', N'binzhofstrasse', N'12', N'8404', N'Winti', N'02345667', N's.roth@crif.com', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D801772EEC AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [Username], [FirstName], [LastName], [street], [hno], [Zip], [City], [Phone], [Email], [Total], [OrderDate]) VALUES (33, N'test', N'Sandra', N'Roth', N'binzhofstrasse', N'12', N'8404', N'Winti', N'02345667', N's.roth@crif.com', CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A1D80177A498 AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[BeanBagTypes]    Script Date: 06/15/2013 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BeanBagTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BeanBagTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[picture] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
 CONSTRAINT [PK_dbo.BeanBagTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[BeanBagTypes] ON
INSERT [dbo].[BeanBagTypes] ([id], [name], [picture]) VALUES (1, N'Person', N'../../Images/BeanBagPersonAll_Front.JPG')
INSERT [dbo].[BeanBagTypes] ([id], [name], [picture]) VALUES (2, N'Device', N'../../Images/BeanBagDeviceAll_Front.JPG')
SET IDENTITY_INSERT [dbo].[BeanBagTypes] OFF
/****** Object:  Table [dbo].[BeanBags]    Script Date: 06/15/2013 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BeanBags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BeanBags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[description] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[price] [decimal](18, 2) NOT NULL,
	[color] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[measure] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[picture] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[beanBagTypeID] [int] NULL,
 CONSTRAINT [PK_dbo.BeanBags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BeanBags]') AND name = N'IX_beanBagTypeID')
CREATE NONCLUSTERED INDEX [IX_beanBagTypeID] ON [dbo].[BeanBags] 
(
	[beanBagTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET IDENTITY_INSERT [dbo].[BeanBags] ON
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (2, N'Brown', N'You can remove the cover to wash it.', CAST(199.00 AS Decimal(18, 2)), N'Brown', N'', N'../../Images/BeanBagPerson_Brown.JPG', 1)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (3, N'Cheeta Look', N'You can remove the cover to wash it.', CAST(19.90 AS Decimal(18, 2)), N'Cheeta', N'', N'../../Images/BeanBagDevice_Cheeta.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (4, N'Cow Look', N'You can remove the cover to wash it.', CAST(19.90 AS Decimal(18, 2)), N'Cow', N'', N'../../Images/BeanBagDevice_Cow.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (6, N'Devil Look', N'You can remove the cover to wash it.', CAST(19.90 AS Decimal(18, 2)), N'Devil', NULL, N'../../Images/BeanBagDevice_Devil.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (7, N'Red', N'You can remove the cover to wash it.', CAST(9.90 AS Decimal(18, 2)), N'Red', NULL, N'../../Images/BeanBagDevice_Red.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (9, N'Blue', N'You can remove the cover to wash it.', CAST(9.90 AS Decimal(18, 2)), N'Blue', NULL, N'../../Images/BeanBagDevice_Blue.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (14, N'Yellow', N'You can remove the cover to wash it.', CAST(9.90 AS Decimal(18, 2)), N'Yellow', NULL, N'../../Images/BeanBagDevice_Yellow.JPG', 2)
INSERT [dbo].[BeanBags] ([id], [name], [description], [price], [color], [measure], [picture], [beanBagTypeID]) VALUES (17, N'Black', N'You can remove the cover to wash it.', CAST(199.00 AS Decimal(18, 2)), N'Black', NULL, N'../../Images/BeanBagPerson_Black.JPG', 1)
SET IDENTITY_INSERT [dbo].[BeanBags] OFF
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/15/2013 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[BeanBagId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND name = N'IX_BeanBagId')
CREATE NONCLUSTERED INDEX [IX_BeanBagId] ON [dbo].[OrderDetails] 
(
	[BeanBagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND name = N'IX_OrderId')
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails] 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (4, 3, 1, CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (5, 3, 1, CAST(4.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (6, 4, 1, CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (8, 5, 1, CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (9, 5, 1, CAST(3.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (10, 5, 1, CAST(4.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (12, 6, 1, CAST(9.90 AS Decimal(18, 2)), 14)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (18, 11, 1, CAST(19.90 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (38, 31, 1, CAST(19.90 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (39, 32, 1, CAST(19.90 AS Decimal(18, 2)), 3)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [Quantity], [UnitPrice], [BeanBagId]) VALUES (40, 33, 1, CAST(19.90 AS Decimal(18, 2)), 4)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
/****** Object:  Table [dbo].[Carts]    Script Date: 06/15/2013 14:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carts](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](max) COLLATE Latin1_General_CI_AS NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[BeanBagId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Carts] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Carts]') AND name = N'IX_BeanBagId')
CREATE NONCLUSTERED INDEX [IX_BeanBagId] ON [dbo].[Carts] 
(
	[BeanBagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET IDENTITY_INSERT [dbo].[Carts] ON
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (3, N'25d26b25-c09a-4b6d-b6a9-8bc4bb10af97', 1, CAST(0x0000A1D601782E66 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (5, N'95916d74-5597-4cde-ad77-4eac7346d061', 1, CAST(0x0000A1D6017A52A6 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (6, N'bc12162e-4fd7-434d-86f6-c69cb7b08152', 1, CAST(0x0000A1D6017C11A3 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (10, N'6bd7d0cb-f034-49f2-8ef7-78e6dd62007e', 1, CAST(0x0000A1D601815A70 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (15, N'babelfish42', 2, CAST(0x0000A1D700953D61 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (16, N'babelfish42', 4, CAST(0x0000A1D700958BB7 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (19, N'fff99761-843d-4d4f-b844-bd89579965e2', 2, CAST(0x0000A1D700A4387E AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (22, N'f027622f-f866-40ba-b999-847d44e7abeb', 1, CAST(0x0000A1D700A637AB AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (34, N'a7cc052a-b1fe-41e4-929b-4d3cf4d1c0a8', 1, CAST(0x0000A1D800D7DFDA AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (39, N'36467f94-4caa-4d2f-a6cd-09b2c23a1537', 1, CAST(0x0000A1D800E48687 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (41, N'a142978d-6b07-4a99-a872-251d7e3880fb', 1, CAST(0x0000A1D800E542E2 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (42, N'4efc0503-dbc2-42e2-9374-f19cd00c581e', 1, CAST(0x0000A1D800E554EC AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (43, N'08ae25be-dc56-43f2-afbe-2f3878d0d989', 2, CAST(0x0000A1D800E741F9 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (44, N'de1fa470-00bc-43d5-96ea-9d2a3c4ca212', 1, CAST(0x0000A1D800E7BA32 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (45, N'30e14084-5890-4c66-be54-07402f7e59da', 1, CAST(0x0000A1D800EEBC23 AS DateTime), 3)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (46, N'30e14084-5890-4c66-be54-07402f7e59da', 1, CAST(0x0000A1D800EECA3E AS DateTime), 4)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (48, N'30e14084-5890-4c66-be54-07402f7e59da', 1, CAST(0x0000A1D800EED748 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (87, N'test', 1, CAST(0x0000A1D900A9D2BE AS DateTime), 3)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (89, N'a026e4cf-1986-41d0-82c0-be0f20e102a9', 1, CAST(0x0000A1DB00A64FCC AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (90, N'72c3a4a4-5e2c-4321-895f-745f4414c94a', 1, CAST(0x0000A1DB00BF2C20 AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (91, N'test', 1, CAST(0x0000A1DE00CFA7DE AS DateTime), 2)
INSERT [dbo].[Carts] ([RecordId], [CartId], [Count], [DateCreated], [BeanBagId]) VALUES (92, N'eece1bd8-6d9b-4c17-9bd0-b27816008fb5', 1, CAST(0x0000A1DE00DE3374 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Carts] OFF
/****** Object:  Default [DF__Carts__BeanBagId__0BC6C43E]    Script Date: 06/15/2013 14:41:18 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Carts__BeanBagId__0BC6C43E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Carts__BeanBagId__0BC6C43E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF__Carts__BeanBagId__0BC6C43E]  DEFAULT ((0)) FOR [BeanBagId]
END


End
GO
/****** Object:  Default [DF__OrderDeta__BeanB__0CBAE877]    Script Date: 06/15/2013 14:41:18 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__OrderDeta__BeanB__0CBAE877]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__OrderDeta__BeanB__0CBAE877]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF__OrderDeta__BeanB__0CBAE877]  DEFAULT ((0)) FOR [BeanBagId]
END


End
GO
/****** Object:  ForeignKey [FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]    Script Date: 06/15/2013 14:41:18 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[BeanBags]'))
ALTER TABLE [dbo].[BeanBags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID] FOREIGN KEY([beanBagTypeID])
REFERENCES [dbo].[BeanBagTypes] ([id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[BeanBags]'))
ALTER TABLE [dbo].[BeanBags] CHECK CONSTRAINT [FK_dbo.BeanBags_dbo.BeanBagTypes_beanBagTypeID]
GO
/****** Object:  ForeignKey [FK_dbo.Carts_dbo.BeanBags_BeanBagId]    Script Date: 06/15/2013 14:41:18 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Carts_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Carts_dbo.BeanBags_BeanBagId] FOREIGN KEY([BeanBagId])
REFERENCES [dbo].[BeanBags] ([id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Carts_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Carts]'))
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_dbo.Carts_dbo.BeanBags_BeanBagId]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]    Script Date: 06/15/2013 14:41:18 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId] FOREIGN KEY([BeanBagId])
REFERENCES [dbo].[BeanBags] ([id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.BeanBags_BeanBagId]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetails_dbo.Orders_OrderId]    Script Date: 06/15/2013 14:41:18 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OrderDetails_dbo.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetails]'))
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
