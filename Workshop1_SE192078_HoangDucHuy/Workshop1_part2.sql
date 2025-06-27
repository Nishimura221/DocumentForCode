USE [master]
GO
DROP DATABASE IF EXISTS [PRJ301_WORKSHOP1]
GO


CREATE DATABASE [PRJ301_WORKSHOP1]
GO


USE [PRJ301_WORKSHOP1]
GO


CREATE TABLE [dbo].[tblUsers] (
    [Username] NVARCHAR(50) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL,
    [Password] NVARCHAR(255) NOT NULL,
    [Role] NVARCHAR(20) NOT NULL CHECK ([Role] IN ('Founder', 'Team Member')),
    CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED ([Username] ASC)
)
GO


CREATE TABLE [dbo].[tblStartupProjects] (
    [project_id] INT IDENTITY(1,1) PRIMARY KEY,
    [project_name] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(1000),
    [Status] NVARCHAR(20) NOT NULL CHECK ([Status] IN ('Ideation', 'Development', 'Launch', 'Scaling')),
    [estimated_launch] DATE NOT NULL
)
GO
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'admin', N'Administrator', N'1', N'Founder')
SELECT*FROM tblUsers