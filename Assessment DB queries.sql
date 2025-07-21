USE [Assessmets]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 7/21/2025 8:50:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientsID] [int] IDENTITY(1,1) NOT NULL,
	[Createdate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Quantity] [decimal](18, 0) NULL,
	[Deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredients]    Script Date: 7/21/2025 8:50:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredients](
	[RecipeIngredientID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NULL,
	[Deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 7/21/2025 8:50:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[Createdate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[RecipeName] [nvarchar](100) NULL,
	[ServingSize] [int] NULL,
	[Deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (1, CAST(N'2025-07-18T16:43:26.820' AS DateTime), CAST(N'2025-07-18T16:43:26.420' AS DateTime), N'Cucumber', N'Vegtable', CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (2, CAST(N'2025-07-18T16:44:40.650' AS DateTime), CAST(N'2025-07-18T16:44:40.277' AS DateTime), N'Olives', N'Vegtable', CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (3, CAST(N'2025-07-18T16:44:55.133' AS DateTime), CAST(N'2025-07-18T16:44:54.733' AS DateTime), N'Lettuce', N'Vegtable', CAST(3 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (4, CAST(N'2025-07-18T16:45:55.257' AS DateTime), CAST(N'2025-07-18T16:45:54.793' AS DateTime), N'Meat', N'Beef, Chicken, Lamp, Pork, Fish', CAST(6 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (5, CAST(N'2025-07-18T16:46:12.923' AS DateTime), CAST(N'2025-07-18T16:46:12.500' AS DateTime), N'Tomato', N'Vegtable', CAST(6 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (6, CAST(N'2025-07-18T16:46:33.527' AS DateTime), CAST(N'2025-07-18T16:46:33.187' AS DateTime), N'Cheese', N'Dairy', CAST(8 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [Createdate], [UpdateDate], [Name], [Description], [Quantity], [Deleted]) VALUES (7, CAST(N'2025-07-18T16:46:54.567' AS DateTime), CAST(N'2025-07-18T16:46:54.127' AS DateTime), N'Dough', N'Carb', CAST(10 AS Decimal(18, 0)), 0)
GO
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[RecipeIngredients] ON 
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (1, 1, 7, CAST(3 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (2, 1, 5, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (3, 1, 6, CAST(3 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (4, 1, 2, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (5, 2, 3, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (6, 2, 5, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (7, 2, 1, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (8, 2, 6, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (9, 2, 2, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (10, 3, 7, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (11, 3, 5, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (12, 3, 6, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (13, 3, 4, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (18, 4, 7, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (19, 4, 1, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (20, 5, 7, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (21, 5, 4, CAST(2 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (22, 6, 4, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (23, 6, 3, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (24, 6, 5, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (25, 6, 6, CAST(1 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[RecipeIngredients] ([RecipeIngredientID], [RecipeID], [IngredientID], [Quantity], [Deleted]) VALUES (26, 6, 7, CAST(1 AS Decimal(18, 0)), 0)
GO
SET IDENTITY_INSERT [dbo].[RecipeIngredients] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (1, CAST(N'2025-07-18T16:50:20.253' AS DateTime), CAST(N'2025-07-18T16:50:17.960' AS DateTime), N'Pizza', 4, 0)
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (2, CAST(N'2025-07-18T16:50:55.550' AS DateTime), CAST(N'2025-07-18T16:50:54.240' AS DateTime), N'Salad', 3, 0)
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (3, CAST(N'2025-07-18T16:51:13.830' AS DateTime), CAST(N'2025-07-18T16:51:13.523' AS DateTime), N'Pasta', 2, 0)
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (4, CAST(N'2025-07-18T16:51:28.270' AS DateTime), CAST(N'2025-07-18T16:51:27.893' AS DateTime), N'Sandwhich', 1, 0)
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (5, CAST(N'2025-07-18T16:51:39.017' AS DateTime), CAST(N'2025-07-18T16:51:38.620' AS DateTime), N'Pie', 1, 0)
GO
INSERT [dbo].[Recipes] ([RecipeID], [Createdate], [UpdateDate], [RecipeName], [ServingSize], [Deleted]) VALUES (6, CAST(N'2025-07-18T16:51:49.910' AS DateTime), CAST(N'2025-07-18T16:51:49.447' AS DateTime), N'Burger', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
ALTER TABLE [dbo].[Ingredients] ADD  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[Recipes] ADD  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[RecipeIngredients]  WITH CHECK ADD FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredients] ([IngredientsID])
GO
ALTER TABLE [dbo].[RecipeIngredients]  WITH CHECK ADD FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
