USE [ADMIN]
GO
/****** Object:  User [DocuGate]    Script Date: 08/15/2011 16:54:14 ******/
CREATE USER [DocuGate] FOR LOGIN [RTT] WITH DEFAULT_SCHEMA=[DocuGate]
GO
/****** Object:  Schema [DocuGate]    Script Date: 08/15/2011 16:54:05 ******/
CREATE SCHEMA [DocuGate] AUTHORIZATION [DocuGate]
GO
USE [docugate]
GO
/****** Object:  Table [dbo].[docugate_general_ou]    Script Date: 08/15/2011 16:54:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_ou](
	[OU_GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OU_NAME] [varchar](50) NOT NULL,
	[OU_DESCRIPTION] [varchar](50) NULL,
	[OU_SUPERVISOR] [varchar](50) NOT NULL,
	[OU_SUPERVISOR_EMAIL] [varchar](50) NULL,
	[OU_CHARGE] [varchar](50) NOT NULL,
	[OU_LOWBALANCE] [char](1) NULL,
	[OU_THRESHOLD] [varchar](10) NULL,
	[OU_LOWBAL_TITLE] [varchar](50) NULL,
	[OU_LOWBAL_MSGTXT] [varchar](255) NULL,
	[OU_LOCKED] [char](1) NULL,
	[OU_CODES] [char](1) NULL,
	[OU_ALLOWNEG] [char](1) NULL,
	[OU_DEFAULT_CLIENT] [varchar](50) NULL,
	[OU_DEFAULT_MATTER] [varchar](50) NULL,
	[OU_PRN_MULTIPLR] [varchar](50) NULL,
	[OU_CPY_MULTIPLR] [varchar](50) NULL,
 CONSTRAINT [PK_docugate_ou] PRIMARY KEY CLUSTERED 
(
	[OU_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [ou_ou_name] ON [dbo].[docugate_general_ou] 
(
	[OU_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_general_acc]    Script Date: 08/15/2011 16:54:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_acc](
	[ACC_ACC_GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ACC_TYPE] [varchar](20) NOT NULL,
	[ACC_BADGE] [varchar](50) NULL,
	[ACC_FIRSTNAME] [varchar](50) NULL,
	[ACC_LASTNAME] [varchar](50) NULL,
	[ACC_FULLNAME] [varchar](100) NULL,
	[ACC_CMETHOD] [varchar](50) NULL,
	[ACC_OU_GUID] [uniqueidentifier] NOT NULL,
	[ACC_FUNDS] [decimal](20, 2) NULL,
	[ACC_ACCESS_LEVEL] [int] NULL,
	[ACC_PASSWORD] [varchar](50) NULL,
	[ACC_PASSWORD_ENABLED] [char](1) NULL,
	[ACC_PIN] [varchar](50) NULL,
	[ACC_PIN_ENABLED] [char](1) NULL,
	[ACC_EMAIL] [varchar](100) NULL,
	[ACC_COPYID] [varchar](50) NULL,
	[ACC_COPYPIN] [varchar](10) NULL,
	[ACC_COPYPIN_ENABLED] [char](1) NULL,
	[ACC_LOCKED] [char](1) NULL,
	[ACC_AVAILABILITY] [int] NULL,
	[ACC_DEFAULT_CLIENT] [varchar](50) NULL,
	[ACC_DEFAULT_MATTER] [varchar](50) NULL,
	[ACC_DEFAULT_ONLY] [char](1) NULL,
 CONSTRAINT [PK_docugate_acc] PRIMARY KEY CLUSTERED 
(
	[ACC_ACC_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ACCOUNTS_ACCESS_LEVEL] ON [dbo].[docugate_general_acc] 
(
	[ACC_ACCESS_LEVEL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ACCOUNTS_BADGE] ON [dbo].[docugate_general_acc] 
(
	[ACC_BADGE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ACCOUNTS_LASTNAME] ON [dbo].[docugate_general_acc] 
(
	[ACC_LASTNAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ACCOUNTS_TYPE] ON [dbo].[docugate_general_acc] 
(
	[ACC_TYPE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
USE [ADMIN]
GO
/****** Object:  Table [dbo].[CurrentProcesses]    Script Date: 08/15/2011 16:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CurrentProcesses](
	[SessionName] [varchar](60) NULL,
	[spid] [varchar](4) NULL,
	[status] [varchar](50) NULL,
	[threads] [int] NULL,
	[loginame] [varchar](50) NULL,
	[hostname] [varchar](50) NULL,
	[BlkBy] [varchar](50) NULL,
	[DBName] [varchar](50) NULL,
	[command] [varchar](50) NULL,
	[CPUTime] [int] NULL,
	[DiskIO] [int] NULL,
	[LastBatch] [datetime] NULL,
	[ProgramName] [varchar](100) NULL,
	[sp_id] [varchar](4) NULL,
	[buffercmd] [varchar](300) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
USE [msdb]
GO
/****** Object:  Table [dbo].[backupset]    Script Date: 08/15/2011 16:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[backupset](
	[backup_set_id] [int] IDENTITY(1,1) NOT NULL,
	[backup_set_uuid] [uniqueidentifier] NOT NULL,
	[media_set_id] [int] NOT NULL,
	[first_family_number] [tinyint] NULL,
	[first_media_number] [smallint] NULL,
	[last_family_number] [tinyint] NULL,
	[last_media_number] [smallint] NULL,
	[catalog_family_number] [tinyint] NULL,
	[catalog_media_number] [smallint] NULL,
	[position] [int] NULL,
	[expiration_date] [datetime] NULL,
	[software_vendor_id] [int] NULL,
	[name] [nvarchar](128) NULL,
	[description] [nvarchar](255) NULL,
	[user_name] [nvarchar](128) NULL,
	[software_major_version] [tinyint] NULL,
	[software_minor_version] [tinyint] NULL,
	[software_build_version] [smallint] NULL,
	[time_zone] [smallint] NULL,
	[mtf_minor_version] [tinyint] NULL,
	[first_lsn] [numeric](25, 0) NULL,
	[last_lsn] [numeric](25, 0) NULL,
	[checkpoint_lsn] [numeric](25, 0) NULL,
	[database_backup_lsn] [numeric](25, 0) NULL,
	[database_creation_date] [datetime] NULL,
	[backup_start_date] [datetime] NULL,
	[backup_finish_date] [datetime] NULL,
	[type] [char](1) NULL,
	[sort_order] [smallint] NULL,
	[code_page] [smallint] NULL,
	[compatibility_level] [tinyint] NULL,
	[database_version] [int] NULL,
	[backup_size] [numeric](20, 0) NULL,
	[database_name] [nvarchar](128) NULL,
	[server_name] [nvarchar](128) NULL,
	[machine_name] [nvarchar](128) NULL,
	[flags] [int] NULL,
	[unicode_locale] [int] NULL,
	[unicode_compare_style] [int] NULL,
	[collation_name] [nvarchar](128) NULL,
	[is_password_protected] [bit] NULL,
	[recovery_model] [nvarchar](60) NULL,
	[has_bulk_logged_data] [bit] NULL,
	[is_snapshot] [bit] NULL,
	[is_readonly] [bit] NULL,
	[is_single_user] [bit] NULL,
	[has_backup_checksums] [bit] NULL,
	[is_damaged] [bit] NULL,
	[begins_log_chain] [bit] NULL,
	[has_incomplete_metadata] [bit] NULL,
	[is_force_offline] [bit] NULL,
	[is_copy_only] [bit] NULL,
	[first_recovery_fork_guid] [uniqueidentifier] NULL,
	[last_recovery_fork_guid] [uniqueidentifier] NULL,
	[fork_point_lsn] [numeric](25, 0) NULL,
	[database_guid] [uniqueidentifier] NULL,
	[family_guid] [uniqueidentifier] NULL,
	[differential_base_lsn] [numeric](25, 0) NULL,
	[differential_base_guid] [uniqueidentifier] NULL,
	[compressed_backup_size] [numeric](20, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[backup_set_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [backupsetDate] ON [dbo].[backupset] 
(
	[backup_finish_date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [backupsetuuid] ON [dbo].[backupset] 
(
	[backup_set_uuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[backupmediafamily]    Script Date: 08/15/2011 16:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backupmediafamily](
	[media_set_id] [int] NOT NULL,
	[family_sequence_number] [tinyint] NOT NULL,
	[media_family_id] [uniqueidentifier] NULL,
	[media_count] [int] NULL,
	[logical_device_name] [nvarchar](128) NULL,
	[physical_device_name] [nvarchar](260) NULL,
	[device_type] [tinyint] NULL,
	[physical_block_size] [int] NULL,
	[mirror] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[media_set_id] ASC,
	[family_sequence_number] ASC,
	[mirror] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [backupmediafamilyuuid] ON [dbo].[backupmediafamily] 
(
	[media_family_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
USE [ADMIN]
GO
/****** Object:  Table [dbo].[AppDependencies]    Script Date: 08/15/2011 16:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppDependencies](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Seq] [int] NOT NULL,
	[Prefix] [varchar](255) NULL,
	[Filename] [varchar](255) NULL,
	[VendorCompany] [varchar](255) NULL,
	[Classification] [varchar](255) NULL,
	[PartOfWindows] [char](1) NULL,
	[Product] [varchar](255) NULL,
	[Comments] [varchar](255) NULL,
	[DefaultLocation] [varchar](255) NULL,
	[URL_Info] [varchar](255) NULL,
	[URL_LicenceAgreement] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_AppDependencies] ON [dbo].[AppDependencies] 
(
	[Seq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
USE [docugate]
GO
/****** Object:  StoredProcedure [dbo].[dba_clear_work_tables]    Script Date: 08/15/2011 16:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[dba_clear_work_tables]
as
Truncate table DOCUGATE.dbo.docugate_acc_session
Truncate table DOCUGATE.dbo.docugate_bmt_session_active
Truncate table DOCUGATE.dbo.docugate_bmt_session_detail
Truncate table DOCUGATE.dbo.docugate_bmt_session_image
--
Truncate table DOCUGATE.dbo.docugate_tran_acc_funds
Truncate table DOCUGATE.dbo.docugate_general_guid
Truncate table DOCUGATE.dbo.docugate_general_journel
Truncate table DOCUGATE.dbo.docugate_pnr_active
Truncate table DOCUGATE.dbo.docugate_pnr_detail
Truncate table DOCUGATE.dbo.docugate_pnr_image
Truncate table DOCUGATE.dbo.docugate_report_consolestats
Truncate table DOCUGATE.dbo.docugate_report_quickstats
--
Truncate table DOCUGATE.dbo.docugate_general_activity
--
Update dbo.docugate_general_acc
	set ACC_AVAILABILITY = 1, acc_funds = 0
GO
/****** Object:  StoredProcedure [dbo].[dba_clear_primary_tables]    Script Date: 08/15/2011 16:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[dba_clear_primary_tables]
as
Truncate table DOCUGATE.dbo.docugate_general_ou
Truncate table DOCUGATE.dbo.docugate_general_acc
Truncate table DOCUGATE.dbo.docugate_general_cc
Truncate table DOCUGATE.dbo.docugate_general_cm
Truncate table DOCUGATE.dbo.docugate_general_ctlparams
Truncate table DOCUGATE.dbo.docugate_general_ctlunit
Truncate table DOCUGATE.dbo.docugate_general_global
GO
USE [ADMIN]
GO
/****** Object:  Table [dbo].[TableSpaceUsed]    Script Date: 08/15/2011 16:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableSpaceUsed](
	[SessionName] [varchar](60) NULL,
	[name] [varchar](128) NULL,
	[rows] [int] NULL,
	[reserved] [int] NULL,
	[data] [int] NULL,
	[index_size] [int] NULL,
	[unused] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
USE [msdb]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_backuphistory]    Script Date: 08/15/2011 16:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_delete_backuphistory]
  @oldest_date datetime
AS
BEGIN
  SET NOCOUNT ON

  DECLARE @backup_set_id TABLE      (backup_set_id INT)
  DECLARE @media_set_id TABLE       (media_set_id INT)
  DECLARE @restore_history_id TABLE (restore_history_id INT)

  INSERT INTO @backup_set_id (backup_set_id)
  SELECT DISTINCT backup_set_id
  FROM msdb.dbo.backupset
  WHERE backup_finish_date < @oldest_date

  INSERT INTO @media_set_id (media_set_id)
  SELECT DISTINCT media_set_id
  FROM msdb.dbo.backupset
  WHERE backup_finish_date < @oldest_date

  INSERT INTO @restore_history_id (restore_history_id)
  SELECT DISTINCT restore_history_id
  FROM msdb.dbo.restorehistory
  WHERE backup_set_id IN (SELECT backup_set_id
                          FROM @backup_set_id)

  BEGIN TRANSACTION

  DELETE FROM msdb.dbo.backupfile
  WHERE backup_set_id IN (SELECT backup_set_id
                          FROM @backup_set_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE FROM msdb.dbo.backupfilegroup
  WHERE backup_set_id IN (SELECT backup_set_id
                          FROM @backup_set_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE FROM msdb.dbo.restorefile
  WHERE restore_history_id IN (SELECT restore_history_id
                               FROM @restore_history_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE FROM msdb.dbo.restorefilegroup
  WHERE restore_history_id IN (SELECT restore_history_id
                               FROM @restore_history_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE FROM msdb.dbo.restorehistory
  WHERE restore_history_id IN (SELECT restore_history_id
                               FROM @restore_history_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE FROM msdb.dbo.backupset
  WHERE backup_set_id IN (SELECT backup_set_id
                          FROM @backup_set_id)
  IF (@@error > 0)
    GOTO Quit

  DELETE msdb.dbo.backupmediafamily
  FROM msdb.dbo.backupmediafamily bmf
  WHERE bmf.media_set_id IN (SELECT media_set_id
                             FROM @media_set_id)
    AND ((SELECT COUNT(*)
          FROM msdb.dbo.backupset
          WHERE media_set_id = bmf.media_set_id) = 0)
  IF (@@error > 0)
    GOTO Quit

  DELETE msdb.dbo.backupmediaset
  FROM msdb.dbo.backupmediaset bms
  WHERE bms.media_set_id IN (SELECT media_set_id
                             FROM @media_set_id)
    AND ((SELECT COUNT(*)
          FROM msdb.dbo.backupset
          WHERE media_set_id = bms.media_set_id) = 0)
  IF (@@error > 0)
    GOTO Quit

  COMMIT TRANSACTION
  RETURN

Quit:
  ROLLBACK TRANSACTION

END
GO
USE [ADMIN]
GO
/****** Object:  Table [dbo].[InstallPreparationLog]    Script Date: 08/15/2011 16:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstallPreparationLog](
	[DtCreated] [datetime] NOT NULL,
	[StepNo] [int] IDENTITY(1,1) NOT NULL,
	[StepName] [varchar](128) NULL,
	[StepCheck] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Gsp_SpaceUsed]    Script Date: 08/15/2011 16:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[Gsp_SpaceUsed]
@SessionName varchar(60), @SourceDB	varchar(128)
as
/*
exec Gsp_SpaceUsed 'mydb'
*/

--http://www.nigelrivett.net/SQLAdmin/sp_nrInfo.html

set nocount on

declare @sql varchar(128)
	create table #tables(name varchar(128))
	
	select @sql = 'insert #tables select name from ' + @SourceDB 
		+ '.dbo.sysobjects where type = ''u'' and name not like ''dt%'''
	exec (@sql)
	
	create table #SpaceUsed (name varchar(128), rows varchar(11), reserved varchar(18), data varchar(18), index_size varchar(18), unused varchar(18))
	declare @name varchar(128)
	select @name = ''
	while exists (select * from #tables where name > @name)
	begin
		select @name = min(name) from #tables where name > @name
		select @sql = 'exec ' + @SourceDB + '..sp_executesql N''insert #SpaceUsed exec sp_spaceused ' + @name + ''''
		exec (@sql)
	end

	delete from TableSpaceUsed where SessionName = @SessionName
	insert into TableSpaceUsed (SessionName,name,rows,reserved,data,index_size,unused)
	select @Sessionname,name,
		convert(integer,replace(rows,'KB','')),
		convert(integer,replace(reserved,'KB','')),
		convert(integer,replace(data,'KB','')),
		convert(integer,replace(index_size,'KB','')), 
		convert(integer,replace(unused,'KB',''))
		from #SpaceUsed

	drop table #tables
	drop table #SpaceUsed
GO
/****** Object:  StoredProcedure [dbo].[Gsp_nrInfo]    Script Date: 08/15/2011 16:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Gsp_nrInfo]
@SessionName varchar(60),
@status varchar(20) = 'active' ,
@type   varchar(10) = 'info'
as
/*
exec sp_nrSpidByStatus			-- all spids whith status runnable
exec sp_nrSpidByStatus 'sleeping'	-- all spids whith status sleeping
exec sp_nrSpidByStatus 'background'	-- all spids whith status background
exec sp_nrSpidByStatus 'sleeping'	-- all spids whith status sleeping
exec sp_nrSpidByStatus 'all'		-- all spids
exec sp_nrSpidByStatus 'blk'		-- all blocked or blocking spids
exec sp_nrSpidByStatus '74'		-- an individual spid - also gives subthreads
select * from master..sysprocesses where spid = 56
*/

delete from CurrentProcesses where SessionName = @SessionName

set transaction isolation level read uncommitted
set nocount on
-- Get blocking
declare @blkspid varchar(20)

select top 1 @blkspid = convert(varchar(20),spid) from master..sysprocesses 
where spid in (select blocked from master..sysprocesses)
order by blocked

if @blkspid is not null
begin
	-- this is all that will appear on the intranet
	select 	[blocking spid] = spid ,
		last_batch = last_batch ,
		hostname = left(hostname,14) ,
		program_name = left(program_name,20) ,
		cmd = cmd ,
		physical_io = physical_io
	from master..sysprocesses
	where spid = @blkspid
	
	exec ('dbcc inputbuffer (' + @blkspid + ')')
	
	print  'blocking spid command'
	DECLARE @sql_handle binary(20)
	SELECT	@sql_handle = sql_handle
			FROM master.dbo.sysprocesses
			WHERE	spid = @blkspid
				AND ecid = 0
  			SELECT *
   			FROM ::fn_get_sql(@sql_handle)
	
	print 'sp_who2 result for blocking spid'
	exec ('sp_who2 ' + @blkspid) 
	
	print 'spids that are being blocked'
	select spid, blocked from master..sysprocesses 
	where spid in (select blocked from master..sysprocesses)
	order by blocked
end

declare	@cmd varchar(1000)

declare @buf varchar(1000) ,
	@id int ,
	@spid int ,
	@maxSpid int
	create table #spid (spid int, command varchar(1000) null)
	create table #temp (x varchar(100), y int, s varchar(1000), id int identity (1,1))
	create table #spids (spid int)
	if isnumeric(@status) = 1
	begin
		insert #spids select @status
	end
	else if @status = 'blk'
	begin
		insert	#spids 
		select spid from master..sysprocesses where blocked <> 0
		union
		select blocked from master..sysprocesses where blocked <> 0
	end
	else if @status = 'active'
		insert	#spids 
		select 	distinct spid 
		from 	master..sysprocesses 
		where 	blocked <> 0
		or	upper(cmd)    not in 	(
				                     'AWAITING COMMAND'
				                    ,'MIRROR HANDLER'
				                    ,'LAZY WRITER'
				                    ,'CHECKPOINT SLEEP'
				                    ,'RA MANAGER'
						)
		or lower(status) <> 'sleeping'
	else
	begin
		insert	#spids select spid from master..sysprocesses where (status = @status or @status = 'all') and ecid = 0
	end
	select 	@spid = 0 ,
		@maxSpid = max(spid)
	from	#spids
	
	if @type = 'info'
	begin
		while @spid < @maxSpid
		begin
			select	@spid = min(spid) from #spids where spid > @spid
			
			select @cmd = 'dbcc inputbuffer (' + convert(varchar(10),@spid) + ')'
			
			delete #temp
			
			insert #temp
			exec (@cmd)
			
			select 	@id = 0 ,
				@buf = ''
			select @buf = @buf + replace(replace(s,char(10),'|'),char(13),'|')
	
			from #temp
	
			insert 	#spid
			select	@spid, @buf
		end
	end
	else
	begin
		insert	#spid select spid, '' from #spids
	end
	
	insert into CurrentProcesses
	(SessionName,spid,status,threads,loginame,hostname,BlkBy,DBName,command,
	CPUTime,DiskIO,LastBatch,ProgramName,sp_id,buffercmd)
	select 	@SessionName, 
		spid 		= convert(varchar(4),#spid.spid) ,
		status 		= min(left(case when s.status = 'Runnable' then 'aRunnable' else 'z' + s.status end ,12)) ,
		threads		= count(*) ,
		loginame 	= min(left(s.loginame, 25)) ,
		hostname	= min(left (s.hostname, 14)) ,
		BlkBy		= max(case when s.blocked <> 0 then convert(varchar(3),s.blocked) else '   ' end) ,
		DBName		= left(db_name(min(dbid)), 10) ,
		command		= min(left(s.cmd, 30)) ,
		CPUTime		= sum(s.cpu) ,
		DiskIO		= sum(s.physical_io) ,
		LastBatch	= max(convert(varchar(23),s.last_batch,121)) ,
		ProgramName	= min(left(s.program_name, 30)) ,
		spid		= convert(varchar(4),#spid.spid) ,
		buffercmd	= max(#spid.command)
	from	#spid ,
		master..sysprocesses s
	where	s.spid = #spid.spid
	group by #spid.spid
	order by convert(int,#spid.spid) desc

	drop table #spid
	drop table #temp
GO
/****** Object:  StoredProcedure [dbo].[dba_clear_all_tables]    Script Date: 08/15/2011 16:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[dba_clear_all_tables]
as
  truncate table dbo.CurrentProcesses
  truncate table dbo.TableSpaceUsed
GO
/****** Object:  View [dbo].[v_BackupLog]    Script Date: 08/15/2011 16:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[v_BackupLog]
as
Select backup_set_id, backup_start_date, 
database_name, user_name, physical_device_name,server_name
 from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b
on a.media_set_id = b.media_set_id
where physical_device_name not like 'c:\temp\%'
GO
/****** Object:  StoredProcedure [dbo].[dba_InstallPreparationLog]    Script Date: 08/15/2011 16:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


   exec dba_InstallPreparationLog 'Lynette Austin'
   select * from InstallPreparationLog
   select * from docugate.dbo.docugate_general_ou
   select * from docugate.dbo.docugate_general_acc
*/


CREATE   procedure [dbo].[dba_InstallPreparationLog] (@DeveloperName varchar(30))
as
  set nocount on

  truncate table dbo.InstallPreparationLog

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Comments-1', 'This is a log of the steps taken to prepare the two DocuGate 
databases for rollout and distribution.')

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Comments-2','The installer installs the two databases: ADMIN and DOCUGATE, 
with complete structures and only static data.')

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Comments-3','After installation, these two blank database are restore to the backups
prepared in this procedure.')

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Comments-4','These two backups are included are distirubtion files in the installation script.')

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Prepared at Server', convert(varchar(128),Serverproperty('ServerName')))

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Prepared at Instance', convert(varchar(128),Serverproperty('InstanceName')))

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Prepared by', @DeveloperName)

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Edition', convert(varchar(128),Serverproperty('edition')))

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Engine Edition', convert(varchar(128),Serverproperty('edition')))

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Version', convert(varchar(128),Serverproperty('productversion')))

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Level', convert(varchar(128),Serverproperty('productlevel')))

  --*
  /*delete from admin.dbo.sysusers where name not in ( 'public','guest')
  and name not like 'db_%'
  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  select 'Admin db: user count', count(*)
      from admin.dbo.sysusers where name not in ( 'public','guest')
      and name not like 'db_%'

  delete from docugate.dbo.sysusers where name not in ( 'public','guest')
  and name not like 'db_%'
  select 'DocuGate db: user count', count(*)
      from admin.dbo.sysusers where name not in ( 'public','guest')
      and name not like 'db_%' */

  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  select 'Backup history log count',count(*) from admin.dbo.v_BackupLog

  exec admin.dbo.dba_clear_all_tables
  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('Admin tables cleared','')

  exec docugate.dbo.dba_clear_primary_tables
  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('DocuGate primary tables cleared','')

  exec docugate.dbo.dba_clear_work_tables
  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  values ('DocuGate work tables cleared','')


  exec docugate.dbo.dba_clear_work_tables
  insert into dbo.InstallPreparationLog (StepName,StepCheck)
  	values ('Backups completed','')

   insert into docugate.dbo.docugate_general_ou
   (OU_NAME,OU_DESCRIPTION,OU_SUPERVISOR,OU_SUPERVISOR_EMAIL,OU_CHARGE,
    OU_LOWBALANCE,OU_THRESHOLD,OU_LOWBAL_TITLE,OU_LOWBAL_MSGTXT,
    OU_LOCKED,OU_CODES,OU_ALLOWNEG,OU_DEFAULT_CLIENT,OU_DEFAULT_MATTER,
    OU_PRN_MULTIPLR,OU_CPY_MULTIPLR)
    values
	('DOCUGATE','DOCUGATE','','','CREDIT',0,'','','',0,0,0,'','',1.00,1.00)

    INSERT INTO docugate.dbo.docugate_general_acc 
     (ACC_TYPE,ACC_BADGE,ACC_FIRSTNAME,ACC_LASTNAME,ACC_FULLNAME,ACC_CMETHOD,
      ACC_OU_GUID,ACC_FUNDS,ACC_ACCESS_LEVEL,ACC_PASSWORD,ACC_PASSWORD_ENABLED,
      ACC_PIN,ACC_PIN_ENABLED,ACC_EMAIL,ACC_COPYID,ACC_COPYPIN,ACC_COPYPIN_ENABLED,
      ACC_LOCKED,ACC_AVAILABILITY,ACC_DEFAULT_CLIENT,
      ACC_DEFAULT_MATTER,ACC_DEFAULT_ONLY)
    SELECT 'PERMANENT','ADMIN','DOCUGATE','ADMINISTRATOR','DOCUGATE ADMINISTRATOR','CREDIT',
      OU_GUID,0,3,'ADMIN',1,NULL,0,'','ADMIN','ADMIN',0,0,1,'','',0
      FROM docugate.dbo.docugate_general_ou


   backup database admin
	 to disk = 'C:\My Downloads\Docugate\DocuGate\DocuGate (DGAdministrator)\Development\bin\ADMIN-BCK.'
	 with init
   backup database docugate 
	to disk =  'C:\My Downloads\Docugate\DocuGate\DocuGate (DGAdministrator)\Development\bin\DOCUGATE-BCK.'
	with init

  declare @OldestDt datetime
  set @OldestDt = getdate()
  exec msdb.dbo.sp_delete_backuphistory @OldestDt
GO
/****** Object:  Default [DF__InstallPr__DtCre__498EEC8D]    Script Date: 08/15/2011 16:54:14 ******/
ALTER TABLE [dbo].[InstallPreparationLog] ADD  CONSTRAINT [DF__InstallPr__DtCre__498EEC8D]  DEFAULT (getdate()) FOR [DtCreated]
GO
USE [docugate]
GO
/****** Object:  Default [DF_docugate_ou_OU_GUID]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF_docugate_ou_OU_GUID]  DEFAULT (newid()) FOR [OU_GUID]
GO
/****** Object:  Default [DF_docugate_ou_OU_CHARGE]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF_docugate_ou_OU_CHARGE]  DEFAULT ('NA') FOR [OU_CHARGE]
GO
/****** Object:  Default [DF__docugate___COLOR__5B0E7E4A]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF__docugate___COLOR__5B0E7E4A]  DEFAULT ('1.00') FOR [OU_PRN_MULTIPLR]
GO
/****** Object:  Default [DF__docugate___CPY_M__5C02A283]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF__docugate___CPY_M__5C02A283]  DEFAULT ('1.00') FOR [OU_CPY_MULTIPLR]
GO
/****** Object:  Default [DF_docugate_acc_ACC_GUID]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_acc_ACC_GUID]  DEFAULT (newid()) FOR [ACC_ACC_GUID]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_TYPE]    Script Date: 08/15/2011 16:54:18 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_TYPE]  DEFAULT ('PERMANENT') FOR [ACC_TYPE]
GO
/****** Object:  Default [DF_docugate_accounts_BADGE]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_BADGE]  DEFAULT ('') FOR [ACC_BADGE]
GO
/****** Object:  Default [DF_docugate_accounts_FIRSTNAME]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_FIRSTNAME]  DEFAULT ('') FOR [ACC_FIRSTNAME]
GO
/****** Object:  Default [DF_docugate_accounts_LASTNAME]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_LASTNAME]  DEFAULT ('') FOR [ACC_LASTNAME]
GO
/****** Object:  Default [DF_docugate_accounts_FULLNAME]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_FULLNAME]  DEFAULT ('') FOR [ACC_FULLNAME]
GO
/****** Object:  Default [DF_docugate_accounts_ACCESS_LEVEL]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_ACCESS_LEVEL]  DEFAULT ((3)) FOR [ACC_ACCESS_LEVEL]
GO
/****** Object:  Default [DF_docugate_accounts_PASSWORD]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_PASSWORD]  DEFAULT ('') FOR [ACC_PASSWORD]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_PASSWORD_ENABLED]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_PASSWORD_ENABLED]  DEFAULT ((0)) FOR [ACC_PASSWORD_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_PIN_ENABLED]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_PIN_ENABLED]  DEFAULT ((0)) FOR [ACC_PIN_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_COPYPIN_ENABLED]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_COPYPIN_ENABLED]  DEFAULT ((0)) FOR [ACC_COPYPIN_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_LOCKED]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_LOCKED]  DEFAULT ((0)) FOR [ACC_LOCKED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_AVAILABILITY]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_AVAILABILITY]  DEFAULT ((1)) FOR [ACC_AVAILABILITY]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_DEFAULT_ONLY]    Script Date: 08/15/2011 16:54:19 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_DEFAULT_ONLY]  DEFAULT ((0)) FOR [ACC_DEFAULT_ONLY]
GO
USE [msdb]
GO
/****** Object:  Default [DF__backupmed__mirro__0B5CAFEA]    Script Date: 08/15/2011 16:54:23 ******/
ALTER TABLE [dbo].[backupmediafamily] ADD  DEFAULT ((0)) FOR [mirror]
GO
/****** Object:  ForeignKey [FK__backupset__media__10216507]    Script Date: 08/15/2011 16:54:22 ******/
ALTER TABLE [dbo].[backupset]  WITH CHECK ADD FOREIGN KEY([media_set_id])
REFERENCES [dbo].[backupmediaset] ([media_set_id])
GO
/****** Object:  ForeignKey [FK__backupmed__media__0A688BB1]    Script Date: 08/15/2011 16:54:22 ******/
ALTER TABLE [dbo].[backupmediafamily]  WITH CHECK ADD FOREIGN KEY([media_set_id])
REFERENCES [dbo].[backupmediaset] ([media_set_id])
GO
