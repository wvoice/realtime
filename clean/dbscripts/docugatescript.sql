USE [DOCUGATE]
GO
/****** Object:  User [DocuGate]    Script Date: 08/15/2011 16:56:24 ******/
CREATE USER [DocuGate] FOR LOGIN [RTT] WITH DEFAULT_SCHEMA=[DocuGate]
GO
/****** Object:  Schema [DocuGate]    Script Date: 08/15/2011 16:56:12 ******/
CREATE SCHEMA [DocuGate] AUTHORIZATION [DocuGate]
GO
/****** Object:  Table [dbo].[docugate_general_active_session]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_general_active_session](
	[ACC_GUID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ACC_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_general_acc_maxspend]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_acc_maxspend](
	[ACC_GUID] [uniqueidentifier] NOT NULL,
	[ENABLED] [int] NOT NULL,
	[AMOUNT] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ACC_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_acc_details]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_acc_details](
	[ACC_GUID] [uniqueidentifier] NOT NULL,
	[ACC_ADDRESS] [varchar](255) NULL,
	[ACC_ZIP] [varchar](50) NULL,
	[ACC_CELL] [varchar](50) NULL,
	[ACC_PHONE] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ACC_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_bmt_session_image]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_bmt_session_image](
	[BMT_SESSION_IMAGE_GUID] [uniqueidentifier] NOT NULL,
	[BMT_SESSION_IMAGE_OPENED] [image] NOT NULL,
	[BMT_SESSION_iMAGE_CLOSED] [image] NOT NULL,
 CONSTRAINT [PK_docugate_session_images] PRIMARY KEY CLUSTERED 
(
	[BMT_SESSION_IMAGE_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_bmt_session_detail]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_bmt_session_detail](
	[BMT_SESSION_DETAIL_GUID] [uniqueidentifier] NOT NULL,
	[BMT_SESSION_DETAIL_STARTED] [datetime] NOT NULL,
	[BMT_SESSION_DETAIL_ENDED] [datetime] NOT NULL,
	[BMT_SESSION_DETAIL_DURATION] [int] NOT NULL,
 CONSTRAINT [PK_docugate_bmt_session_detail] PRIMARY KEY CLUSTERED 
(
	[BMT_SESSION_DETAIL_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_bmt_session_active]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_bmt_session_active](
	[BMT_SESSION_ACTIVE_GUID] [uniqueidentifier] NOT NULL,
	[BMT_SESSION_ACTIVE_BADGE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_docugate_bmt_session_active] PRIMARY KEY CLUSTERED 
(
	[BMT_SESSION_ACTIVE_BADGE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_ou_maxspend]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_ou_maxspend](
	[OU_GUID] [uniqueidentifier] NOT NULL,
	[ENABLED] [int] NOT NULL,
	[AMOUNT] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OU_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_ou]    Script Date: 08/15/2011 16:56:22 ******/
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
/****** Object:  Table [dbo].[docugate_general_journel]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_journel](
	[JOURNEL_PNR_GUID] [uniqueidentifier] NULL,
	[JOURNEl_BMT_GUID] [uniqueidentifier] NULL,
	[JOURNEL_TYPE] [varchar](50) NULL,
	[JOURNEL_DT] [datetime] NULL,
	[JOURNEL_ENTRY] [varchar](255) NULL,
	[JOURNEL_ACC_GUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_guid]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_general_guid](
	[GUID_GUID] [uniqueidentifier] NOT NULL,
	[GUID_ACC_GUID] [uniqueidentifier] NOT NULL,
	[GUID_REQUESTED] [timestamp] NOT NULL,
 CONSTRAINT [PK_docugate_guids] PRIMARY KEY CLUSTERED 
(
	[GUID_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_general_global]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_global](
	[GLOBALS_ACTIVITY_QUOTA] [varchar](10) NULL,
	[GLOBALS_DISK_QUOTA] [varchar](10) NULL,
	[GLOBALS_SFBW] [varchar](50) NULL,
	[GLOBALS_LFBW] [varchar](50) NULL,
	[GLOBALS_SFCOLOR] [varchar](50) NULL,
	[GLOBALS_LFCOLOR] [varchar](50) NULL,
	[GLOBALS_ADDIT_CHRG_SCANS] [varchar](50) NULL,
	[GLOBALS_ADDIT_CHRG_FAXES] [varchar](50) NULL,
	[GLOBALS_ADDIT_CHRG_EMAILS] [varchar](50) NULL,
	[GLOBALS_SITE_MULTIPLR] [varchar](50) NULL,
	[GLOBALS_EXT1] [varchar](50) NULL,
	[GLOBALS_EXT2] [varchar](50) NULL,
	[GLOBALS_EXT3] [varchar](50) NULL,
	[GLOBALS_EXT4] [varchar](50) NULL,
	[GLOBALS_EXT5] [varchar](50) NULL,
	[GLOBALS_EXT_MULTIPLR1] [varchar](50) NULL,
	[GLOBALS_EXT_MULTIPLR2] [varchar](50) NULL,
	[GLOBALS_MAXSPEND] [varchar](50) NULL,
	[GLOBALS_MAXSPEND_ENABLED] [int] NULL,
	[GLOBALS_UNITVALUE] [varchar](50) NULL,
	[GLOBALS_UNITVALUE_ENABLED] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_ctlunit_custom_pl]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_ctlunit_custom_pl](
	[CTLUNIT_GUID] [uniqueidentifier] NOT NULL,
	[ENABLED] [int] NULL,
	[PL1] [varchar](50) NULL,
	[PL2] [varchar](50) NULL,
	[PL3] [varchar](50) NULL,
	[PL4] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTLUNIT_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_ctlunit]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_ctlunit](
	[CTLUNIT_GUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CTLUNIT_SERIAL_NO] [varchar](50) NOT NULL,
	[CTLUNIT_TERMINALTYPE] [int] NULL,
	[CTLUNIT_DESCRIPTION] [varchar](50) NULL,
	[CTLUNIT_LOCATION] [varchar](50) NULL,
	[CTLUNIT_MODEL] [varchar](10) NULL,
	[CTLUNIT_SPECIAL] [char](1) NULL,
	[CTLUNIT_STATUS] [varchar](255) NULL,
	[CTLUNIT_DEVICE] [varchar](50) NULL,
	[CTLUNIT_MAC] [varchar](50) NULL,
	[CTLUNIT_IP] [varchar](50) NULL,
	[CTLUNIT_PORT_NO] [int] NULL,
	[CTLUNIT_CONN_RESET] [int] NULL,
	[CTLUNIT_KEYBRD_MODE] [varchar](50) NULL,
	[CTLUNIT_PULSE_IDLE_MIN] [int] NULL,
	[CTLUNIT_REQ_CLIENT] [char](1) NULL,
	[CTLUNIT_REQ_MATTER] [char](1) NULL,
	[CTLUNIT_COPYPIN_ENABLED] [char](1) NULL,
	[CTLUNIT_OU_GUID] [uniqueidentifier] NULL,
	[CTLUNIT_LATEST] [datetime] NULL,
 CONSTRAINT [docugate_ctlunit_idx1] PRIMARY KEY CLUSTERED 
(
	[CTLUNIT_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_ctlparams]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_ctlparams](
	[CTLPARM_ACC_ACC_GUID] [uniqueidentifier] NULL,
	[CTLPARM_PIN] [varchar](4) NULL,
	[CTLPARM_ACCOUNTENABLED] [char](1) NULL,
	[CTLPARM_COMPANY] [varchar](15) NULL,
	[CTLPARM_IDPROMPT] [varchar](16) NULL,
	[CTLPARM_IDENABLED] [char](1) NULL,
	[CTLPARM_PINPROMPT] [varchar](16) NULL,
	[CTLPARM_PINENABLED] [char](1) NULL,
	[CTLPARM_CLIENTPROMPT] [varchar](16) NULL,
	[CTLPARM_CLIENTENABLED] [char](1) NULL,
	[CTLPARM_MATTERPROMPT] [varchar](16) NULL,
	[CTLPARM_MATTERENABLED] [char](1) NULL,
	[CTLPARM_COPYTIMEOUT] [int] NULL,
	[CTLPARM_USERIDMODE] [int] NULL,
	[CTLPARM_CLIENTSCROLLENABLED] [char](1) NULL,
	[CTLPARM_MATTERSCROLLENABLED] [char](1) NULL,
	[CTLPARM_USDATE] [char](1) NULL,
	[CTLPARM_AUTOMODE] [char](1) NULL,
	[CTLPARM_ACCOUNTSCROLL] [char](1) NULL,
	[CTLPARM_AUTORELEASE] [char](1) NULL,
	[CTLPARM_RELEASEMODE] [char](1) NULL,
	[F3TASK] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_cm]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_cm](
	[CM_GUID] [uniqueidentifier] NOT NULL,
	[CC_GUID] [uniqueidentifier] NOT NULL,
	[CM_DESCRIPTION] [varchar](50) NULL,
	[CM_CUSTOM] [varchar](50) NULL,
	[CM_MATTER] [varchar](50) NULL,
 CONSTRAINT [docugate_cm_idx1] PRIMARY KEY CLUSTERED 
(
	[CM_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[eCashier_logons]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[eCashier_logons](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[guidecashier] [uniqueidentifier] NOT NULL,
	[guidacc] [uniqueidentifier] NULL,
	[copyid] [varchar](50) NOT NULL,
	[copypin] [varchar](10) NULL,
	[result] [varchar](20) NOT NULL,
	[mode] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[eCashier_History]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[eCashier_History](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[trandate] [datetime] NOT NULL,
	[ecguid] [varchar](50) NOT NULL,
	[funccode] [varchar](50) NULL,
	[accguid] [varchar](50) NULL,
	[rq_bill0] [int] NULL,
	[rq_bill1] [int] NULL,
	[rq_bill2] [int] NULL,
	[rq_bill3] [int] NULL,
	[rq_bill4] [int] NULL,
	[rq_bill5] [int] NULL,
	[rq_bill6] [int] NULL,
	[rq_bill7] [int] NULL,
	[lq_bill0] [int] NULL,
	[lq_bill1] [int] NULL,
	[lq_bill2] [int] NULL,
	[lq_bill3] [int] NULL,
	[lq_bill4] [int] NULL,
	[lq_bill5] [int] NULL,
	[lq_bill6] [int] NULL,
	[lq_bill7] [int] NULL,
	[rq_reset] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_tran_codes]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_tran_codes](
	[GUID] [uniqueidentifier] NOT NULL,
	[CODE] [varchar](10) NOT NULL,
	[REASON] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_tran_acc_funds]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_tran_acc_funds](
	[ACC_TRAN_GUID] [uniqueidentifier] NOT NULL,
	[ACC_TRAN_ACC_BADGE] [varchar](50) NOT NULL,
	[ACC_TRAN_ACC_FULLNAME] [varchar](100) NULL,
	[ACC_TRAN_ACC_OU_NAME] [varchar](50) NULL,
	[ACC_TRAN_DT] [datetime] NULL,
	[ACC_TRAN_TYPE] [varchar](50) NULL,
	[ACC_TRAN_DOER_BADGE] [varchar](50) NULL,
	[ACC_TRAN_DOER_FULLNAME] [varchar](100) NULL,
	[ACC_TRAN_DOER_OU_NAME] [varchar](50) NULL,
	[ACC_TRAN_FUND_OPEN_BAL] [decimal](20, 2) NULL,
	[ACC_TRAN_FUND_CLOSE_BAL] [decimal](20, 2) NULL,
	[ACC_TRAN_AMT_DEBIT] [decimal](20, 2) NULL,
	[ACC_TRAN_AMT_CREDIT] [decimal](20, 2) NULL,
	[ACC_TRAN_CMETHOD] [varchar](50) NULL,
	[ACC_TRAN_RECEIPT_NO] [int] NULL,
	[ACC_TRAN_RECEIPT_NO_DISPLAY] [varchar](50) NULL,
	[ACC_TRAN_CUSTOM1] [varchar](50) NULL,
	[ACC_TRAN_CUSTOM2] [varchar](50) NULL,
	[ACC_TRAN_CUSTOM3] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ecashier_transactions]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ecashier_transactions](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[guidecashier] [uniqueidentifier] NOT NULL,
	[guidacc] [uniqueidentifier] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[sbal] [decimal](18, 2) NOT NULL,
	[ebal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ecashier_transactions] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_static_terminaltype]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_static_terminaltype](
	[TERMINALTYPE] [int] NOT NULL,
	[TERMINALTYPE_DESC] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_static_tableinfo]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_static_tableinfo](
	[TableId] [int] NOT NULL,
	[Tablename] [varchar](100) NULL,
	[Alias] [varchar](100) NULL,
	[ShowInQuickStats] [char](1) NULL,
	[GroupNo] [int] NULL,
 CONSTRAINT [PK_docugate_table_info] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_report_quickstats]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_report_quickstats](
	[SessionName] [varchar](60) NULL,
	[RowId] [int] NULL,
	[DataDesc1] [varchar](100) NULL,
	[DataValue1] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_report_consolestats]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_report_consolestats](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[SessionName] [varchar](60) NOT NULL,
	[StatsId] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[StartDate] [varchar](100) NULL,
	[EndDate] [varchar](100) NULL,
	[DataDesc1] [varchar](100) NULL,
	[DataValue1] [decimal](20, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_receipt_number]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_receipt_number](
	[RECEIPT_NO] [int] IDENTITY(1,1) NOT NULL,
	[RECEIPT_ACC_BADGE] [varchar](50) NULL,
	[RECEIPT_DT_CHKOUT] [datetime] NULL,
	[RECEIPT_DT_CHKIN] [datetime] NULL,
	[RECEIPT_CUSTOM1] [varchar](50) NULL,
	[RECEIPT_CUSTOM2] [varchar](50) NULL,
	[RECEIPT_CUSTOM3] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_pnr_image]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_pnr_image](
	[PNR_IMAGE_PNR_GUID] [uniqueidentifier] NOT NULL,
	[PNR_IMAGE_SIZE] [bigint] NOT NULL,
	[PNR_IMAGE_IMAGE] [image] NOT NULL,
 CONSTRAINT [PK_docugate_blobs] PRIMARY KEY CLUSTERED 
(
	[PNR_IMAGE_PNR_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_pnr_detail]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_pnr_detail](
	[PNR_DETAIL_PNR_GUID] [uniqueidentifier] NOT NULL,
	[PNR_DETAIL_ODM] [varchar](10) NOT NULL,
	[PNR_DETAIL_OCC] [varchar](10) NOT NULL,
 CONSTRAINT [docugate_pnr_detail_idx1] PRIMARY KEY CLUSTERED 
(
	[PNR_DETAIL_PNR_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_pnr_active]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_pnr_active](
	[PNR_ACTIVE_PNR_GUID] [uniqueidentifier] NOT NULL,
	[PNR_ACTIVE_ACC_GUID] [uniqueidentifier] NULL,
	[PNR_ACTIVE_LOGGED] [datetime] NULL,
	[PNR_ACTIVE_STATUS] [varchar](50) NULL,
	[PNR_ACTIVE_PROCESSED] [datetime] NULL,
 CONSTRAINT [PK_docugate_pnr_active] PRIMARY KEY CLUSTERED 
(
	[PNR_ACTIVE_PNR_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_acc_session]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_acc_session](
	[acc_session_guid] [uniqueidentifier] NOT NULL,
	[acc_session_acc_guid] [uniqueidentifier] NOT NULL,
	[acc_session_trans_type] [varchar](50) NOT NULL,
	[acc_session_trans_name] [varchar](50) NOT NULL,
	[acc_session_trans_cost] [varchar](50) NOT NULL,
	[acc_session_trans_stamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docugate_general_activity_pl]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docugate_general_activity_pl](
	[JOB_GUID] [uniqueidentifier] NOT NULL,
	[PL1] [int] NOT NULL,
	[PL2] [int] NOT NULL,
	[PL3] [int] NOT NULL,
	[PL4] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JOB_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docugate_general_activity_journel]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_activity_journel](
	[j_row] [uniqueidentifier] NOT NULL,
	[j_guid] [uniqueidentifier] NOT NULL,
	[j_date] [datetime] NOT NULL,
	[j_amount] [varchar](50) NOT NULL,
	[j_type] [varchar](50) NOT NULL,
	[j_desc] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[j_row] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[udf_Txt_FixLenR]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[udf_Txt_FixLenR] (

    @sSource as varchar (8000) -- string to be justified
  , @nTargetLength as int      -- length of the resulting string
  , @sPadCharacters as varchar(255) = ' ' -- characters(s) to pad on left
)   RETURNS VARCHAR (8000)
    
/*
* Right justifies @sSource String in a field of @nTargetLength.
* Padding is done with @sPadCharacters.
*
* Examples:
select dbo.udf_Txt_FixLenR ('123', 8, '0') -- zero filled numeric field
* Test:
PRINT 'Test 1  zero fill ' + case when '00000123' = 
        dbo.udf_Txt_FixLenR ('123', 8, '0') THEN 'Worked' ELSE 'ERROR' END
****************************************************************/
AS BEGIN 

DECLARE @result AS varchar (8000)

SELECT @result = Right(Replicate (@sPadCharacters
                                , @nTargetLength) 
                        + rtrim(@sSource)
                       ,@nTargetLength
                       )
RETURN @result
END
GO
/****** Object:  Table [dbo].[lp_lab_params]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lp_lab_params](
	[fp_start] [varchar](50) NULL,
	[fp_length] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lp_lab_machines]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lp_lab_machines](
	[lp_lab_name] [varchar](50) NOT NULL,
	[lp_machine_name] [varchar](50) NOT NULL,
	[lp_machine_fp_expire] [datetime] NOT NULL,
	[lp_machine_user] [varchar](50) NULL,
	[lp_machine_status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[lp_machine_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lp_lab]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lp_lab](
	[lp_lab_name] [varchar](50) NOT NULL,
	[lp_lab_fp_expire] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lp_lab_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_function_assist_random]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[view_function_assist_random]

    --WITH SCHEMABINDING
/*
* A view to return one row, with one column, a random number from
* the built-in function RAND().  This allows a user defined
* function to bypass the restriction on access to this 
* non-deterministic function.  However, since no seed is 
* provided, it will return the same value for all invocations 
* within a query as seen in this query:

select r1.[RAND], r2.[RAND] from Function_Assist_RAND as r1
               cross join Function_Assist_RAND as r2

* Related Functions: udf_Num_RandInt
* 
* Example:
select r1.[RAND] from Function_Assist_RAND
*
* c Copyright 2003 Andrew Novick http://www.NovickSoftware.com
* You may use this function in any of your SQL Server databases
* including databases that you sell, so long as they contain 
* other unrelated database objects. You may not publish this 
* View either in print or electronically.
* Originally Published in T-SQL UDF of the Week Vol 1 #21 4/8/03
http://www.NovickSoftware.com/UDFofWeek/UDFofWeek.com
****************************************************************/

AS 
    SELECT RAND() as [RAND]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetDateRangeSQL]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_GetDateRangeSQL] (
     @Fieldname varchar(50)
    ,@StartDt datetime
    ,@EndDt datetime 
)   RETURNS varchar(300)
    WITH SCHEMABINDING

AS BEGIN

    Declare @RetSQL varchar(300)
    set @RetSQL ='DATEDIFF(DAY,' + @Fieldname + ',''' + convert(char(10),@StartDt,121) + ''') <= 0'  
        + ' AND DATEDIFF(DAY,' + @Fieldname + ',''' + convert(char(10),@StartDt,121) + ''') >= 0'
    RETURN @RetSQL
END
GO
/****** Object:  UserDefinedFunction [dbo].[udf_Txt_TrimSetNullIfBlank]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[udf_Txt_TrimSetNullIfBlank]
( @InputStr varchar(255))
returns varchar(255) 
as
begin
  declare @tStr as varchar(255)
  set @tStr =ltrim(rtrim( isnull(@InputStr,'')))
  return (@tStr)
end
GO
/****** Object:  UserDefinedFunction [dbo].[udf_Txt_FmtAmt]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_Txt_FmtAmt] (

    @Amt as money -- the amount to be formatted
  , @nTargetLength as int = 12 -- length of the output
  , @sPadChar char(1) = ' ' -- pad character
)   RETURNS varchar (255)
  
/*
* Formats an amount with 2 decimal places and right justification
* to the specified number of characters, padding with @sPadChar.
*
* Example:
select dbo.udf_Txt_FmtAmt (1234.9931, 8, '0') -- zero filled
****************************************************************/
AS BEGIN 
	
RETURN dbo.udf_Txt_FixLenR (CONVERT(varchar(255), ROUND(@amt, 2))
                          , @nTargetLength
                          , @sPadChar)
end
GO
/****** Object:  View [dbo].[eCashier_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
**
** eCashier_view required fot the AVS unit
** Added 05/20/2009
**
**/

CREATE VIEW [dbo].[eCashier_view]
AS
SELECT     dbo.docugate_general_acc.ACC_BADGE AS badge, dbo.docugate_general_acc.ACC_FIRSTNAME AS firstname, 
                      dbo.docugate_general_acc.ACC_LASTNAME AS lastname, dbo.docugate_general_acc.ACC_FULLNAME AS fullname, 
                      dbo.docugate_general_acc.ACC_OU_GUID AS guidou, dbo.docugate_general_acc.ACC_FUNDS AS funds, 
                      dbo.docugate_general_acc.ACC_ACC_GUID AS guidacc, dbo.docugate_general_acc.ACC_EMAIL AS email, 
                      dbo.docugate_general_acc.ACC_COPYID AS copyid, dbo.docugate_general_acc.ACC_COPYPIN AS copypin, 
                      dbo.docugate_general_ou.OU_NAME AS ouname, dbo.docugate_general_acc.ACC_COPYPIN_ENABLED AS pinrequired, 
                      dbo.docugate_general_acc.ACC_ACCESS_LEVEL AS access, dbo.docugate_general_acc.ACC_PASSWORD_ENABLED AS addacct, 
                      dbo.docugate_general_acc.ACC_PASSWORD AS password
FROM         dbo.docugate_general_acc INNER JOIN
                      dbo.docugate_general_ou ON dbo.docugate_general_acc.ACC_OU_GUID = dbo.docugate_general_ou.OU_GUID
GO
/****** Object:  View [dbo].[docugate_ou_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[docugate_ou_view]
AS
  SELECT TOP 100 PERCENT *
  from dbo.docugate_general_ou
  order by OU_NAME
GO
/****** Object:  View [dbo].[docugate_guid_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_guid_view]
AS
SELECT     TOP 100 PERCENT dbo.docugate_general_acc.ACC_BADGE AS BADGE, 
dbo.docugate_general_guid.GUID_GUID AS GUID, 
dbo.docugate_general_guid.GUID_REQUESTED AS REQUESTED
FROM dbo.docugate_general_acc INNER JOIN
dbo.docugate_general_guid 
ON dbo.docugate_general_acc.ACC_ACC_GUID = dbo.docugate_general_guid.GUID_ACC_GUID
GO
/****** Object:  UserDefinedFunction [dbo].[udf_Num_RandInt]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       FUNCTION [dbo].[udf_Num_RandInt] (

    @MinNum int = 0   -- lowest value
   ,@MaxNum int = 100 -- highest value in range
)   RETURNS INT -- int between @MinNum and @MaxNum inclusive
    --WITH SCHEMABINDING
/*
* Returns a random integer between @MinNum and @MaxNum inclusive.
* Note that while the query "SELECT RAND(), RAND()"  always 
* returns the same two values, 
  select dbo.udf_NumRandIntFromRange (1, 100)
       , dbo.udf_NumRandIntFromRange (1, 100)
* returns two different values.  That's because the view is 
* executed separately for each function invocation.
*
* Example:
select dbo.udf_Num_RandInt (1, 100)
*
* c Copyright 2003 Andrew Novick http://www.NovickSoftware.com
* You may use this function in any of your SQL Server databases
* including databases that you sell, so long as they contain 
* other unrelated database objects. You may not publish this 
* UDF either in print or electronically.
* Published in T-SQL UDF of the Week Newsletter Vol 1 #21 4/8/03
http://www.NovickSoftware.com/UDFofWeek/UDFofWeek.htm
****************************************************************/
AS BEGIN

    Declare @Result int
    DECLARE @RAND float -- the random number
  
    SELECT @RAND = [RAND] From dbo.view_function_assist_random

    RETURN ROUND(@MinNum + (@RAND * (@MaxNum - @MinNum)), 0) 
END
GO
/****** Object:  Table [dbo].[docugate_general_activity]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_activity](
	[JOB_GUID] [uniqueidentifier] NOT NULL,
	[ACC_BADGE] [varchar](50) NULL,
	[COPIES] [int] NULL,
	[COLOR] [int] NULL,
	[DUPLEX] [int] NULL,
	[DT_REQUESTED] [datetime] NOT NULL,
	[DT_DELETION] [datetime] NULL,
	[JOBSTATUS] [int] NULL,
	[DOCNAME] [varchar](100) NULL,
	[PAGECOUNT] [int] NULL,
	[COMPUTERNAME] [varchar](50) NULL,
	[PRINTERNAME] [varchar](50) NULL,
	[JOBTYPE] [int] NULL,
	[JOBCOST] [decimal](20, 2) NULL,
	[CC_CODE] [varchar](50) NULL,
	[CM_MATTER] [varchar](50) NULL,
	[OU_NAME] [varchar](50) NULL,
	[CTLUNIT_SERIAL_NO] [varchar](50) NULL,
	[COMMENTS] [varchar](255) NULL,
	[RECEIPT_NO] [int] NULL,
	[ACC_GUID] [uniqueidentifier] NULL,
	[OU_GUID] [uniqueidentifier] NULL,
	[CODE_REQ] [char](1) NULL,
 CONSTRAINT [PK_docugate_jobs] PRIMARY KEY CLUSTERED 
(
	[JOB_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[docugate_bmt_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_bmt_view]
AS
SELECT TOP 100 PERCENT dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_GUID AS GUID, 
   dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_STARTED AS STARTED, 
   dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_ENDED AS ENDED, 
   dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_DURATION AS DURATION, 
   dbo.docugate_bmt_session_active.BMT_SESSION_ACTIVE_BADGE AS BADGE
FROM dbo.docugate_bmt_session_active INNER JOIN
   dbo.docugate_bmt_session_detail ON 
   dbo.docugate_bmt_session_active.BMT_SESSION_ACTIVE_GUID =
   dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_GUID
ORDER BY dbo.docugate_bmt_session_detail.BMT_SESSION_DETAIL_STARTED
GO
/****** Object:  View [dbo].[docugate_cashier_all_activities]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_cashier_all_activities]
as
SELECT CONVERT(CHAR(10),ACC_TRAN_DT ,121) AS TRANDATE,
ACC_TRAN_TYPE AS TRANTYPE,
ACC_TRAN_ACC_BADGE AS ACC_BADGE,
ACC_TRAN_ACC_FULLNAME AS ACC_FULLNAME,
ACC_TRAN_ACC_OU_NAME AS OU_NAME,
ACC_TRAN_DT, 
ACC_TRAN_DOER_BADGE AS CASHIER_BADGE,
ACC_TRAN_DOER_FULLNAME AS CASHIER_NAME,
ACC_TRAN_DOER_OU_NAME AS CASHIER_OU_NAME,
ACC_TRAN_AMT_DEBIT AS DEBIT_SALE,
ACC_TRAN_AMT_CREDIT AS CREDIT_SALE
FROM dbo.docugate_tran_acc_funds
GO
/****** Object:  Table [dbo].[docugate_general_cc]    Script Date: 08/15/2011 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docugate_general_cc](
	[CC_GUID] [uniqueidentifier] NOT NULL,
	[CC_CODE] [varchar](50) NULL,
	[CC_NAME] [varchar](50) NULL,
	[CC_DESC] [varchar](50) NULL,
	[CC_EMAIL] [varchar](50) NULL,
	[CC_CUSTOM] [varchar](50) NULL,
	[CC_OVERIDE] [varchar](50) NULL,
	[CC_CONTACT] [varchar](50) NULL,
	[CC_PHONE_NUM] [varchar](50) NULL,
	[CC_FAX_NUM] [varchar](50) NULL,
	[CC_FAX_COST] [varchar](50) NULL,
	[CC_EMAIL_COST] [varchar](50) NULL,
	[CC_COPY_COST] [varchar](50) NULL,
	[CC_PRINT_COST] [varchar](50) NULL,
	[CC_EMAILPP] [varchar](50) NULL,
	[CC_FAXPP] [varchar](50) NULL,
	[CC_COPYPP] [varchar](50) NULL,
	[CC_PRINTPP] [varchar](50) NULL,
	[CC_PRN_MULTIPLR] [varchar](50) NULL,
	[CC_CPY_MULTIPLR] [varchar](50) NULL,
 CONSTRAINT [PK_docugate_cc] PRIMARY KEY CLUSTERED 
(
	[CC_GUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TranUpdate_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
**
** TranUpdate_view required fot the AVS unit
** Added 05/20/2009
**
**/

CREATE VIEW [dbo].[TranUpdate_view]
AS
SELECT     dbo.ecashier_transactions.guidacc AS User_GUID, dbo.eCashier_view.fullname AS User_FullName, dbo.eCashier_view.badge AS User_Badge, 
                      dbo.eCashier_view.ouname AS User_OU, dbo.ecashier_transactions.guidecashier AS ECASHIER_GUID, 
                      dbo.docugate_acc_view.ACC_BADGE AS ECASHIER_Badge, dbo.docugate_acc_view.ACC_FULLNAME AS ECASHier_Fullname, 
                      dbo.docugate_acc_view.OU_NAME AS ECASHIER_OU, dbo.ecashier_transactions.amount AS Tran_Amount, 
                      dbo.ecashier_transactions.sbal AS Start_Balance, dbo.ecashier_transactions.ebal AS End_Balance, dbo.ecashier_transactions.type AS Tran_Type, 
                      dbo.ecashier_transactions.date AS Tran_Date, dbo.ecashier_transactions.rowid
FROM         dbo.eCashier_view INNER JOIN
                      dbo.ecashier_transactions ON dbo.eCashier_view.guidacc = dbo.ecashier_transactions.guidacc INNER JOIN
                      dbo.docugate_acc_view ON dbo.ecashier_transactions.guidecashier = dbo.docugate_acc_view.ACC_ACC_GUID
GO
/****** Object:  View [dbo].[docugate_as_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_as_view]
AS
SELECT     dbo.docugate_general_active_session.ACC_GUID AS guid, dbo.docugate_general_acc.ACC_BADGE AS badge, 
           dbo.docugate_general_acc.ACC_FIRSTNAME AS firstname, dbo.docugate_general_acc.ACC_LASTNAME AS lastname, 
           dbo.docugate_general_acc.ACC_FULLNAME AS fullname
FROM       dbo.docugate_general_acc INNER JOIN dbo.docugate_general_active_session ON dbo.docugate_general_acc.ACC_ACC_GUID = dbo.docugate_general_active_session.ACC_GUID
GO
/****** Object:  View [dbo].[docugate_ctlunit_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[docugate_ctlunit_view]
as
    Select a.*,c.OU_NAME,TERMINALTYPE_DESC
	from docugate_general_ctlunit a
	left join docugate_general_ou c on a.CTLUNIT_OU_GUID = c.OU_GUID
	join docugate_static_terminaltype d on a.CTLUNIT_TERMINALTYPE = d.TERMINALTYPE
GO
/****** Object:  View [dbo].[docugate_ctlparams_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[docugate_ctlparams_view] 
as
    Select b.ACC_FULLNAME,a.*
	from docugate_general_ctlparams a
	left join docugate_general_acc b on a.CTLPARM_ACC_ACC_GUID = b.ACC_ACC_GUID
GO
/****** Object:  View [dbo].[docugate_computername_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_computername_view] AS SELECT DISTINCT(COMPUTERNAME) FROM [dbo].[docugate_general_activity]
GO
/****** Object:  View [dbo].[docugate_cm_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_cm_view]
AS
SELECT      dbo.docugate_general_cc.CC_GUID, dbo.docugate_general_cc.CC_CODE, dbo.docugate_general_cc.CC_NAME, 
                      dbo.docugate_general_cm.CM_GUID,dbo.docugate_general_cm.CM_MATTER, dbo.docugate_general_cm.CM_DESCRIPTION, dbo.docugate_general_cm.CM_CUSTOM
FROM         dbo.docugate_general_cc LEFT OUTER JOIN
                      dbo.docugate_general_cm ON dbo.docugate_general_cc.CC_GUID = dbo.docugate_general_cm.CC_GUID
GO
/****** Object:  View [dbo].[docugate_activity_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_activity_view]
AS
SELECT     CASE a.JOBTYPE WHEN 1 THEN 'PRINT' ELSE 'COPY' END AS JOBTYPE_DESC, a.JOB_GUID, a.ACC_BADGE, a.COPIES, a.COLOR, a.DUPLEX, 
                      a.DT_REQUESTED, a.DT_DELETION, a.JOBSTATUS, a.DOCNAME, a.PAGECOUNT, a.COMPUTERNAME, a.PRINTERNAME, a.JOBTYPE, a.JOBCOST, 
                      a.CC_CODE, a.CM_MATTER, a.OU_NAME, a.CTLUNIT_SERIAL_NO, a.COMMENTS, a.RECEIPT_NO, a.ACC_GUID, a.OU_GUID, a.CODE_REQ, 
                      RTRIM(ISNULL(b.ACC_FULLNAME, '')) AS ACC_FULLNAME, a.ACC_BADGE + ' / ' + RTRIM(ISNULL(b.ACC_FULLNAME, '')) AS ACC_BADGE_FULLNAME, 
                      RTRIM(ISNULL(c.CC_NAME, '')) AS CC_NAME, RTRIM(ISNULL(d.CM_DESCRIPTION, '')) AS CM_DESC
FROM         dbo.docugate_general_activity AS a LEFT OUTER JOIN
                      dbo.docugate_general_acc AS b ON a.ACC_BADGE = b.ACC_BADGE LEFT OUTER JOIN
                      dbo.docugate_general_cc AS c ON a.CC_CODE = c.CC_CODE LEFT OUTER JOIN
                      dbo.docugate_general_cm AS d ON a.CM_MATTER = d.CM_MATTER
GO
/****** Object:  View [dbo].[docugate_pl_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[docugate_pl_view]
AS
SELECT     dbo.docugate_general_activity.JOB_GUID AS jobguid, dbo.docugate_general_activity.ACC_BADGE AS badge, 
                      dbo.docugate_general_activity.PAGECOUNT AS numcopies, dbo.docugate_general_activity_pl.PL1 AS pl1count, 
                      dbo.docugate_general_activity_pl.PL2 AS pl2count, dbo.docugate_general_activity_pl.PL3 AS pl3count, 
                      dbo.docugate_general_activity_pl.PL4 AS pl4count, dbo.docugate_general_activity.CC_CODE AS Client, 
                      dbo.docugate_general_activity.CM_MATTER AS Matter
FROM         dbo.docugate_general_activity INNER JOIN
                      dbo.docugate_general_activity_pl ON dbo.docugate_general_activity.JOB_GUID = dbo.docugate_general_activity_pl.JOB_GUID
WHERE     (dbo.docugate_general_activity.DOCNAME = 'COPYJOB')
GO
/****** Object:  View [dbo].[docugate_cashier_acc_view]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[docugate_cashier_acc_view]
as 
Select ACC_GUID,acc.ACC_BADGE,
  ISNULL(ACC_FIRSTNAME,'') as ACC_FIRSTNAME,
  ISNULL(ACC_LASTNAME,'') AS ACC_LASTNAME, 
  ISNULL(ACC_FULLNAME,'') AS ACC_FULLNAME,
  ISNULL(ACC.OU_NAME,'') AS OU_NAME, 
  ISNULL(ACC_FUNDS,0.00) AS ACC_FUNDS,
  ISNULL(ACC_TYPE, '') AS ACC_TYPE,
  ISNULL(ACC_AVAIL_STATUS,'') AS ACC_AVAIL_STATUS,
  RECEIPT_DT_CHKOUT AS DT_CHKOUT
FROM docugate_acc_view acc
left join dbo.docugate_receipt_number chktran 
on acc.ACC_BADGE = chktran.RECEIPT_ACC_BADGE 
AND chktran.RECEIPT_DT_CHKOUT IS NOT NULL
AND chktran.RECEIPT_DT_CHKIN IS NULL
GO
/****** Object:  StoredProcedure [dbo].[dba_clear_work_tables]    Script Date: 08/15/2011 16:56:19 ******/
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
/****** Object:  StoredProcedure [dbo].[dba_clear_primary_tables]    Script Date: 08/15/2011 16:56:19 ******/
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
/****** Object:  StoredProcedure [dbo].[cashier_check_out]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      proc [dbo].[cashier_check_out]
(@ACC_BADGE VARCHAR(50), @DOER_BADGE VARCHAR(50))
/*
   Written by Lynette Austin
   08/02/2008
   --
   Usage:
	exec dbo.cashier_check_out 'USER1','CASH2'
 
   Called from the DocuGate Administration application
   by the cashier will check out a card that is available.
*/
AS
  SET NOCOUNT ON
  DECLARE @MSG VARCHAR(128)

  IF (SELECT COUNT(*) FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE) = 0
  BEGIN
     SET @MSG = 'The CARD Account Badge [' + @ACC_BADGE + '] does not exist!'
     raiserror(@MSG,16,1)
     return
  END
 	
  IF (SELECT COUNT(*) FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @DOER_BADGE) = 0
  BEGIN
     SET @MSG = 'The DOER Account Badge [' + @DOER_BADGE + '] does not exist!'
     raiserror(@MSG,16,1)
     return
  END
  
  -- GET THE OPENING ACCOUNT BALANCE
  DECLARE @OPENBAL FLOAT, @TRAN_GUID UNIQUEIDENTIFIER,@RECEIPT_NO INTEGER,@DT_CHECKOUT DATETIME
  SELECT @OPENBAL = ISNULL(ACC_FUNDS,0)
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE

  -- GET THE DOER'S DETAILS E.G THE CASHIER
  DECLARE @RetErr INT, @DOER_FULLNAME VARCHAR(50), @DOER_OU_NAME VARCHAR(50)
  SELECT @DOER_FULLNAME = ISNULL(ACC_FULLNAME,''),
	@DOER_OU_NAME = ISNULL(OU_NAME,'') 
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @DOER_BADGE 

  SET @RetErr = 0
  BEGIN TRAN

    SET @DT_CHECKOUT = GETDATE()    
    INSERT dbo.docugate_receipt_number (RECEIPT_ACC_BADGE,RECEIPT_DT_CHKOUT) 
		VALUES (@ACC_BADGE, @DT_CHECKOUT)
    SELECT @RECEIPT_NO = SCOPE_IDENTITY()
	
    SET @TRAN_GUID = NEWID()
    INSERT INTO dbo.docugate_tran_acc_funds
     (ACC_TRAN_GUID, ACC_TRAN_ACC_BADGE,ACC_TRAN_ACC_FULLNAME,ACC_TRAN_ACC_OU_NAME,
      ACC_TRAN_DT,ACC_TRAN_TYPE,ACC_TRAN_DOER_BADGE,ACC_TRAN_DOER_FULLNAME,ACC_TRAN_DOER_OU_NAME,
      ACC_TRAN_FUND_OPEN_BAL,ACC_TRAN_FUND_CLOSE_BAL,ACC_TRAN_RECEIPT_NO,ACC_TRAN_RECEIPT_NO_DISPLAY)
    SELECT @TRAN_GUID, ACC_BADGE,ISNULL(ACC_FULLNAME,''), ISNULL(OU_NAME,''), @DT_CHECKOUT,'CHECKED OUT', 
	@DOER_BADGE,ISNULL(@DOER_FULLNAME,''), ISNULL(@DOER_OU_NAME,''),
	@OPENBAL,ACC_FUNDS,@RECEIPT_NO,LTRIM(RTRIM(CONVERT(VARCHAR(50),@RECEIPT_NO)))
		FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE 
    --
    SET @RetErr = @@ERROR 
    IF @RetErr <> 0
    BEGIN
      ROLLBACK
      RETURN(@RetErr)
    END
    --
    UPDATE dbo.DOCUGATE_GENERAL_ACC SET ACC_AVAILABILITY = 2
	WHERE ACC_BADGE = @ACC_BADGE 
    SET @RetErr = @@ERROR 
    IF @RetErr <> 0
    BEGIN
      ROLLBACK
      RETURN(@RetErr)
    END
    --
  COMMIT TRAN
  RETURN( @RetErr)
GO
/****** Object:  StoredProcedure [dbo].[cashier_check_in]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE       proc [dbo].[cashier_check_in]
(@ACC_BADGE VARCHAR(50), @DOER_BADGE VARCHAR(50),
 @TRAN_AMT varchar(20), @REFUND_AMT varchar(20))
/*
   
   08/02/2008: Written by Lynette Austin
   30/05/2008: Updated by L Austin
		- do not record debit and credit values with a check in transaction
   --
   exec dbo.cashier_check_in 'USER1','CASH2'

   Called from the DocuGate Administration application
   by the cashier will check in a card that was checked out.
*/
AS
  SET NOCOUNT ON
  DECLARE @MSG VARCHAR(128), @RetErr INT, @DT_CHECKIN DATETIME

  IF (SELECT COUNT(*) FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE) = 0
  BEGIN
     SET @MSG = 'The CARD Account Badge [' + @ACC_BADGE + '] does not exist!'
     raiserror(@MSG,16,1)
     return
  END
 	
  IF (SELECT COUNT(*) FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @DOER_BADGE) = 0
  BEGIN
     SET @MSG = 'The DOER Account Badge [' + @DOER_BADGE + '] does not exist!'
     raiserror(@MSG,16,1)
     return
  END
 
  -- GET THE TRAN GUID OF THE ORIGINAL CHECK OUT TRANSACTION
  DECLARE @RECEIPT_NO INT,@OPENBAL FLOAT
  DECLARE @DOER_FULLNAME VARCHAR(50), @DOER_OU_NAME VARCHAR(50)

  SELECT @RECEIPT_NO = MAX(RECEIPT_NO) FROM dbo.docugate_receipt_number
     WHERE RECEIPT_ACC_BADGE = @ACC_BADGE
  
  -- GET THE OPENING ACCOUNT BALANCE
  SELECT @OPENBAL = ISNULL(ACC_FUNDS,0)
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE

  -- GET THE DOER'S DETAILS E.G THE CASHIER

  SELECT @DOER_FULLNAME = ISNULL(ACC_FULLNAME,''),
	@DOER_OU_NAME = ISNULL(OU_NAME,'') 
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @DOER_BADGE 

  SET @RetErr = 0
  BEGIN TRAN
        -- MARK THESE ACTIVITIES AS PART OF THE CHECKED OUT TRANSACTION
	UPDATE dbo.docugate_general_activity
	  SET RECEIPT_NO = @RECEIPT_NO
	  WHERE ACC_BADGE = @ACC_BADGE 
	    AND RECEIPT_NO IS NULL
   	    AND DT_REQUESTED >= (SELECT MAX(ACC_TRAN_DT) FROM dbo.docugate_tran_acc_funds
		WHERE ACC_TRAN_RECEIPT_NO = @RECEIPT_NO
		AND ACC_TRAN_ACC_BADGE = @ACC_BADGE
		AND ACC_TRAN_TYPE = 'CHECKED OUT')

	SET @DT_CHECKIN = GETDATE()

	UPDATE dbo.docugate_receipt_number
		SET RECEIPT_DT_CHKIN = @DT_CHECKIN 
		WHERE RECEIPT_NO = @RECEIPT_NO
	

        INSERT INTO dbo.docugate_tran_acc_funds
	 (ACC_TRAN_GUID, ACC_TRAN_ACC_BADGE,ACC_TRAN_ACC_FULLNAME,ACC_TRAN_ACC_OU_NAME,
	  ACC_TRAN_DT,ACC_TRAN_TYPE,ACC_TRAN_DOER_BADGE,ACC_TRAN_DOER_FULLNAME,ACC_TRAN_DOER_OU_NAME,
	  ACC_TRAN_FUND_OPEN_BAL,ACC_TRAN_AMT_DEBIT,ACC_TRAN_AMT_CREDIT,
	  ACC_TRAN_FUND_CLOSE_BAL,ACC_TRAN_RECEIPT_NO,ACC_TRAN_RECEIPT_NO_DISPLAY)
	SELECT
	  NEWID(), ACC_BADGE,ISNULL(ACC_FULLNAME,''), ISNULL(OU_NAME,''), @DT_CHECKIN,'CHECKED IN', 
	  @DOER_BADGE,ISNULL(@DOER_FULLNAME,''), ISNULL(@DOER_OU_NAME,''),
	  @OPENBAL,0,0,ACC_FUNDS,@RECEIPT_NO,LTRIM(RTRIM(CONVERT(VARCHAR(50),@RECEIPT_NO)))
	  FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE 

	/* 30/05/2008: L Austin
           !!! do not record any amounts with a check in transaction   
	   !!! to ensure that the daily activity report balances, 
	   !!! see fields @TRAN_AMT,@REFUND_AMT replaced by zeroes in the above statement
           !!!
	SELECT NEWID(), ACC_BADGE,ISNULL(ACC_FULLNAME,''), ISNULL(OU_NAME,''), @DT_CHECKIN,'CHECKED IN', 
	  @DOER_BADGE,ISNULL(@DOER_FULLNAME,''), ISNULL(@DOER_OU_NAME,''),
	  @OPENBAL,@TRAN_AMT,@REFUND_AMT,ACC_FUNDS,@RECEIPT_NO,LTRIM(RTRIM(CONVERT(VARCHAR(50),@RECEIPT_NO)))
	  FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE 
	*/
        
	SET @RetErr = @@ERROR 
	IF @RetErr <> 0
	BEGIN
	  ROLLBACK
	  RETURN(@RetErr)
	END

        --
        UPDATE dbo.DOCUGATE_GENERAL_ACC SET ACC_AVAILABILITY = 1
	   WHERE ACC_BADGE = @ACC_BADGE 
        SET @RetErr = @@ERROR 
        IF @RetErr <> 0
        BEGIN
          ROLLBACK
          RETURN(@RetErr)
        END
    --
    COMMIT TRAN
    RETURN( @RetErr)
GO
/****** Object:  StoredProcedure [dbo].[cashier_adjust_acc_funds]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[cashier_adjust_acc_funds]
(@ACC_BADGE VARCHAR(50), @DOER_BADGE VARCHAR(50),@AMT_ADJUSTMENT VARCHAR(20))
AS
  -- GET THE DOER'S DETAILS E.G THE CASHIER
  DECLARE @RetErr INT, @DOER_FULLNAME VARCHAR(50), @DOER_OU_NAME VARCHAR(50)
  SELECT @DOER_FULLNAME = ISNULL(ACC_FULLNAME,''),
	@DOER_OU_NAME = ISNULL(OU_NAME,'') 
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @DOER_BADGE 
  
  -- GET THE OPENING ACCOUNT BALANCE
  DECLARE @OPENBAL FLOAT
  SELECT @OPENBAL = ISNULL(ACC_FUNDS,0)
	FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE

  SET @RetErr = 0
  BEGIN TRAN

    -- ADJUST THE ACCOUNT BALANCE
    UPDATE DBO.DOCUGATE_GENERAL_ACC
	SET ACC_FUNDS = ISNULL(ACC_FUNDS,0) + 
	    CONVERT(FLOAT,@AMT_ADJUSTMENT)
	WHERE ACC_BADGE = @ACC_BADGE
    --
    SET @RetErr = @@ERROR 
    IF @RetErr <> 0
    BEGIN
	ROLLBACK
	  RETURN(@RetErr)
	END
    --
    DECLARE @AMT_DEBIT FLOAT, @AMT_CREDIT FLOAT
    SET @AMT_DEBIT = 0
    SET @AMT_CREDIT = 0
    IF CONVERT(FLOAT,@AMT_ADJUSTMENT) < 0
	SET @AMT_DEBIT = ABS(CONVERT(FLOAT,@AMT_ADJUSTMENT))
    ELSE 
	SET @AMT_CREDIT = ABS(CONVERT(FLOAT,@AMT_ADJUSTMENT))
    --	
    INSERT INTO dbo.docugate_tran_acc_funds
     (ACC_TRAN_ACC_BADGE,ACC_TRAN_ACC_FULLNAME,ACC_TRAN_ACC_OU_NAME,
      ACC_TRAN_DT,ACC_TRAN_TYPE,ACC_TRAN_DOER_BADGE,ACC_TRAN_DOER_FULLNAME,ACC_TRAN_DOER_OU_NAME,
      ACC_TRAN_FUND_OPEN_BAL,ACC_TRAN_AMT_DEBIT,ACC_TRAN_AMT_CREDIT,
	ACC_TRAN_FUND_CLOSE_BAL)
    SELECT ACC_BADGE,ISNULL(ACC_FULLNAME,''), ISNULL(OU_NAME,''), GETDATE(),'FUND ADJ', 
	@DOER_BADGE,ISNULL(@DOER_FULLNAME,''), ISNULL(@DOER_OU_NAME,''),
	@OPENBAL, @AMT_DEBIT, @AMT_CREDIT, ACC_FUNDS
		FROM dbo.DOCUGATE_ACC_VIEW WHERE ACC_BADGE = @ACC_BADGE 
    --
    SET @RetErr = @@ERROR 
    IF @RetErr <> 0
    BEGIN
	ROLLBACK
	  RETURN(@RetErr)
	END
    --
  COMMIT TRAN
  RETURN(@RetErr)
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetTranTotal]    Script Date: 08/15/2011 16:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[udf_GetTranTotal] 
(@ACC_BADGE VARCHAR(50),@RECEIPT_NO INTEGER)
RETURNS DECIMAL(22,2)
BEGIN
   DECLARE @TRAN_AMT DECIMAL(22,2)
   -- GET THE TOTAL TRAN COST
   SELECT @TRAN_AMT = SUM(JobCost) FROM dbo.docugate_general_activity 
      WHERE ACC_BADGE = @ACC_BADGE
      AND RECEIPT_NO IS NULL
      AND DT_REQUESTED >= 
	(SELECT MAX(ACC_TRAN_DT) FROM dbo.docugate_tran_acc_funds
		WHERE ACC_TRAN_RECEIPT_NO = @RECEIPT_NO
		AND ACC_TRAN_ACC_BADGE = @ACC_BADGE
		AND ACC_TRAN_TYPE = 'CHECKED OUT')
   RETURN ISNULL(@TRAN_AMT,0)
END
GO
/****** Object:  StoredProcedure [dbo].[simulate_user_charge_own_acc]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[simulate_user_charge_own_acc] (@USER_ACC_BADGE VARCHAR(50))
AS
/* FACT:  This procedure will charge the print and 
	copy jobs against the user's own account.
      
   ASSUMPTIONS: For the above to be true, the following must hold:

   1) There will be no checking in and out of cards

   Usage:
       EXEC simulate_user_charge_own_acc 'USER1'


   */
   DECLARE @DOCNAME VARCHAR(50)
   DECLARE @COMPNAME VARCHAR(50)
   DECLARE @PRINTER VARCHAR(50)
   DECLARE @USER_OUNAME VARCHAR(50)
   DECLARE @TRAN_GUID uniqueidentifier
   DECLARE @JOBCOST float
   DECLARE @CASHIER_NAME VARCHAR(50) 
   DECLARE @RunningDt datetime
   DECLARE @ADJAMT VARCHAR(20)
   DECLARE @JOBTRAN_DT DATETIME
	
   SELECT @USER_ACC_BADGE = ACC_BADGE, @USER_OUNAME = OU_NAME 
	FROM dbo.docugate_acc_view
	WHERE ACC_BADGE = 'USER1'

   SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(1,10))	
   SET @RunningDt = getdate()
   SET @DOCNAME = 'DOC-LYNETTE'
   SET @COMPNAME = 'WKS-LYNETTE'
   SET @PRINTER = 'PRINTER-01'
		
   INSERT INTO dbo.docugate_general_activity
	   (ACC_BADGE,CC_CODE,COPIES,COLOR,DUPLEX,DT_REQUESTED,
		JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
	    	JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
   VALUES (@USER_ACC_BADGE,'',1,0,0,@RunningDt,
		1,@DOCNAME,2,@COMPNAME,@PRINTER,
	    	1,@JOBCOST,NULL,@USER_OUNAME)

   UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE
GO
/****** Object:  StoredProcedure [dbo].[simulate_create_jobs_per_badge]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
EXEC simulate_create_jobs_per_badge '202','ADMIN'
*/

CREATE    proc [dbo].[simulate_create_jobs_per_badge] 
(@USER_ACC_BADGE VARCHAR(50),@DOER_ACC_BADGE VARCHAR(50))
AS
   /* This procedure is used to simulate and generate the print and copy jobs
	which the user will create after the card has been checked out.  It is
	available on the application below the check out button.
  */
	IF (Select ACC_AVAILABILITY 
	    from docugate_general_acc 
		where ACC_BADGE = @USER_ACC_BADGE) <> 2
	begin
		raiserror('This card has not been checked out! First check it out!',16,1)
		return
	END
 	
   DECLARE @Ret INTEGER
   DECLARE @CASHIER_NAME VARCHAR(50) 
   DECLARE @RunningAmt FLOAT
   DECLARE @ADJAMT VARCHAR(20)
   DECLARE @JOBTRAN_DT DATETIME
   DECLARE @RECEIPT_NO INTEGER

   SELECT @RECEIPT_NO = MAX(RECEIPT_NO) FROM dbo.docugate_receipt_number
     WHERE RECEIPT_ACC_BADGE = @USER_ACC_BADGE

   SELECT @JOBTRAN_DT =(SELECT MAX(ACC_TRAN_DT) FROM dbo.docugate_tran_acc_funds
		WHERE ACC_TRAN_RECEIPT_NO = @RECEIPT_NO
		AND ACC_TRAN_ACC_BADGE = @USER_ACC_BADGE
		AND ACC_TRAN_TYPE = 'CHECKED OUT')

   IF @DOER_ACC_BADGE = 'SUPERUSER'
		SELECT @CASHIER_NAME = 'SUPERUSER'
   ELSE	
  	 	SELECT @CASHIER_NAME = (SELECT ACC_FULLNAME 
			FROM DOCUGATE_GENERAL_ACC WHERE ACC_BADGE = @DOER_ACC_BADGE)

   IF @JOBTRAN_DT is null or isnull(@CASHIER_NAME,'') = '' or isnull(@USER_ACC_BADGE,'') = '' 
	BEGIN
		raiserror('Select a card for which create print and copy transactions will be created!',16,1)
		return
	END   
	

   DECLARE @DOCNAME VARCHAR(50)
   DECLARE @COMPNAME VARCHAR(50)
   DECLARE @PRINTER VARCHAR(50)
   DECLARE @USER_OUNAME VARCHAR(50)
   DECLARE @TRAN_GUID uniqueidentifier
   DECLARE @JOBCOST float

   -- create a random number of test jobs (1-5 jobs)
   DECLARE @NUMTESTJOBS INTEGER
   SET @NUMTESTJOBS = dbo.udf_Num_RandInt (1, 7)
   SELECT @USER_OUNAME = OU_NAME FROM dbo.docugate_acc_view 
	WHERE ACC_BADGE = @USER_ACC_BADGE
		
   DECLARE @RunningDt datetime
   DECLARE @RunningJobCost FLOAT
   DECLARE @CC VARCHAR(50)
	   
   	set nocount on
	-- Job 1
   	set @RunningAmt = 5
	set @RunningDt = dateadd(mi,2,@JOBTRAN_DT)

	-- now allow for the user to go do some printing 
	SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(1,10))	
	set @CC = (select top 1 cc_code from dbo.docugate_general_cc 
	  where cc_code >= char(@JobCost) 
	  and cc_code <= char(@JobCost)) 

	SET @RunningJobCost = @RunningJobCost + @JOBCOST
	SET @RunningDt = dateadd(mi,5,@RunningDt)
	SET @DOCNAME = 'DOC-' + @USER_ACC_BADGE + '01'
	SET @COMPNAME = 'WKS-' + @USER_ACC_BADGE + '01'
	SET @PRINTER = 'PRN-' + @USER_ACC_BADGE + '01'
	
	INSERT INTO dbo.docugate_general_activity
	   (ACC_BADGE,CC_CODE,COPIES,COLOR,DUPLEX,DT_REQUESTED,JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
	    JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
	VALUES (@USER_ACC_BADGE,@CC,1,1,0,@RunningDt,1,@DOCNAME,2,@COMPNAME,@PRINTER,
	    1,@JOBCOST,NULL,@USER_OUNAME)

	UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE 
	
	if @NUMTESTJOBS < 2 RETURN
	-- Job 2

	SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(1,20))
	set @CC = (select top 1 cc_code from dbo.docugate_general_cc 
	  where cc_code >= char(@JobCost) 
	  and cc_code <= char(@JobCost)) 
	SET @RunningJobCost = @RunningJobCost + @JOBCOST
	SET @RunningDt = dateadd(ss,30,@RunningDt)
	SET @DOCNAME = 'PDF-' + @USER_ACC_BADGE + '02'
	
	INSERT INTO dbo.docugate_general_activity
	(ACC_BADGE,CC_CODE, COPIES,COLOR,DUPLEX,DT_REQUESTED,JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
	JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
	VALUES (@USER_ACC_BADGE,@CC, 1,1,0,@RunningDt,1,@DOCNAME,4,@COMPNAME,@PRINTER,
	1,@JOBCOST,NULL,@USER_OUNAME)


	UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE 
	
	if @NUMTESTJOBS < 3 RETURN

	-- Job 3
	SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(10,18))
	set @CC = (select top 1 cc_code from dbo.docugate_general_cc 
	  where cc_code >= char(@JobCost) 
	  and cc_code <= char(@JobCost)) 
	SET @RunningJobCost = @RunningJobCost + @JOBCOST
	
	SET @RunningDt = dateadd(ss,30,@RunningDt)
	SET @DOCNAME = 'XLS-' + @USER_ACC_BADGE + '03'

	INSERT INTO dbo.docugate_general_activity
	(ACC_BADGE,CC_CODE, COPIES,COLOR,DUPLEX,DT_REQUESTED,JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
	JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
	VALUES (@USER_ACC_BADGE,@CC, 1,1,0,@RunningDt,1,@DOCNAME,6,@COMPNAME,@PRINTER,
	1,@JOBCOST,NULL,@USER_OUNAME)


	UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE 

	if @NUMTESTJOBS < 4 RETURN

	-- Job 4
	-- now allow for the user to go do some copying 
	SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(5,13))
	set @CC = (select top 1 CC_CODE from dbo.docugate_general_cc 
	  where cc_code >= char(@JobCost) 
	  and cc_code <= char(@JobCost)) 

	SET @RunningJobCost = @RunningJobCost + @JOBCOST
	SET @RunningDt = dateadd(mi,5,@RunningDt)
	SET @DOCNAME = 'COPY-' + @USER_ACC_BADGE + '01'
	SET @COMPNAME = 'WKS-' + @USER_ACC_BADGE + '01'
	SET @PRINTER = ''  
	
	INSERT INTO dbo.docugate_general_activity
		(ACC_BADGE,CC_CODE,COPIES,COLOR,DUPLEX,DT_REQUESTED,JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
		JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
	VALUES (@USER_ACC_BADGE,@CC,1,1,0,@RunningDt,1,@DOCNAME,20,@COMPNAME,@PRINTER,
		2,@JOBCOST,NULL,@USER_OUNAME)

	UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE 

	if @NUMTESTJOBS < 5 RETURN

	-- Job 5
	SET @JOBCOST = (SELECT dbo.udf_Num_RandInt(3,15))
	set @CC = (select top 1 CC_CODE from dbo.docugate_general_cc 
	  where cc_code >= char(@JobCost) 
	  and cc_code <= char(@JobCost)) 
	SET @RunningJobCost = @RunningJobCost + @JOBCOST
	SET @RunningDt = dateadd(mi,2,@RunningDt)
	SET @DOCNAME = 'COPY-' + @USER_ACC_BADGE + '10'
	SET @COMPNAME = 'WKS-' + @USER_ACC_BADGE + '01'
	SET @PRINTER = ''
	
	INSERT INTO dbo.docugate_general_activity
	(ACC_BADGE,CC_CODE, COPIES,COLOR,DUPLEX,DT_REQUESTED,JOBSTATUS,DOCNAME,PAGECOUNT,COMPUTERNAME,PRINTERNAME,
	JOBTYPE,JOBCOST,CM_MATTER,OU_NAME)
	VALUES (@USER_ACC_BADGE,@CC, 1,1,0,@RunningDt,1,@DOCNAME,10,@COMPNAME,@PRINTER,
	2,@JOBCOST,NULL,@USER_OUNAME)
	

	UPDATE dbo.DOCUGATE_GENERAL_ACC Set ACC_FUNDS = ISNULL(ACC_FUNDS,0) - @JOBCOST
		where ACC_BADGE = @USER_ACC_BADGE
GO
/****** Object:  StoredProcedure [dbo].[simulate_cashier_adjust_acc_funds]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec cashier_adjust_acc_funds 102,'200','LYNETTE',100

*/

CREATE   PROC [dbo].[simulate_cashier_adjust_acc_funds]
(@ACC_BADGE VARCHAR(50), @CASHIER_BADGE VARCHAR(50),
 @CASHIER_NAME VARCHAR(50), @AMT_ADJUSTMENT VARCHAR(20), 
 @TRANDATE DATETIME)
/*
   Written by Lynette Austin
   05/02/2008
   --
   Called from the DocuGate Administration application
   by the cashier will adjust the fund balance on the account.
*/
AS
  declare @RetErr as integer
  SET @RetErr = 0
  BEGIN TRAN
	INSERT INTO dbo.docugate_cashier_acc_funds
	(ACC_BADGE,OU_NAME,DT_FUNDS_ADJUST,CASHIER_BADGE,
		CASHIER_NAME,ACC_OPENING_FUNDBAL,AMT_ADJUSTMENT)
	Select ACC_BADGE, OU_NAME, 
		@TRANDATE,@CASHIER_BADGE,@CASHIER_NAME, ACC_FUNDS, 
		CONVERT(FLOAT,@AMT_ADJUSTMENT)
		FROM dbo.DOCUGATE_ACC_VIEW where ACC_BADGE = @ACC_BADGE 
	--
	SET @RetErr = @@ERROR 
	if @RetErr <> 0
	BEGIN
	  ROLLBACK
	  return(@RetErr)
	END
	--
	UPDATE dbo.DOCUGATE_GENERAL_ACC 
		Set ACC_FUNDS = isnull(ACC_FUNDS,0) + convert(float,@AMT_ADJUSTMENT)
	FROM dbo.DOCUGATE_GENERAL_ACC where ACC_BADGE = @ACC_BADGE 
	SET @RetErr = @@ERROR 
	if @RetErr <> 0
	BEGIN
	     ROLLBACK
	     return(@RetErr) 
	END
  COMMIT TRAN
  return(@RetErr)
GO
/****** Object:  View [dbo].[v_account_status]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_account_status]
AS
  SELECT ACC_BADGE, OU_NAME, ACC_TYPE, ACC_FULLNAME, ACC_FUNDS, ACC_ACCESS_LEVEL, ACC_STATUS, ACC_AVAIL_STATUS
	FROM dbo.docugate_acc_view
GO
/****** Object:  View [dbo].[view_activity_acc_dt_copyjobs]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_activity_acc_dt_copyjobs]
as
SELECT OU_NAME, ACC_BADGE, ACC_FULLNAME, 
CONVERT(CHAR(10),DT_REQUESTED,121) AS DT_REQUESTED_YYYYMMDD,
SUM(ISNULL(PAGECOUNT,0)) AS COPYPAGECNT, SUM(ISNULL(JOBCOST,0)) AS COPYJOBCOST 
FROM dbo.docugate_activity_view 
WHERE JOBTYPE=0
GROUP BY OU_NAME, ACC_BADGE, ACC_FULLNAME, CONVERT(CHAR(10),DT_REQUESTED,121)
GO
/****** Object:  View [dbo].[view_activity_acc_dt_alljobs]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_activity_acc_dt_alljobs]
AS
SELECT OU_NAME, ACC_BADGE, ACC_FULLNAME, 
CONVERT(CHAR(10),DT_REQUESTED,121) AS DT_REQUESTED_YYYYMMDD,
SUM(ISNULL(PAGECOUNT,0)) AS TOTSUMPAGECNT, 
SUM(ISNULL(JOBCOST,0)) AS TOTSUMJOBCOST 
FROM dbo.docugate_activity_view 
GROUP BY OU_NAME,ACC_BADGE, ACC_FULLNAME, 
CONVERT(CHAR(10),DT_REQUESTED,121)
GO
/****** Object:  StoredProcedure [dbo].[get_console_stats]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec get_console_stats 'admin','2008-01-01','2008-02-01',1


CREATE   procedure [dbo].[get_console_stats]
(@SessionName varchar(60), @ParmStartDt varchar(10), 
 @ParmEndDt varchar(10), @ShowResults as integer)
as
/*
   Written by Lynette Austin, 08/02/2008,
   Updated By Lynette Austin, 30/03;/2008
   --
   Called from the DocuGate Administration application
   to display various quick online statistics.
*/

delete from dbo.docugate_report_consolestats where SessionName = @SessionName

create table #SpikeValues
(SpikeDesc varchar(100) not null,
 SpikeValue decimal(20,2)
)

declare @StartDt smalldatetime
	,@EndDt smalldatetime

set @StartDt = convert(smalldatetime,@ParmStartDt)
set @EndDt = convert(smalldatetime,@ParmEndDt)
--
set @ParmStartDt = convert(char(10),@StartDt,110)
set @ParmEndDt = convert(char(10),@EndDt,110)

--// No of Sales for January 2008
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataValue1) 
Select @SessionName,1,'Total # of Sales',
	@ParmStartDt, @ParmEndDt, isnull(COUNT(*),0)
FROM dbo.docugate_tran_acc_funds 
WHERE DATEDIFF(DAY,ACC_TRAN_DT,@StartDt) <= 0 
AND DATEDIFF(DAY,ACC_TRAN_DT,@EndDt) >= 0
AND ACC_TRAN_TYPE = 'CHECKED IN'

--// Amount of Sales for January 2008
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataValue1) 
Select @SessionName,2,'Total Dollar Sales',@ParmStartDt, @ParmEndDt, 
	SUM(ISNULL(ACC_TRAN_AMT_DEBIT,0))
FROM dbo.docugate_tran_acc_funds 
WHERE DATEDIFF(DAY,ACC_TRAN_DT,@StartDt) <= 0 
AND DATEDIFF(DAY,ACC_TRAN_DT,@EndDt) >= 0
AND ACC_TRAN_TYPE = 'CHECKED IN'

--// Top Cashiers
delete from #SpikeValues

insert into #SpikeValues (SpikeDesc, SpikeValue)
select top 5 ACC_TRAN_DOER_BADGE, SUM(ISNULL(ACC_TRAN_AMT_DEBIT,0)) 
	FROM dbo.docugate_tran_acc_funds 
WHERE DATEDIFF(DAY,ACC_TRAN_DT,@StartDt) <= 0 
AND DATEDIFF(DAY,ACC_TRAN_DT,@EndDt) >= 0
GROUP BY ACC_TRAN_DOER_BADGE
ORDER BY SUM(ACC_TRAN_AMT_DEBIT) DESC

INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,3,'Top 5 Cashiers',@ParmStartDt, @ParmEndDt, SpikeDesc,SpikeValue
from #SpikeValues 

--// Under achievers
delete from #SpikeValues

insert into #SpikeValues (SpikeDesc, SpikeValue)
select top 5 ACC_TRAN_DOER_BADGE, SUM(ISNULL(ACC_TRAN_AMT_DEBIT,0))
	FROM dbo.docugate_tran_acc_funds 
WHERE DATEDIFF(DAY,ACC_TRAN_DT,@StartDt) <= 0 
AND DATEDIFF(DAY,ACC_TRAN_DT,@EndDt) >= 0
GROUP BY ACC_TRAN_DOER_BADGE
ORDER BY SUM(ACC_TRAN_AMT_DEBIT) ASC

INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description,
StartDate, EndDate, DataDesc1, DataValue1)
Select @SessionName,4,'Bottom 5 Cashiers',@ParmStartDt, @ParmEndDt, SpikeDesc,SpikeValue
from #SpikeValues 

--// Top Clients Avg Sales
delete from #SpikeValues

insert into #SpikeValues (SpikeDesc, SpikeValue)
select top 5 ACC_TRAN_DOER_BADGE, AVG(ACC_TRAN_AMT_DEBIT) 
	FROM dbo.docugate_tran_acc_funds 
WHERE DATEDIFF(DAY,ACC_TRAN_DT,@StartDt) <= 0 
AND DATEDIFF(DAY,ACC_TRAN_DT,@EndDt) >= 0
GROUP BY ACC_TRAN_DOER_BADGE
ORDER BY AVG(ACC_TRAN_AMT_DEBIT) DESC


INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,3,'Top 5 Cashiers',@ParmStartDt, @ParmEndDt, SpikeDesc,SpikeValue
from #SpikeValues 

--// Status
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
DataDesc1, DataValue1)
select @SessionName, 5, 'Account / Badge Status', '# ' + ACC_AVAIL_STATUS, COUNT(*) 
from docugate_cashier_acc_view
GROUP BY ACC_AVAIL_STATUS
ORDER BY ACC_AVAIL_STATUS

--// Accounts types per OU
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
EndDate,DataDesc1, DataValue1)
select @SessionName, 6, '# of Accounts per OU/Acc Type', 
isnull(OU_NAME,'NOT SPECIFIED'),isnull(ACC_TYPE,''), ISNULL(COUNT(*),0)
from docugate_acc_view
GROUP BY OU_NAME, ACC_TYPE
ORDER BY OU_NAME, ACC_TYPE

-- Total Copies per OU
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
StartDate, EndDate, DataDesc1, DataValue1)
SELECT @SessionName, 7, 'Total # of Copies per OU', 
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED'),isnull(SUM(COPIES),0) 
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY OU_NAME
ORDER BY OU_NAME


-- Total Pages per OU
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
StartDate, EndDate,DataDesc1, DataValue1)
SELECT @SessionName, 8, 'Total # of Pages per OU', 
	@ParmStartDt, @ParmEndDt,  ISNULL(OU_NAME,'NOT SPECIFIED'),isnull(SUM(PAGECOUNT),0) 
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY OU_NAME
ORDER BY OU_NAME

-- Total Cost
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT @SessionName, 9, 'Totals Cost per OU', 
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED'),isnull(SUM(JOBCOST),0) 
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY OU_NAME
ORDER BY OU_NAME

-- Top Clients Total Cost
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,10,'Top 5 Highest Cost per Client',@ParmStartDt, @ParmEndDt, 
	CC_NAME, SUM(ISNULL(JOBCOST,0))
FROM dbo.docugate_activity_view 
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY CC_NAME
ORDER BY SUM(JOBCOST) DESC, CC_NAME

-- Highest Cost by Printer
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 	
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 11,'Top 5 Highest Cost per OU/Printer',
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + ISNULL(PRINTERNAME,''), isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
AND ISNULL(PRINTERNAME,'') <> ''
GROUP BY OU_NAME, PRINTERNAME
ORDER BY SUM(JOBCOST) DESC, OU_NAME, PRINTERNAME

-- Lowest Cost by Printer
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 	
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 12,'Bottom 5 Cost per OU/Printer',
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + ISNULL(PRINTERNAME,''), isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
AND ISNULL(PRINTERNAME,'') <> ''
GROUP BY OU_NAME, PRINTERNAME
ORDER BY SUM(JOBCOST), OU_NAME, PRINTERNAME


-- Highest Cost by Computer
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 13, 'Top 5 Highest Cost per OU/Computer',
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + COMPUTERNAME, isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
AND ISNULL(COMPUTERNAME,'') <> ''
GROUP BY OU_NAME, COMPUTERNAME
ORDER BY  SUM(JOBCOST) DESC, OU_NAME, COMPUTERNAME

-- Lowest Cost by Computer
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 14, 'Bottom 5 Cost per OU/Computer',
	@ParmStartDt, @ParmEndDt, ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + COMPUTERNAME, isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
AND ISNULL(COMPUTERNAME,'') <> ''
GROUP BY OU_NAME, COMPUTERNAME
ORDER BY  SUM(JOBCOST), OU_NAME, COMPUTERNAME

-- Highest Cost by Account Badge
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 15, 'Top 5 Highest Cost per OU/Account', 
@ParmStartDt, @ParmEndDt, LTRIM(RTRIM(ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + ACC_BADGE)), isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY OU_NAME, ACC_BADGE
ORDER BY SUM(JOBCOST) DESC, OU_NAME, ACC_BADGE

-- Lowest Cost by Account Badge
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, 
	StartDate, EndDate,DataDesc1, DataValue1)
SELECT top 5 @SessionName, 16, 'Bottom 5 Cost per OU/Account', 
@ParmStartDt, @ParmEndDt, LTRIM(RTRIM(ISNULL(OU_NAME,'NOT SPECIFIED') + ' / ' + ACC_BADGE)), isnull(SUM(JOBCOST),0)
FROM docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY OU_NAME, ACC_BADGE
ORDER BY SUM(JOBCOST), OU_NAME, ACC_BADGE

drop table #SpikeValues

-- Top Clients / Avg Dollar Sales
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,17,'Top 5 Highest Avg Cost/Client',@ParmStartDt, @ParmEndDt, 
	CC_NAME, AVG(JOBCOST)
from docugate_activity_view
WHERE DATEDIFF(DAY,DT_REQUESTED,@StartDt) <= 0 
AND DATEDIFF(DAY,DT_REQUESTED,@EndDt) >= 0
GROUP BY CC_NAME
ORDER BY AVG(JOBCOST) DESC

-- Bottom Clients / Avg Dollar Sales
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,18,'Bottom 5 Avg Cost/Client',@ParmStartDt, @ParmEndDt, 
	CC_NAME, AVG(JOBCOST)
from docugate_activity_view
GROUP BY CC_NAME
ORDER BY AVG(JOBCOST) 

declare @Stmt varchar(500)
DECLARE tmpCursor CURSOR FOR
Select 'INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS (SessionName, StatsId, Description, DataDesc1, DataValue1) ' + char(10) + 
'Select ''' + @SessionName + ''',19,''Table : ' + alias + ''',''# of records'',COUNT(*) from ' + tablename 
FROM docugate_static_tableinfo WHERE (ShowInQuickStats = 1) ORDER BY GroupNo, Alias

OPEN tmpCursor
FETCH NEXT FROM tmpCursor into @Stmt
WHILE @@FETCH_STATUS = 0
BEGIN
   exec (@Stmt)
   FETCH NEXT FROM tmpCursor into @Stmt
END
CLOSE tmpCursor
DEALLOCATE tmpCursor

-- Account/Security Level Split
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,5,'Account / Security Level',null, null, 
case acc_access_level
when 1 then '# OF USERS'
when 2 then '# OF CASHIERS'
when 3 then '# OF ADMINISTRATORS'
else 'User' end as acc_access_level_desc, count(*) 
from docugate_acc_view group by acc_access_level

-- Number of Smart Terminals
INSERT INTO dbo.DOCUGATE_REPORT_CONSOLESTATS 
(SessionName, StatsId, Description,StartDate, EndDate, DataDesc1, DataValue1) 
Select @SessionName,5,'# of Smart Terminals',NULL, 'TERMINAL', 
TerminalType_Desc, count(*) from dbo.docugate_ctlunit_view
group by TerminalType_Desc

if @ShowResults = 1
  select * from docugate_report_consolestats where Sessionname = @SessionName
GO
/****** Object:  View [dbo].[view_activity_acc_dt_printjobs]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_activity_acc_dt_printjobs]
as
SELECT OU_NAME, ACC_BADGE, ACC_FULLNAME, 
CONVERT(CHAR(10),DT_REQUESTED,121) AS DT_REQUESTED_YYYYMMDD,
SUM(ISNULL(PAGECOUNT,0)) AS PRINTPAGECNT, SUM(ISNULL(JOBCOST,0)) AS PRINTJOBCOST 
FROM dbo.docugate_activity_view 
WHERE JOBTYPE=1
GROUP BY OU_NAME, ACC_BADGE, ACC_FULLNAME, CONVERT(CHAR(10),DT_REQUESTED,121)
GO
/****** Object:  View [dbo].[view_activity_acc_dt_jobtype_transposed]    Script Date: 08/15/2011 16:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_activity_acc_dt_jobtype_transposed]
as
select a.*, 
ISNULL(b.PRINTPAGECNT,0) AS PRINTPAGECNT,
ISNULL(b.PRINTJOBCOST,0) AS PRINTJOBCOST,
ISNULL(c.COPYPAGECNT,0) AS COPYPAGECNT,
ISNULL(c.COPYJOBCOST,0) AS COPYJOBCOST,
A.DT_REQUESTED_YYYYMMDD AS DT_REQUESTED
from dbo.view_activity_acc_dt_alljobs a
	left join dbo.view_activity_acc_dt_printjobs b 
ON a.ACC_BADGE = b.ACC_BADGE and a.DT_REQUESTED_YYYYMMDD = b.DT_REQUESTED_YYYYMMDD
	left join dbo.view_activity_acc_dt_copyjobs c
ON a.ACC_BADGE = c.ACC_BADGE and a.DT_REQUESTED_YYYYMMDD = c.DT_REQUESTED_YYYYMMDD
GO
/****** Object:  StoredProcedure [dbo].[get_quick_stats]    Script Date: 08/15/2011 16:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [dbo].[get_quick_stats]
(@SessionName varchar(60), @ParmStartDt varchar(10), @ParmEndDt varchar(10))	
as
/*
   Written by Lynette Austin
   08/02/2008
   --
   Called from the DocuGate Administration application
   to display various quick online statistics.
*/
set nocount on

exec dbo.get_console_stats @SessionName,@ParmStartDt,@ParmEndDt,0

delete from dbo.docugate_report_quickstats where SessionName = @SessionName

-- Sales count
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,1,'',isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 1


-- Sales amount
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,2,'',isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 2

-- top cashier sales
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,3, CASE(DataDesc1) WHEN '' THEN 'NOT SPECIFIED' ELSE DataDesc1 end,
isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId=3
and DataValue1 = (Select max(DataValue1) from docugate_report_consolestats
where Sessionname = @SessionName and StatsId=3)

-- Top client cost
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,4, case(DataDesc1) when '' then 'NOT SPECIFIED' ELSE DataDesc1 end, 
isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId=10
and DataValue1 = (Select max(DataValue1) from docugate_report_consolestats
where Sessionname = @SessionName and StatsId=10)

-- Top OU Cost
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,5,case(DataDesc1) when '' then 'NOT SPECIFIED' ELSE DataDesc1 end, 
isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId=9
and DataValue1 = (Select max(DataValue1) from docugate_report_consolestats
where Sessionname = @SessionName and StatsId=9)

-- Total Copies
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,6,'',isnull(sum(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 7

-- Total Pages
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,7,'',isnull(sum(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 8

-- # Accounts Available
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,8,DataDesc1,isnull(convert(int,DataValue1),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 5 and datadesc1 = '# AVAILABLE'

-- # Accounts Checked out
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,9,DataDesc1,isnull(convert(int,DataValue1),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 5 and datadesc1 = '# CHECKED OUT'

-- # Accounts PERMANENT
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,10,DataDesc1,isnull(SUM(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 6 and datadesc1 = 'PERMANENT' 
GROUP BY DataDesc1

-- # Accounts WALK-IN
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,11,DataDesc1,isnull(SUM(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 6 and datadesc1 = 'WALK-IN'
GROUP BY DataDesc1

-- Top client avg cost
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
select @Sessionname,12,case(DataDesc1) when '' then 'NOT SPECIFIED' ELSE DataDesc1 end, 
isnull(DataValue1,0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId=17
and DataValue1 = (Select max(DataValue1) from docugate_report_consolestats
where Sessionname = @SessionName and StatsId=17)

-- # Account / Security Level'
insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,13,DataDesc1,isnull(SUM(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 5 and datadesc1 = '# OF USERS'
GROUP BY DataDesc1

insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,14,DataDesc1,isnull(SUM(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 5 and datadesc1 = '# OF CASHIERS'
GROUP BY DataDesc1

insert into docugate_report_quickstats (SessionName,RowId, DataDesc1, DataValue1)
Select @Sessionname,15,DataDesc1,isnull(SUM(convert(int,DataValue1)),0) from docugate_report_consolestats
where Sessionname = @SessionName
and StatsId = 5 and datadesc1 = '# OF ADMINISTRATORS'
GROUP BY DataDesc1
GO
/****** Object:  Default [DF_docugate_active_sessions_active_sessions_session_guid]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_bmt_session_active] ADD  CONSTRAINT [DF_docugate_active_sessions_active_sessions_session_guid]  DEFAULT (newid()) FOR [BMT_SESSION_ACTIVE_BADGE]
GO
/****** Object:  Default [DF_docugate_acc_ACC_GUID]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_acc_ACC_GUID]  DEFAULT (newid()) FOR [ACC_ACC_GUID]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_TYPE]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_TYPE]  DEFAULT ('PERMANENT') FOR [ACC_TYPE]
GO
/****** Object:  Default [DF_docugate_accounts_BADGE]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_BADGE]  DEFAULT ('') FOR [ACC_BADGE]
GO
/****** Object:  Default [DF_docugate_accounts_FIRSTNAME]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_FIRSTNAME]  DEFAULT ('') FOR [ACC_FIRSTNAME]
GO
/****** Object:  Default [DF_docugate_accounts_LASTNAME]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_LASTNAME]  DEFAULT ('') FOR [ACC_LASTNAME]
GO
/****** Object:  Default [DF_docugate_accounts_FULLNAME]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_FULLNAME]  DEFAULT ('') FOR [ACC_FULLNAME]
GO
/****** Object:  Default [DF_docugate_accounts_ACCESS_LEVEL]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_ACCESS_LEVEL]  DEFAULT ((3)) FOR [ACC_ACCESS_LEVEL]
GO
/****** Object:  Default [DF_docugate_accounts_PASSWORD]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_accounts_PASSWORD]  DEFAULT ('') FOR [ACC_PASSWORD]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_PASSWORD_ENABLED]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_PASSWORD_ENABLED]  DEFAULT ((0)) FOR [ACC_PASSWORD_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_PIN_ENABLED]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_PIN_ENABLED]  DEFAULT ((0)) FOR [ACC_PIN_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_COPYPIN_ENABLED]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_COPYPIN_ENABLED]  DEFAULT ((0)) FOR [ACC_COPYPIN_ENABLED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_LOCKED]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_LOCKED]  DEFAULT ((0)) FOR [ACC_LOCKED]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_AVAILABILITY]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_AVAILABILITY]  DEFAULT ((1)) FOR [ACC_AVAILABILITY]
GO
/****** Object:  Default [DF_docugate_general_acc_ACC_DEFAULT_ONLY]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc] ADD  CONSTRAINT [DF_docugate_general_acc_ACC_DEFAULT_ONLY]  DEFAULT ((0)) FOR [ACC_DEFAULT_ONLY]
GO
/****** Object:  Default [DF__docugate___ACC_A__7B5B524B]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_details] ADD  DEFAULT ('') FOR [ACC_ADDRESS]
GO
/****** Object:  Default [DF__docugate___ACC_Z__7C4F7684]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_details] ADD  DEFAULT ('') FOR [ACC_ZIP]
GO
/****** Object:  Default [DF__docugate___ACC_C__7D439ABD]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_details] ADD  DEFAULT ('') FOR [ACC_CELL]
GO
/****** Object:  Default [DF__docugate___ACC_P__7E37BEF6]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_details] ADD  DEFAULT ('') FOR [ACC_PHONE]
GO
/****** Object:  Default [DF__docugate___ENABL__02FC7413]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_maxspend] ADD  DEFAULT ((0)) FOR [ENABLED]
GO
/****** Object:  Default [DF__docugate___AMOUN__03F0984C]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_acc_maxspend] ADD  DEFAULT ('0.00') FOR [AMOUNT]
GO
/****** Object:  Default [DF_docugate_general_activity_guid]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity] ADD  CONSTRAINT [DF_docugate_general_activity_guid]  DEFAULT (newid()) FOR [JOB_GUID]
GO
/****** Object:  Default [DF__docugate___COMPU__08EA5793]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity] ADD  DEFAULT ('Unassigned') FOR [COMPUTERNAME]
GO
/****** Object:  Default [DF__docugate___PRINT__09DE7BCC]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity] ADD  DEFAULT ('Unassigned') FOR [PRINTERNAME]
GO
/****** Object:  Default [DF__docugate___j_row__2CF2ADDF]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_journel] ADD  DEFAULT (newid()) FOR [j_row]
GO
/****** Object:  Default [DF__docugate___j_dat__2DE6D218]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_journel] ADD  DEFAULT (getdate()) FOR [j_date]
GO
/****** Object:  Default [DF__docugate_ge__PL1__123EB7A3]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_pl] ADD  DEFAULT ((0)) FOR [PL1]
GO
/****** Object:  Default [DF__docugate_ge__PL2__1332DBDC]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_pl] ADD  DEFAULT ((0)) FOR [PL2]
GO
/****** Object:  Default [DF__docugate_ge__PL3__14270015]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_pl] ADD  DEFAULT ((0)) FOR [PL3]
GO
/****** Object:  Default [DF__docugate_ge__PL4__151B244E]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_activity_pl] ADD  DEFAULT ((0)) FOR [PL4]
GO
/****** Object:  Default [DF_docugate_cc_CC_GUID]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_cc] ADD  CONSTRAINT [DF_docugate_cc_CC_GUID]  DEFAULT (newid()) FOR [CC_GUID]
GO
/****** Object:  Default [DF__docugate___CC_BW__7C6F7215]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_cc] ADD  CONSTRAINT [DF__docugate___CC_BW__7C6F7215]  DEFAULT ('1.00') FOR [CC_PRN_MULTIPLR]
GO
/****** Object:  Default [DF__docugate___CC_CP__7E57BA87]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_cc] ADD  CONSTRAINT [DF__docugate___CC_CP__7E57BA87]  DEFAULT ('1.00') FOR [CC_CPY_MULTIPLR]
GO
/****** Object:  Default [DF_docugate_cm_CM_GUID]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_cm] ADD  CONSTRAINT [DF_docugate_cm_CM_GUID]  DEFAULT (newid()) FOR [CM_GUID]
GO
/****** Object:  Default [DF_docugate_ctlunit_CTLUNIT_GUID]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit] ADD  CONSTRAINT [DF_docugate_ctlunit_CTLUNIT_GUID]  DEFAULT (newid()) FOR [CTLUNIT_GUID]
GO
/****** Object:  Default [DF__docugate___ENABL__19DFD96B]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit_custom_pl] ADD  DEFAULT ((0)) FOR [ENABLED]
GO
/****** Object:  Default [DF__docugate_ge__PL1__1AD3FDA4]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit_custom_pl] ADD  DEFAULT ('') FOR [PL1]
GO
/****** Object:  Default [DF__docugate_ge__PL2__1BC821DD]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit_custom_pl] ADD  DEFAULT ('') FOR [PL2]
GO
/****** Object:  Default [DF__docugate_ge__PL3__1CBC4616]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit_custom_pl] ADD  DEFAULT ('') FOR [PL3]
GO
/****** Object:  Default [DF__docugate_ge__PL4__1DB06A4F]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ctlunit_custom_pl] ADD  DEFAULT ('') FOR [PL4]
GO
/****** Object:  Default [DF__docugate___GLOBA__6F1576F7]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__6F1576F7]  DEFAULT ('1.00') FOR [GLOBALS_SFBW]
GO
/****** Object:  Default [DF__docugate___GLOBA__70099B30]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__70099B30]  DEFAULT ('1.00') FOR [GLOBALS_LFBW]
GO
/****** Object:  Default [DF__docugate___GLOBA__70FDBF69]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__70FDBF69]  DEFAULT ('1.00') FOR [GLOBALS_SFCOLOR]
GO
/****** Object:  Default [DF__docugate___GLOBA__71F1E3A2]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__71F1E3A2]  DEFAULT ('1.00') FOR [GLOBALS_LFCOLOR]
GO
/****** Object:  Default [DF__docugate___GLOBA__72E607DB]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__72E607DB]  DEFAULT ('1.00') FOR [GLOBALS_ADDIT_CHRG_SCANS]
GO
/****** Object:  Default [DF__docugate___GLOBA__73DA2C14]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__73DA2C14]  DEFAULT ('1.00') FOR [GLOBALS_ADDIT_CHRG_FAXES]
GO
/****** Object:  Default [DF__docugate___GLOBA__74CE504D]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__74CE504D]  DEFAULT ('1.00') FOR [GLOBALS_ADDIT_CHRG_EMAILS]
GO
/****** Object:  Default [DF__docugate___GLOBA__75C27486]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__75C27486]  DEFAULT ('1.00') FOR [GLOBALS_SITE_MULTIPLR]
GO
/****** Object:  Default [DF__docugate___GLOBA__76B698BF]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__76B698BF]  DEFAULT ('1.00') FOR [GLOBALS_EXT1]
GO
/****** Object:  Default [DF__docugate___GLOBA__77AABCF8]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__77AABCF8]  DEFAULT ('1.00') FOR [GLOBALS_EXT2]
GO
/****** Object:  Default [DF__docugate___GLOBA__789EE131]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__789EE131]  DEFAULT ('1.00') FOR [GLOBALS_EXT3]
GO
/****** Object:  Default [DF__docugate___GLOBA__7993056A]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__7993056A]  DEFAULT ('1.00') FOR [GLOBALS_EXT4]
GO
/****** Object:  Default [DF__docugate___GLOBA__7A8729A3]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__7A8729A3]  DEFAULT ('1.00') FOR [GLOBALS_EXT5]
GO
/****** Object:  Default [DF__docugate___GLOBA__7B7B4DDC]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF__docugate___GLOBA__7B7B4DDC]  DEFAULT ('1.00') FOR [GLOBALS_EXT_MULTIPLR1]
GO
/****** Object:  Default [DF_docugate_general_global_GLOBALS_EXT_MULTIPLIER11]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  CONSTRAINT [DF_docugate_general_global_GLOBALS_EXT_MULTIPLIER11]  DEFAULT ('1.00') FOR [GLOBALS_EXT_MULTIPLR2]
GO
/****** Object:  Default [DF__docugate___GLOBA__236943A5]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  DEFAULT ('0.00') FOR [GLOBALS_MAXSPEND]
GO
/****** Object:  Default [DF__docugate___GLOBA__245D67DE]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  DEFAULT ((0)) FOR [GLOBALS_MAXSPEND_ENABLED]
GO
/****** Object:  Default [DF__docugate___GLOBA__25518C17]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  DEFAULT ('0.25') FOR [GLOBALS_UNITVALUE]
GO
/****** Object:  Default [DF__docugate___GLOBA__2645B050]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_global] ADD  DEFAULT ((0)) FOR [GLOBALS_UNITVALUE_ENABLED]
GO
/****** Object:  Default [DF_docugate_ou_OU_GUID]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF_docugate_ou_OU_GUID]  DEFAULT (newid()) FOR [OU_GUID]
GO
/****** Object:  Default [DF_docugate_ou_OU_CHARGE]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF_docugate_ou_OU_CHARGE]  DEFAULT ('NA') FOR [OU_CHARGE]
GO
/****** Object:  Default [DF__docugate___COLOR__5B0E7E4A]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF__docugate___COLOR__5B0E7E4A]  DEFAULT ('1.00') FOR [OU_PRN_MULTIPLR]
GO
/****** Object:  Default [DF__docugate___CPY_M__5C02A283]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou] ADD  CONSTRAINT [DF__docugate___CPY_M__5C02A283]  DEFAULT ('1.00') FOR [OU_CPY_MULTIPLR]
GO
/****** Object:  Default [DF__docugate___ENABL__08B54D69]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou_maxspend] ADD  DEFAULT ((0)) FOR [ENABLED]
GO
/****** Object:  Default [DF__docugate___AMOUN__09A971A2]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_general_ou_maxspend] ADD  DEFAULT ('0.00') FOR [AMOUNT]
GO
/****** Object:  Default [DF__docugate___ACC_T__2DBCB4E6]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_tran_acc_funds] ADD  CONSTRAINT [DF__docugate___ACC_T__2DBCB4E6]  DEFAULT (newid()) FOR [ACC_TRAN_GUID]
GO
/****** Object:  Default [DF__docugate___ACC_T__2EB0D91F]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_tran_acc_funds] ADD  CONSTRAINT [DF__docugate___ACC_T__2EB0D91F]  DEFAULT (getdate()) FOR [ACC_TRAN_DT]
GO
/****** Object:  Default [DF_docugate_tran_acc_funds_ACC_TRAN_AMT_DEBIT]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_tran_acc_funds] ADD  CONSTRAINT [DF_docugate_tran_acc_funds_ACC_TRAN_AMT_DEBIT]  DEFAULT ((0)) FOR [ACC_TRAN_AMT_DEBIT]
GO
/****** Object:  Default [DF_docugate_tran_acc_funds_ACC_TRAN_AMT_CREDIT]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_tran_acc_funds] ADD  CONSTRAINT [DF_docugate_tran_acc_funds_ACC_TRAN_AMT_CREDIT]  DEFAULT ((0)) FOR [ACC_TRAN_AMT_CREDIT]
GO
/****** Object:  Default [DF__docugate_t__GUID__22751F6C]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[docugate_tran_codes] ADD  DEFAULT (newid()) FOR [GUID]
GO
/****** Object:  Default [DF_eCashier_History_TranDate]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[eCashier_History] ADD  CONSTRAINT [DF_eCashier_History_TranDate]  DEFAULT (getdate()) FOR [trandate]
GO
/****** Object:  Default [DF_eCashier_logons_date]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[eCashier_logons] ADD  CONSTRAINT [DF_eCashier_logons_date]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_ecashier_transactions_transdate]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[ecashier_transactions] ADD  CONSTRAINT [DF_ecashier_transactions_transdate]  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  Default [DF_ecashier_transactions_amount]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[ecashier_transactions] ADD  CONSTRAINT [DF_ecashier_transactions_amount]  DEFAULT ((0.00)) FOR [amount]
GO
/****** Object:  Default [DF__lp_lab__lp_lab_f__3C34F16F]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[lp_lab] ADD  DEFAULT (getdate()) FOR [lp_lab_fp_expire]
GO
/****** Object:  Default [DF__lp_lab_ma__lp_ma__40F9A68C]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[lp_lab_machines] ADD  DEFAULT (getdate()) FOR [lp_machine_fp_expire]
GO
/****** Object:  Default [DF__lp_lab_pa__fp_st__42E1EEFE]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[lp_lab_params] ADD  DEFAULT ((1)) FOR [fp_start]
GO
/****** Object:  Default [DF__lp_lab_pa__fp_le__43D61337]    Script Date: 08/15/2011 16:56:22 ******/
ALTER TABLE [dbo].[lp_lab_params] ADD  DEFAULT ((3)) FOR [fp_length]
GO
