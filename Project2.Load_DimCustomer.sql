USE [BIClass]
GO
/****** Object:  StoredProcedure [Project2].[Load_DimCustomer]    Script Date: 4/8/2022 2:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brandon Scott
-- Create date: 4/8/2022
-- Description:	Store Procedure that 
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimCustomer]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DROP TABLE IF EXISTS [CH01-01-Dimension].[DimCustomer];
CREATE TABLE [CH01-01-Dimension].[DimCustomer](
[CustomerKey] [INT] IDENTITY(1,1) NOT NULL,
[CustomerName] VARCHAR(30) NOT NULL,
[UserAuthorizationKey] [INT] NOT NULL,
[DateAdded] DATETIME2 NULL DEFAULT SYSDATETIME(),
[DateOfLastUpdate] DATETIME2 NULL DEFAULT SYSDATETIME(),
CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED
(
 [CustomerKey] asc
 ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
 IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
 ALLOW_PAGE_LOCKS=ON) ON [PRIMARY]
)
GO

ALTER TABLE [dbo].[DimCustomer]
ADD CONSTRAINT [DF_DimCustomer_DateAdded] DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [dbo].[DimCustomer]
ADD CONSTRAINT [DF_DimCustomer_DateofLastUpdate] DEFAULT (SYSDATETIME()) FOR [DateofLastUpdate]
GO



