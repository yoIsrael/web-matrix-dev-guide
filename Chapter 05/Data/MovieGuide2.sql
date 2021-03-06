/****** Object:  Database MovieGuide    Script Date: 2/1/2002 9:23:25 AM ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'MovieGuide')
	DROP DATABASE [MovieGuide]
GO

CREATE DATABASE [MovieGuide]  ON (NAME = N'MovieGuide', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL\data\MovieGuide.mdf' , SIZE = 1, FILEGROWTH = 10%) LOG ON (NAME = N'MovieGuide_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL\data\MovieGuide_log.LDF' , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'MovieGuide', N'autoclose', N'false'
GO

exec sp_dboption N'MovieGuide', N'bulkcopy', N'false'
GO

exec sp_dboption N'MovieGuide', N'trunc. log', N'false'
GO

exec sp_dboption N'MovieGuide', N'torn page detection', N'true'
GO

exec sp_dboption N'MovieGuide', N'read only', N'false'
GO

exec sp_dboption N'MovieGuide', N'dbo use', N'false'
GO

exec sp_dboption N'MovieGuide', N'single', N'false'
GO

exec sp_dboption N'MovieGuide', N'autoshrink', N'false'
GO

exec sp_dboption N'MovieGuide', N'ANSI null default', N'false'
GO

exec sp_dboption N'MovieGuide', N'recursive triggers', N'false'
GO

exec sp_dboption N'MovieGuide', N'ANSI nulls', N'false'
GO

exec sp_dboption N'MovieGuide', N'concat null yields null', N'false'
GO

exec sp_dboption N'MovieGuide', N'cursor close on commit', N'false'
GO

exec sp_dboption N'MovieGuide', N'default to local cursor', N'false'
GO

exec sp_dboption N'MovieGuide', N'quoted identifier', N'false'
GO

exec sp_dboption N'MovieGuide', N'ANSI warnings', N'false'
GO

exec sp_dboption N'MovieGuide', N'auto create statistics', N'true'
GO

exec sp_dboption N'MovieGuide', N'auto update statistics', N'true'
GO

use [MovieGuide]
GO

/****** Object:  Table [dbo].[ExistingMovies]    Script Date: 2/1/2002 9:23:29 AM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ExistingMovies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ExistingMovies]
GO

/****** Object:  User dbo    Script Date: 2/1/2002 9:23:26 AM ******/
/****** Object:  Table [dbo].[ExistingMovies]    Script Date: 2/1/2002 9:23:31 AM ******/
CREATE TABLE [dbo].[ExistingMovies] (
	[InventoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Rating] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LeadActor] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LeadActress] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SupportingCast] [char] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Director] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Producer] [char] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Notes] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DatePurchased] [datetime] NOT NULL ,
	[Format] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[IsIn] [bit] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ExistingMovies] WITH NOCHECK ADD 
	CONSTRAINT [PK_ExistingMovies] PRIMARY KEY  CLUSTERED 
	(
		[InventoryID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ExistingMovies] WITH NOCHECK ADD 
	CONSTRAINT [DF_ExistingMovies_Rating] DEFAULT ('NR') FOR [Rating],
	CONSTRAINT [DF_ExistingMovies_Description] DEFAULT ('No Description Available') FOR [Description],
	CONSTRAINT [DF_ExistingMovies_LeadActor] DEFAULT ('N/A') FOR [LeadActor],
	CONSTRAINT [DF_ExistingMovies_LeadActress] DEFAULT ('N/A') FOR [LeadActress],
	CONSTRAINT [DF_ExistingMovies_SupportingCast] DEFAULT ('N/A') FOR [SupportingCast],
	CONSTRAINT [DF_ExistingMovies_Director] DEFAULT ('N/A') FOR [Director],
	CONSTRAINT [DF_ExistingMovies_Notes] DEFAULT ('No special notes.') FOR [Notes],
	CONSTRAINT [DF_ExistingMovies_Format] DEFAULT ('VHS') FOR [Format],
	CONSTRAINT [DF_ExistingMovies_IsIn] DEFAULT (1) FOR [IsIn]
GO

 CREATE  INDEX [IX_Name] ON [dbo].[ExistingMovies]([Name]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_LeadActor] ON [dbo].[ExistingMovies]([LeadActor]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_LeadActress] ON [dbo].[ExistingMovies]([LeadActress]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Director] ON [dbo].[ExistingMovies]([Director]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Producer] ON [dbo].[ExistingMovies]([Producer]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_DatePurchased] ON [dbo].[ExistingMovies]([DatePurchased]) ON [PRIMARY]
GO


exec sp_addextendedproperty N'MS_Description', N'Movie Identifying Number', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'InventoryID'
GO
exec sp_addextendedproperty N'MS_Description', N'Movie name.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Name'
GO
exec sp_addextendedproperty N'MS_Description', N'Contains the movie rating.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Rating'
GO
exec sp_addextendedproperty N'MS_Description', N'Description of the movie topic.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Description'
GO
exec sp_addextendedproperty N'MS_Description', N'Main film actor.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'LeadActor'
GO
exec sp_addextendedproperty N'MS_Description', N'Main film actress.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'LeadActress'
GO
exec sp_addextendedproperty N'MS_Description', N'Additional characters in film.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'SupportingCast'
GO
exec sp_addextendedproperty N'MS_Description', N'File director.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Director'
GO
exec sp_addextendedproperty N'MS_Description', N'Special notes about the file that aren''t in the description.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Notes'
GO
exec sp_addextendedproperty N'MS_Description', N'Date the movie was originally purchased.', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'DatePurchased'
GO
exec sp_addextendedproperty N'MS_Description', N'Film format including VHS, DVD, and Laserdisk', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'Format'
GO
exec sp_addextendedproperty N'MS_Description', N'Is the movie currently in or out?', N'user', N'dbo', N'table', N'ExistingMovies', N'column', N'IsIn'


GO

