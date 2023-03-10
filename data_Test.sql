USE [Test_System_T]
GO

/****** Object:  Table [dbo].[M_CUSTOMS_MATERIAL]    Script Date: 2/21/2023 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_CUSTOMS_MATERIAL](
	[Factory] [nvarchar](4) NOT NULL,
	[CMatl_Code] [nvarchar](10) NOT NULL,
	[CMatl_Name] [nvarchar](200) NOT NULL,
	[CMatl_Unit] [nvarchar](20) NOT NULL,
	[HS_Code] [nvarchar](15) NOT NULL,
	[Insert_By] [nvarchar](10) NOT NULL,
	[Insert_At] [datetime] NOT NULL,
	[Update_By] [nvarchar](10) NULL,
	[Update_At] [datetime] NULL,
 CONSTRAINT [PK_M_CUSTOMS_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[Factory] ASC,
	[CMatl_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 2/21/2023 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_unique] [nvarchar](50) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[role_type] [nvarchar](50) NOT NULL,
	[role_note] [nvarchar](250) NOT NULL,
	[role_sequence] [float] NOT NULL,
	[update_by] [nvarchar](50) NOT NULL,
	[update_time] [datetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_unique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 2/21/2023 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[user_account] [nvarchar](50) NOT NULL,
	[role_unique] [nvarchar](50) NOT NULL,
	[create_by] [nvarchar](50) NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleUser] PRIMARY KEY CLUSTERED 
(
	[user_account] ASC,
	[role_unique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_EDI_INBOUND]    Script Date: 2/21/2023 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EDI_INBOUND](
	[Factory] [nvarchar](4) NOT NULL,
	[Supplier_Code] [nvarchar](10) NOT NULL,
	[Invoice] [nvarchar](20) NOT NULL,
	[CMatl_Code] [nvarchar](10) NOT NULL,
	[Declare_No] [nvarchar](35) NULL,
	[Declare_Type] [nvarchar](3) NULL,
	[Declare_Date] [date] NULL,
	[Unloading_Location] [nvarchar](200) NOT NULL,
	[Terms_Of_Trade] [nvarchar](5) NOT NULL,
	[HS_Code] [nvarchar](15) NOT NULL,
	[CMatl_Unit] [nvarchar](20) NOT NULL,
	[Supplier_Declare_No] [nvarchar](12) NULL,
	[Con_No] [nvarchar](20) NULL,
	[Con_Type] [nvarchar](1) NULL,
	[Batch_No] [nvarchar](10) NULL,
	[Declare_Quantity] [decimal](13, 2) NOT NULL,
	[Declare_Unit_Price] [decimal](11, 2) NOT NULL,
	[Amount_USD] [decimal](13, 2) NOT NULL,
	[Amount_VND] [decimal](13, 2) NOT NULL,
	[Insur_Fee] [decimal](13, 2) NOT NULL,
	[Trans_Fee] [decimal](13, 2) NOT NULL,
	[Invoice_Date] [date] NOT NULL,
	[Close_State] [nvarchar](1) NULL,
	[Insert_By] [nvarchar](10) NOT NULL,
	[Insert_At] [datetime] NOT NULL,
	[Update_By] [nvarchar](10) NULL,
	[Update_At] [datetime] NULL,
 CONSTRAINT [PK_T_EDI_INBOUND] PRIMARY KEY CLUSTERED 
(
	[Factory] ASC,
	[Supplier_Code] ASC,
	[Invoice] ASC,
	[CMatl_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 2/21/2023 13:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[account] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
	[update_by] [nvarchar](50) NOT NULL,
	[update_time] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'111', N'aa', N'AA', N'112233', N'admin', CAST(N'2023-02-16T09:26:07.173' AS DateTime), N'admin', CAST(N'2023-02-16T09:26:07.173' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'112', N'112', N'112', N'112', N'admin', CAST(N'2023-02-16T09:10:51.183' AS DateTime), N'admin', CAST(N'2023-02-16T09:10:51.183' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'113', N'Test', N'TEST', N'1130114', N'admin', CAST(N'2023-02-15T01:26:24.387' AS DateTime), N'admin', CAST(N'2023-02-15T08:26:45.623' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'114', N'wao', N'Wao', N'114665', N'admin', CAST(N'2023-02-16T08:55:40.090' AS DateTime), N'admin', CAST(N'2023-02-16T08:55:40.090' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'116', N'Ts', N'TS', N'116611', N'admin', CAST(N'2023-02-16T09:01:40.000' AS DateTime), N'admin', CAST(N'2023-02-16T09:01:40.000' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'123', N'ww', N'WW', N'1234567', N'admin', CAST(N'2023-02-16T09:23:41.907' AS DateTime), N'admin', CAST(N'2023-02-16T09:23:41.907' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'2010', N'testfac', N'Fac', N'20102200', N'admin', CAST(N'2023-02-17T11:50:00.417' AS DateTime), NULL, NULL)
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'661', N'mms', N'MMS', N'116661', N'admin', CAST(N'2023-02-16T09:39:37.067' AS DateTime), N'admin', CAST(N'2023-02-16T09:39:37.067' AS DateTime))
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'SHC', N'334', N'bbb', N'BBB', N'123333', N'admin', CAST(N'2023-02-21T10:34:36.390' AS DateTime), NULL, NULL)
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'SHC', N'4444', N'bbbb', N'BBBB', N'1234444', N'admin', CAST(N'2023-02-21T10:43:22.313' AS DateTime), NULL, NULL)
INSERT [dbo].[M_CUSTOMS_MATERIAL] ([Factory], [CMatl_Code], [CMatl_Name], [CMatl_Unit], [HS_Code], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'SHC', N'CMT0001', N'Iron BQ0001', N'Kg', N'IRONKG', N'admin', CAST(N'2023-02-20T15:00:46.217' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.ContractDataMaintain', N'1.3 Contract Data Maintain', N'CDS', N' ', 103, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.CustomsMaterialMaintain', N'1.2 Customs Material Maintain', N'CDS', N' ', 102, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.DevelopmentOrders', N'2.3 Development Orders', N'CDS', N' ', 203, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.EDITransaction', N'2.6 EDI Transaction', N'CDS', N' ', 206, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.EDITransfer&Return&Scrap', N'2.7 EDI Transfer & Return & Scrap', N'CDS', N' ', 207, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.ImportDeclarationApplication', N'2.5 Import Declaration Application', N'CDS', N' ', 205, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.MatlOutsourcing/ComponentSubcon', N'2.2 Matl Outsourcing/Component Subcon', N'CDS', N' ', 202, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.NoDeclaredMaterialSetup', N'1.5 No Declared Material Setup', N'CDS', N' ', 105, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.PurchaseTransaction', N'2.1 Purchase Transaction', N'CDS', N' ', 201, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.SupplierMaintain', N'1.4 Supplier Maintain', N'CDS', N' ', 104, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
INSERT [dbo].[Roles] ([role_unique], [role_name], [role_type], [role_note], [role_sequence], [update_by], [update_time]) VALUES (N'CDS.UserPermissionSettings', N'1.1 User Permission Settings', N'CDS', N' ', 101, N'E90088', CAST(N'2023-02-14T08:45:00.000' AS DateTime))
GO
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.ContractDataMaintain', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.CustomsMaterialMaintain', N'admin', CAST(N'2023-02-16T11:20:54.350' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.DevelopmentOrders', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.EDITransaction', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.EDITransfer&Return&Scrap', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.ImportDeclarationApplication', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.MatlOutsourcing/ComponentSubcon', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.NoDeclaredMaterialSetup', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.PurchaseTransaction', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.SupplierMaintain', N'admin', CAST(N'2023-02-16T11:20:54.353' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'63032', N'CDS.UserPermissionSettings', N'admin', CAST(N'2023-02-16T11:20:54.323' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.ContractDataMaintain', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.CustomsMaterialMaintain', N'admin', CAST(N'2023-02-16T09:49:16.327' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.DevelopmentOrders', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.EDITransaction', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.EDITransfer&Return&Scrap', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.ImportDeclarationApplication', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.MatlOutsourcing/ComponentSubcon', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.NoDeclaredMaterialSetup', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.PurchaseTransaction', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.SupplierMaintain', N'admin', CAST(N'2023-02-16T09:49:24.203' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'64194', N'CDS.UserPermissionSettings', N'admin', CAST(N'2023-02-16T09:49:16.113' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'66765', N'CDS.CustomsMaterialMaintain', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'66765', N'CDS.DevelopmentOrders', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'A0113', N'CDS.EDITransaction', N'admin', CAST(N'2023-02-16T09:59:22.160' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'A0113', N'CDS.ImportDeclarationApplication', N'admin', CAST(N'2023-02-16T09:59:22.160' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'A0113', N'CDS.NoDeclaredMaterialSetup', N'admin', CAST(N'2023-02-16T09:59:22.160' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'A0113', N'CDS.PurchaseTransaction', N'admin', CAST(N'2023-02-16T09:55:09.660' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'A0113', N'CDS.UserPermissionSettings', N'admin', CAST(N'2023-02-16T09:59:22.160' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.ContractDataMaintain', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.CustomsMaterialMaintain', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.DevelopmentOrders', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.EDITransaction', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.EDITransfer&Return&Scrap', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.ImportDeclarationApplication', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.MatlOutsourcing/ComponentSubcon', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.NoDeclaredMaterialSetup', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.PurchaseTransaction', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.SupplierMaintain', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'admin', N'CDS.UserPermissionSettings', N'E90088', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.ContractDataMaintain', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.CustomsMaterialMaintain', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.DevelopmentOrders', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.EDITransaction', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.EDITransfer&Return&Scrap', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.ImportDeclarationApplication', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.MatlOutsourcing/ComponentSubcon', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.NoDeclaredMaterialSetup', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.PurchaseTransaction', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.SupplierMaintain', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
INSERT [dbo].[RoleUser] ([user_account], [role_unique], [create_by], [create_time]) VALUES (N'E90088', N'CDS.UserPermissionSettings', N'E90088', CAST(N'2023-02-14T09:10:57.553' AS DateTime))
GO
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'E0001', N'IE20221027053SCK', N'111', N'105068397930', N'1', NULL, N'Teset_UP', N'termT', N'hs_code_Up', N'CMatl_Unit_Test', NULL, N'26/SSB-SHC', N'2', N'20221101', CAST(35.81 AS Decimal(13, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(666.92 AS Decimal(13, 2)), CAST(15305814.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.227' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.943' AS DateTime))
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'E0003', N'invoice no', N'custom mat', N'decla no', N'2', CAST(N'2023-02-01' AS Date), N'unloading location', N'terms', N'd', N'customs materia un', N'supperlier', N'contract', N'2', N'batch', CAST(0.00 AS Decimal(13, 2)), CAST(1.00 AS Decimal(11, 2)), CAST(2.00 AS Decimal(13, 2)), CAST(3.00 AS Decimal(13, 2)), CAST(3.00 AS Decimal(13, 2)), CAST(4.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.227' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.943' AS DateTime))
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'E0004', N'invoice no', N'661', N'decla no', N'2', NULL, N'unloading location', N'terms', N'd', N'customs materia un', N'supperlier', N'contract', N'1', N'batch', CAST(0.00 AS Decimal(13, 2)), CAST(1.00 AS Decimal(11, 2)), CAST(2.00 AS Decimal(13, 2)), CAST(3.00 AS Decimal(13, 2)), CAST(3.00 AS Decimal(13, 2)), CAST(4.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.230' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.947' AS DateTime))
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'FD44', N'IE20221027053SCK', N'131', N'105068397930', N'1', NULL, N'Teset_UP', N'termT', N'hs_code_Up', N'CMatl_Unit_Test', NULL, N'26/SSB-SHC', N'2', N'20221101', CAST(35.81 AS Decimal(13, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(666.92 AS Decimal(13, 2)), CAST(15305814.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.223' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.940' AS DateTime))
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'FD45', N'IE20221027053SCK', N'131', N'105068397930', N'1', NULL, N'Teset_UP', N'termT', N'hs_code_Up', N'CMatl_Unit_Test', NULL, N'26/SSB-SHC', N'2', N'20221101', CAST(35.81 AS Decimal(13, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(666.92 AS Decimal(13, 2)), CAST(15305814.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.223' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.943' AS DateTime))
INSERT [dbo].[T_EDI_INBOUND] ([Factory], [Supplier_Code], [Invoice], [CMatl_Code], [Declare_No], [Declare_Type], [Declare_Date], [Unloading_Location], [Terms_Of_Trade], [HS_Code], [CMatl_Unit], [Supplier_Declare_No], [Con_No], [Con_Type], [Batch_No], [Declare_Quantity], [Declare_Unit_Price], [Amount_USD], [Amount_VND], [Insur_Fee], [Trans_Fee], [Invoice_Date], [Close_State], [Insert_By], [Insert_At], [Update_By], [Update_At]) VALUES (N'2010', N'FD48', N'IE20221027053SCK', N'131', N'105068397930', N'1', CAST(N'2023-02-01' AS Date), N'Tesetaaaaaaaaaaaaaaaaaaaa', N'termT', N'hs_code_Up', N'CMatl_Unit_Test', NULL, N'26/SSB-SHC', N'2', N'20221101', CAST(35.81 AS Decimal(13, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(666.92 AS Decimal(13, 2)), CAST(15305814.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(N'2022-01-03' AS Date), NULL, N'admin', CAST(N'2023-02-21T08:33:58.223' AS DateTime), N'admin', CAST(N'2023-02-21T08:35:36.943' AS DateTime))
GO
INSERT [dbo].[Users] ([account], [password], [name], [email], [is_active], [update_by], [update_time]) VALUES (N'68514', N'1234', N'ha.phan', N'ha.phan@ssbshoes.com', 1, N'admin', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([account], [password], [name], [email], [is_active], [update_by], [update_time]) VALUES (N'admin', N'1234', N'admin', N'admin@ssbshoes.com', 1, N'admin', CAST(N'2023-02-14T00:00:00.000' AS DateTime))
GO
