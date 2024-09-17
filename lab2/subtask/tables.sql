CREATE TABLE [dbo].[Brand] (
    [Name] [varchar](50) NOT NULL,
    [Country] [varchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Product](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [varchar](50) NOT NULL,
    [Price] [decimal](18,2) NOT NULL,
	PRIMARY KEY ([Id])  -- Setting Id as the primary key
) ON [PRIMARY]
GO
