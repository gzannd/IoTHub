/****** Object:  User [EZSortApp]    Script Date: 9/5/2018 2:57:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'EZSortApp')
CREATE USER [EZSortApp] FOR LOGIN [EZSortApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [amh]    Script Date: 9/5/2018 2:57:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'amh')
EXEC sys.sp_executesql N'CREATE SCHEMA [amh]'
GO
/****** Object:  Schema [nlog]    Script Date: 9/5/2018 2:57:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'nlog')
EXEC sys.sp_executesql N'CREATE SCHEMA [nlog]'
GO
/****** Object:  Schema [rp]    Script Date: 9/5/2018 2:57:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'rp')
EXEC sys.sp_executesql N'CREATE SCHEMA [rp]'
GO
/****** Object:  Schema [sf]    Script Date: 9/5/2018 2:57:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'sf')
EXEC sys.sp_executesql N'CREATE SCHEMA [sf]'
GO
/****** Object:  Table [amh].[BinInductions]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[BinInductions]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[BinInductions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BinLimitSensorFilter] [int] NOT NULL,
	[CycleTimeoutTime] [float] NOT NULL,
	[DOWNDelayTime] [float] NOT NULL,
	[EnableDisablePB] [bit] NOT NULL,
	[LowerLimitSensorFilter] [int] NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextConveyorId] [int] NULL,
	[PreUPTime] [float] NOT NULL,
	[UpOffTime] [float] NOT NULL,
	[UpOnTime] [float] NOT NULL,
	[UpperLimitSensorFilter] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[PLCId] [int] NOT NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_amh.BinInductions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[BookDrops]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[BookDrops]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[BookDrops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlarmTimeout] [int] NOT NULL,
	[InfeedSensorFilter] [int] NOT NULL,
	[NextConveyorId] [int] NULL,
	[SoundId] [int] NULL,
	[PLCId] [int] NOT NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_amh.BookDrops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ButtonLocations]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ButtonLocations]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ButtonLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_amh.ButtonLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[Channel_ChannelModes]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[Channel_ChannelModes]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[Channel_ChannelModes](
	[Channel_ChannelModeId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelId] [int] NOT NULL,
	[ChannelModeId] [int] NOT NULL,
 CONSTRAINT [PK_hwc.Channel_ChannelModes] PRIMARY KEY CLUSTERED 
(
	[Channel_ChannelModeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ChannelInitParams]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ChannelInitParams]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ChannelInitParams](
	[Id] [int] NOT NULL,
	[TagWriteTime] [int] NOT NULL,
	[TagReadTime] [int] NOT NULL,
	[Power] [int] NOT NULL,
	[MUX_MaximumTime] [int] NOT NULL,
	[MUX_MaximumRounds] [int] NOT NULL,
 CONSTRAINT [PK_amh.ChannelInitParams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[Channels]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[Channels]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[Channels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequireFullSetToSort] [bit] NOT NULL,
	[AFIByteValue] [int] NOT NULL,
	[WriteTime] [int] NOT NULL,
	[IsEASValueOn] [bit] NOT NULL,
	[ReaderDeviceId] [int] NULL,
	[ConveyorId] [int] NULL,
	[ChannelIndexNumber] [int] NULL,
	[ItemProcessId] [int] NULL,
	[ChannelMode] [int] NOT NULL,
	[NodeId] [int] NULL,
	[ChannelItemInformationModuleId] [int] NULL,
	[LogStats] [bit] NOT NULL,
	[DebounceSeconds] [int] NOT NULL,
	[AMHReadDwellTime] [int] NOT NULL,
	[SortDuplicateItems] [bit] NOT NULL,
 CONSTRAINT [PK_hwc.Channels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ChatWidgets]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ChatWidgets]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ChatWidgets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_amh.ChatWidgets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[Conveyors]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[Conveyors]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[Conveyors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlarmTimeout] [int] NOT NULL,
	[ConveyorMaxOnTime] [float] NOT NULL,
	[ConveyorOffTime] [float] NOT NULL,
	[ConveyorOnTime] [float] NOT NULL,
	[ConveyorRepeatOnTime] [float] NOT NULL,
	[ConveyorTypeId] [int] NOT NULL,
	[ConveyorWaitDelay] [float] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[ItemAtConveyorTimeout] [float] NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextConveyorId] [int] NULL,
	[PreviousConveyorId] [int] NULL,
	[SorterId] [int] NULL,
	[EnableDisablePB] [bit] NOT NULL,
	[OutfeedSensorFilter] [int] NOT NULL,
	[PLCId] [int] NOT NULL,
	[Direction] [bit] NOT NULL,
	[NodeId] [int] NULL,
	[PreviousConveyorBId] [int] NULL,
 CONSTRAINT [PK_amh.Conveyors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ConveyorTypes]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ConveyorTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ConveyorTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_amh.ConveyorTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[GlobalCheckinModificationConfig]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[GlobalCheckinModificationConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[GlobalCheckinModificationConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BackdateCheckinDays] [int] NULL,
	[FreezeCheckinDate] [datetime] NULL,
	[TypeId] [int] NOT NULL,
	[IsUnfrozen] [bit] NOT NULL,
	[IsBackdateCheckinsActive] [bit] NOT NULL,
	[IsFreezeCheckinsActive] [bit] NOT NULL,
 CONSTRAINT [PK_amh.GlobalCheckinModificationConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[GlobalCheckinModificationConfigTypes]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[GlobalCheckinModificationConfigTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[GlobalCheckinModificationConfigTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_amh.GlobalCheckinModificationConfigTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ItemProcessActions]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ItemProcessActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ItemProcessActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemProcessRuleId] [int] NOT NULL,
	[SIPMessageId] [int] NULL,
	[ItemProcessId] [int] NOT NULL,
	[SoundId] [int] NULL,
	[ReceiptDesignId] [int] NULL,
 CONSTRAINT [PK_amh.ItemProcessActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ItemProcesses]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ItemProcesses]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ItemProcesses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayItemOnInfoScreen] [bit] NOT NULL,
	[RequireFullSetForProcessing] [bit] NOT NULL,
	[AllowMultipleProcessings] [bit] NOT NULL,
	[AllowMultipleCheckins] [bit] NOT NULL,
	[CheckInDelay] [int] NOT NULL,
	[ReprocessDelay] [int] NOT NULL,
	[CheckItemIn] [bit] NOT NULL,
	[ReprocessLimit] [int] NOT NULL,
	[ILSTimeout] [int] NOT NULL,
	[ItemProcessTimeout] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_amh.ItemProcesses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ItemTesterConfigs]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ItemTesterConfigs]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ItemTesterConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChannelId] [int] NOT NULL,
 CONSTRAINT [PK_amh.ItemTesterConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[RadioInitParams]    Script Date: 9/5/2018 2:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[RadioInitParams]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[RadioInitParams](
	[RadioInitParamsId] [int] NOT NULL,
	[FlipBytes] [bit] NOT NULL,
	[PersistenceEvent] [int] NOT NULL,
	[FirstBlock] [int] NOT NULL,
	[NumberOfBlocks] [int] NOT NULL,
	[SignalLevelThreshold] [int] NULL,
	[ReadUid] [int] NULL,
	[FastMode] [int] NULL,
	[TagReadTime] [int] NULL,
	[DownlinkNumberOfSubcarriers] [int] NULL,
	[DownlinkDataRate] [int] NULL,
	[UplinkModulationDepthCommand] [int] NULL,
	[UplinkModulationDepthEOF] [int] NULL,
	[ViccMemoryBlockLength] [int] NULL,
	[ViccMemoryNumberOfBlocks] [int] NULL,
	[WriteBlockLength] [int] NULL,
	[InventoryModeMask] [int] NULL,
	[UplinkDataCoding] [int] NULL,
	[ProtocolExtensionFlag] [int] NULL,
	[AFI] [int] NULL,
	[QuietOnceRead] [int] NULL,
	[WriteOptionFlag] [int] NULL,
	[SingleSlottedRead] [int] NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReaderDeviceId] [int] NOT NULL,
 CONSTRAINT [PK_amh.RadioInitParams] PRIMARY KEY CLUSTERED 
(
	[RadioInitParamsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ReaderDevices]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ReaderDevices]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ReaderDevices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsEnabled] [bit] NOT NULL,
	[IpAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryPort] [int] NOT NULL,
	[SecondaryPort] [int] NOT NULL,
	[StartBlock] [int] NOT NULL,
	[NumberOfBlocks] [int] NOT NULL,
	[ReadTime] [int] NOT NULL,
	[MACAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_hwc.ReaderDevices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[Sorters]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[Sorters]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[Sorters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextSortDirection] [bit] NOT NULL,
	[SorterTypeId] [int] NULL,
	[ConveyorId] [int] NULL,
	[NextSortId] [int] NULL,
	[NumberOfSorts] [int] NOT NULL,
	[NextSortPosition] [int] NOT NULL,
	[ExceptionSortId] [int] NULL,
	[SortIds] [int] NOT NULL,
	[Pos1Filter] [int] NOT NULL,
	[Pos2Filter] [int] NOT NULL,
	[Pos3Filter] [int] NOT NULL,
	[PLCId] [int] NOT NULL,
	[PlusOvertravelFilter] [int] NOT NULL,
	[MinusOvertravelFilter] [int] NOT NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_amh.Sorters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[sorterTypes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[sorterTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[sorterTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_amh.sorterTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[Sorts]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[Sorts]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[Sorts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConveyorId] [int] NULL,
	[EnableDisablePB] [bit] NOT NULL,
	[FullLightEnable] [bit] NOT NULL,
	[InfeedInputFilter] [int] NOT NULL,
	[LowerSort] [bit] NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextConveyorId] [int] NULL,
	[NextSortId] [int] NULL,
	[NumberOfItemsFull] [int] NOT NULL,
	[PurgeSort] [bit] NOT NULL,
	[RaiseSort] [bit] NOT NULL,
	[ResetItems] [bit] NOT NULL,
	[RollerDownInputFilter] [int] NOT NULL,
	[RollerTriggerDelay] [float] NOT NULL,
	[RollerUpInputFilter] [int] NOT NULL,
	[RollerUpTime] [float] NOT NULL,
	[SortDirection] [bit] NOT NULL,
	[SorterId] [int] NULL,
	[SortPosition] [int] NOT NULL,
	[StopOnFull] [bit] NOT NULL,
	[SortTypeId] [int] NOT NULL,
	[PLCId] [int] NOT NULL,
	[IsSortProcessesHolds] [bit] NOT NULL,
	[IsSortProcessesInTransits] [bit] NOT NULL,
	[IsProcessesMultipleTags] [bit] NOT NULL,
	[IsSortRequiresCheckedInItem] [bit] NOT NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_amh.Sorts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[SortTypes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[SortTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[SortTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_amh.SortTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [amh].[ToteInductions]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[ToteInductions]') AND type in (N'U'))
BEGIN
CREATE TABLE [amh].[ToteInductions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnableDisablePB] [bit] NOT NULL,
	[StartStopButton] [bit] NOT NULL,
	[UpperLimitSensorFilter] [int] NOT NULL,
	[LowerLimitSensorFilter] [int] NOT NULL,
	[NextConveyorId] [int] NULL,
	[StageUPTime] [float] NOT NULL,
	[UpOnTime] [float] NOT NULL,
	[UpOffTime] [float] NOT NULL,
	[DOWNDelayTime] [float] NOT NULL,
	[PLCId] [int] NOT NULL,
	[NodeId] [int] NULL,
 CONSTRAINT [PK_amh.ToteInductions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContextKey] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_3MItemIdMemoryMapItem]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_3MItemIdMemoryMapItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_3MItemIdMemoryMapItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo._3MItemIdMemoryMapItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_3MItemType]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_3MItemType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_3MItemType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo._3MItemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[_3MTagDataField]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_3MTagDataField]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_3MTagDataField](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo._3MTagDataField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AdminSettings]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdminSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsReceiptPrinterUsed] [bit] NOT NULL,
	[DBBackupPath] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TesterChannelId] [int] NULL,
	[TesterReaderId] [int] NULL,
	[Language] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationCode] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoBlock] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminalPassword] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PWDAlgorithm] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UIDAlgorithm] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrentLocation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LibraryName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstitutionId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TerminalLocation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPassword] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ILSUsesLogin] [bit] NOT NULL,
	[ILSPort] [int] NOT NULL,
	[ILSIPAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ILSSendsMulipleMessages] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailServer] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailServerPort] [int] NOT NULL,
	[ILSPingInterval] [int] NOT NULL,
	[ExportPath] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FromEmailAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FromPassword] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MainDiagramZoom] [float] NOT NULL,
	[MainDiagramXOffset] [float] NOT NULL,
	[MainDiagramYOffset] [float] NOT NULL,
	[DailyLogsCleanTime] [datetime] NULL,
	[PLCIPAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExpectedPrinterName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DebugLoggingEnabled] [bit] NOT NULL,
	[LibraryDisplayName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.AdminSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AlertDTOes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlertDTOes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlertDTOes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Timestamp] [datetime] NOT NULL,
	[AlertType] [int] NOT NULL,
	[UserId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [int] NOT NULL,
	[Exception] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Topic] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsSticky] [bit] NOT NULL,
	[IsDismissed] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AlertDTOes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ClaimType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProviderKey] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RoleId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Hometown] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecurityStamp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ChannelModes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChannelModes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChannelModes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_hwc.ChannelModes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DragDropItems]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DragDropItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DragDropItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OffsetX] [float] NOT NULL,
	[OffsetY] [float] NOT NULL,
	[ZIndex] [int] NOT NULL,
	[Angle] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
 CONSTRAINT [PK_sf.Nodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DraggableWidgets]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DraggableWidgets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DraggableWidgets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NULL,
	[IsHidden] [bit] NOT NULL,
	[WidgetType] [int] NOT NULL,
 CONSTRAINT [PK_amh.ChannelItemInformationModules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmailAddresses]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmailAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmailAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdminSettingsId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EmailAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GeneralLogs]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneralLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneralLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Level] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateTime] [datetime] NULL,
	[StackTrace] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InnerException] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_GeneralLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ISO28560DataFormat]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ISO28560DataFormat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ISO28560DataFormat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.ISO28560DataFormat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ISO28560OIDItem]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ISO28560OIDItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ISO28560OIDItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ISOObjectId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ISO28560OIDItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemColumnConfigs]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemColumnConfigs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemColumnConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColumnIndex] [int] NOT NULL,
	[SIPMessageFieldId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ItemColumnConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemLogs]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemLogs](
	[ItemIdentifier] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ItemLogs] PRIMARY KEY CLUSTERED 
(
	[ItemIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemSIPLogs]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemSIPLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemSIPLogs](
	[ItemIdentifier] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VersionNumber] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[ItemSIPLogId] [int] IDENTITY(1,1) NOT NULL,
	[SIPMessageFieldName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.ItemSIPLogs] PRIMARY KEY CLUSTERED 
(
	[ItemSIPLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemStateRules]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStateRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemStateRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckedStateSelectionRuleId] [int] NULL,
	[InTransitSelectionRuleId] [int] NULL,
	[OnHoldSelectionRuleId] [int] NULL,
	[TransitHoldSelectionRuleId] [int] NULL,
 CONSTRAINT [PK_dbo.ItemStateRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ItemStatusLogs]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStatusLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemStatusLogs](
	[ItemIdentifier] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[TitleIdentifier] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ProcessedDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[CheckedIn] [int] NOT NULL,
	[Exception] [int] NOT NULL,
	[OnHold] [int] NOT NULL,
	[InTransit] [int] NOT NULL,
	[TransitHold] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SortId] [int] NULL,
	[SortedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.ItemStatusLogs] PRIMARY KEY CLUSTERED 
(
	[ItemIdentifier] ASC,
	[VersionNumber] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PLCCommandDatabaseInfoes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLCCommandDatabaseInfoes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PLCCommandDatabaseInfoes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CommandPrefix] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.PLCCommandDatabaseInfoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PLCDataTypes]    Script Date: 9/5/2018 2:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLCDataTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PLCDataTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.PLCDataTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PLCParameterInfoes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLCParameterInfoes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PLCParameterInfoes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DataTypeId] [int] NOT NULL,
	[PLCCommandInfo_Id] [int] NOT NULL,
	[ParameterType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.PLCParameterInfoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProfileDTOes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProfileDTOes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SIPMessageFieldId] [int] NOT NULL,
	[_3MTagDataFieldId] [int] NULL,
	[_3MTagDataMemoryMapId] [int] NULL,
	[StartByte] [int] NULL,
	[ByteLength] [int] NULL,
	[ISO28560OIDItemId] [int] NULL,
	[ISO28560DataFormatId] [int] NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TagModelDTOId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ProfileDTOes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPFieldSortRuleGroup_SortRule]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroup_SortRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPFieldSortRuleGroup_SortRule](
	[SIPFieldSortRuleGroupId] [int] NOT NULL,
	[SIPFieldSortRuleId] [int] NOT NULL,
	[IsPositiveRule] [bit] NOT NULL,
	[SIPFieldSortRuleGroup_SortRuleId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_dbo.SIPFieldSortRuleGroup_SortRule] PRIMARY KEY CLUSTERED 
(
	[SIPFieldSortRuleGroup_SortRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPFieldSortRuleGroups]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPFieldSortRuleGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.SIPFieldSortRuleGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPFieldSortRules]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPFieldSortRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CombineConditions] [bit] NOT NULL,
	[SIPFieldId] [int] NOT NULL,
	[CombineRuleId] [int] NULL,
	[ConditionTypeName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Variable1Value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Variable2Value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsItemProcessRule] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SIPFieldSortRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPFieldTypes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPFieldTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPFieldTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.SIPFieldTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPItemLogs]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPItemLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPItemLogs](
	[Id] [int] NOT NULL,
	[ItemIdentifier] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldValue] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionDate] [datetime] NULL,
	[DateTime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPMessageFieldFormats]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPMessageFieldFormats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPMessageFieldFormats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CharacterCount] [int] NOT NULL,
	[FormatString] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.SIPMessageFieldFormats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPMessageFields]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPMessageFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPMessageFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlternateFieldId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldDelimiter] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldMessageLocation] [int] NOT NULL,
	[MultiplesOK] [bit] NOT NULL,
	[FieldMessageFormatId] [int] NULL,
	[SIPFieldTypeId] [int] NULL,
	[SIPMappingId] [int] NOT NULL,
	[SpecificLength] [int] NULL,
	[PaddingCharacter] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.SIPMessageFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPMessageMessageFields]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPMessageMessageFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPMessageMessageFields](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SIPMessageId] [int] NULL,
	[SIPMessageFieldId] [int] NOT NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[FieldOrderNumber] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SIPMessageMessageFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SIPMessages]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIPMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIPMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RequestSipMessageId] [int] NOT NULL,
	[ResponseSipMessageId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SIPMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SortScheme_RuleGroup_SortZone]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SortScheme_RuleGroup_SortZone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SortScheme_RuleGroup_SortZone](
	[SortScheme_RuleGroup_SortZone_Id] [int] IDENTITY(1,1) NOT NULL,
	[SortSchemeId] [int] NOT NULL,
	[SortRuleGroupId] [int] NULL,
	[SortZoneId] [int] NULL,
 CONSTRAINT [PK_dbo.SortScheme_RuleGroup_SortZone] PRIMARY KEY CLUSTERED 
(
	[SortScheme_RuleGroup_SortZone_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SortSchemes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SortSchemes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SortSchemes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.SortSchemes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SortSchemeScheduleIntervalTypes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleIntervalTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SortSchemeScheduleIntervalTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SortSchemeScheduleIntervalTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SortSchemeScheduleItems]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SortSchemeScheduleItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NextScheduledIteration] [datetime] NULL,
	[SortSchemeId] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[IntervalTypeId] [int] NOT NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EndTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[DurationInTicks] [bigint] NULL,
 CONSTRAINT [PK_dbo.SortSchemeScheduleItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sounds]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sounds]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sounds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FilePath] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.Sounds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StatisticsObjects]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatisticsObjects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StatisticsObjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TotalItems] [int] NOT NULL,
	[ExceptionItems] [int] NOT NULL,
	[ItemsCheckedIn] [int] NOT NULL,
	[ItemsInTransit] [int] NOT NULL,
	[ItemsOnHold] [int] NOT NULL,
	[ItemsOnTransitHold] [int] NOT NULL,
 CONSTRAINT [PK_dbo.StatisticsObjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TagModelDTOes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagModelDTOes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TagModelDTOes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsValidDataRequired] [bit] NOT NULL,
	[ItemIdLength] [int] NULL,
	[_3MItemIdMemoryMapItemId] [int] NULL,
	[_3MItemTypeId] [int] NULL,
	[ItemIdStartByte] [int] NULL,
	[ItemIdLength1] [int] NULL,
	[UseSetInfo] [bit] NULL,
	[SetSizeByte] [int] NULL,
	[ItemInSetByte] [int] NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PrecedingString] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SucceedingString] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.TagModelDTOes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TagModelTypes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagModelTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TagModelTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_dbo.TagModelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [nlog].[GeneralLogs]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[nlog].[GeneralLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [nlog].[GeneralLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Level] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateTime] [datetime] NULL,
	[StackTrace] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InnerException] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_GeneralLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [rp].[ReceiptContents]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[ReceiptContents]') AND type in (N'U'))
BEGIN
CREATE TABLE [rp].[ReceiptContents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NodeId] [int] NULL,
	[ReceiptSIPFieldConfigId] [int] NULL,
	[ReceiptConfigId] [int] NULL,
	[ReceiptContentType] [int] NOT NULL,
	[Font] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TextAlignment] [int] NOT NULL,
	[DateTimeFutureDays] [int] NOT NULL,
 CONSTRAINT [PK_rp.ReceiptDatas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [rp].[ReceiptDesigns]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[ReceiptDesigns]') AND type in (N'U'))
BEGIN
CREATE TABLE [rp].[ReceiptDesigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReceiptWidth] [float] NOT NULL,
	[ReceiptHeight] [float] NOT NULL,
 CONSTRAINT [PK_rp.ReceiptConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [rp].[ReceiptSIPFieldConfigs]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[ReceiptSIPFieldConfigs]') AND type in (N'U'))
BEGIN
CREATE TABLE [rp].[ReceiptSIPFieldConfigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartCharPosition] [int] NULL,
	[StartChar] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndChar] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SIPMessageFieldId] [int] NULL,
	[ManipulationType] [int] NOT NULL,
	[NumberOfCharacters] [int] NULL,
	[EndingType] [int] NOT NULL,
	[PrefixString] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SuffixString] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndCharPosition] [int] NULL,
 CONSTRAINT [PK_rp.ReceiptSIPFieldConfigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [rp].[ReceiptSIPSwapTexts]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[ReceiptSIPSwapTexts]') AND type in (N'U'))
BEGIN
CREATE TABLE [rp].[ReceiptSIPSwapTexts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SIPText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SwapText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReceiptSIPFieldConfigDTO_Id] [int] NULL,
 CONSTRAINT [PK_rp.ReceiptSIPSwapTexts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sf].[Nodes]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sf].[Nodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [sf].[Nodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OffsetX] [float] NOT NULL,
	[OffsetY] [float] NOT NULL,
	[ZIndex] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Angle] [float] NOT NULL,
 CONSTRAINT [PK_sf.Nodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__BinInduct__IsEna__17036CC0]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[BinInductions] ADD  DEFAULT ((0)) FOR [IsEnabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__BinInduct__PLCId__17F790F9]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[BinInductions] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__BookDrops__Sound__18EBB532]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[BookDrops] ADD  DEFAULT ((0)) FOR [SoundId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__BookDrops__PLCId__19DFD96B]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[BookDrops] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Channels__Channe__1AD3FDA4]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Channels] ADD  DEFAULT ((0)) FOR [ChannelMode]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Channels__LogSta__1BC821DD]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Channels] ADD  DEFAULT ((0)) FOR [LogStats]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Channels__Deboun__1CBC4616]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Channels] ADD  DEFAULT ((0)) FOR [DebounceSeconds]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Channels__AMHRea__1DB06A4F]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Channels] ADD  DEFAULT ((0)) FOR [AMHReadDwellTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Channels__SortDu__1EA48E88]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Channels] ADD  DEFAULT ((0)) FOR [SortDuplicateItems]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Conveyors__Enabl__1F98B2C1]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Conveyors] ADD  DEFAULT ((0)) FOR [EnableDisablePB]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Conveyors__PLCId__208CD6FA]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Conveyors] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Conveyors__Direc__2180FB33]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Conveyors] ADD  DEFAULT ((0)) FOR [Direction]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__GlobalChe__IsUnf__22751F6C]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[GlobalCheckinModificationConfig] ADD  DEFAULT ((0)) FOR [IsUnfrozen]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__GlobalChe__IsBac__236943A5]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[GlobalCheckinModificationConfig] ADD  DEFAULT ((0)) FOR [IsBackdateCheckinsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__GlobalChe__IsFre__245D67DE]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[GlobalCheckinModificationConfig] ADD  DEFAULT ((0)) FOR [IsFreezeCheckinsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ItemProce__Check__25518C17]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ItemProcesses] ADD  DEFAULT ((0)) FOR [CheckItemIn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ItemProce__Repro__2645B050]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ItemProcesses] ADD  DEFAULT ((0)) FOR [ReprocessLimit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ItemProce__ILSTi__2739D489]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ItemProcesses] ADD  DEFAULT ((0)) FOR [ILSTimeout]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ItemProce__ItemP__282DF8C2]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ItemProcesses] ADD  DEFAULT ((0)) FOR [ItemProcessTimeout]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ItemProce__IsEna__29221CFB]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ItemProcesses] ADD  DEFAULT ((0)) FOR [IsEnabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__RadioInit__Reade__2A164134]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[RadioInitParams] ADD  DEFAULT ((0)) FOR [ReaderDeviceId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__Pos1Fil__2B0A656D]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [Pos1Filter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__Pos2Fil__2BFE89A6]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [Pos2Filter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__Pos3Fil__2CF2ADDF]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [Pos3Filter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__PLCId__2DE6D218]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__PlusOve__2EDAF651]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [PlusOvertravelFilter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorters__MinusOv__2FCF1A8A]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorters] ADD  DEFAULT ((0)) FOR [MinusOvertravelFilter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__SortTypeI__30C33EC3]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [SortTypeId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__PLCId__31B762FC]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__IsSortPro__32AB8735]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [IsSortProcessesHolds]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__IsSortPro__339FAB6E]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [IsSortProcessesInTransits]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__IsProcess__3493CFA7]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [IsProcessesMultipleTags]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__Sorts__IsSortReq__3587F3E0]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[Sorts] ADD  DEFAULT ((0)) FOR [IsSortRequiresCheckedInItem]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[amh].[DF__ToteInduc__PLCId__367C1819]') AND type = 'D')
BEGIN
ALTER TABLE [amh].[ToteInductions] ADD  DEFAULT ((0)) FOR [PLCId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__IsRec__37703C52]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [IsReceiptPrinterUsed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__ILSUs__3864608B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [ILSUsesLogin]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__ILSPo__395884C4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [ILSPort]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__Email__3A4CA8FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [EmailServerPort]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__ILSPi__3B40CD36]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [ILSPingInterval]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__MainD__3C34F16F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [MainDiagramZoom]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__MainD__3D2915A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [MainDiagramXOffset]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__MainD__3E1D39E1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [MainDiagramYOffset]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AdminSett__Debug__3F115E1A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AdminSettings] ADD  DEFAULT ((0)) FOR [DebugLoggingEnabled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AlertDTOe__IsDis__40058253]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AlertDTOes] ADD  DEFAULT ((0)) FOR [IsDismissed]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Draggable__IsHid__40F9A68C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DraggableWidgets] ADD  DEFAULT ((0)) FOR [IsHidden]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Draggable__Widge__41EDCAC5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DraggableWidgets] ADD  DEFAULT ((0)) FOR [WidgetType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ISO28560O__ISOOb__42E1EEFE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ISO28560OIDItem] ADD  DEFAULT ((0)) FOR [ISOObjectId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ItemColum__SIPMe__43D61337]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemColumnConfigs] ADD  DEFAULT ((0)) FOR [SIPMessageFieldId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ItemLogs__Create__44CA3770]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemLogs] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Sessions__StartT__45BE5BA9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [StartTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPFieldS__SIPFi__46B27FE2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPFieldSortRules] ADD  DEFAULT ((0)) FOR [SIPFieldId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPFieldS__Condi__47A6A41B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPFieldSortRules] ADD  DEFAULT ('') FOR [ConditionTypeName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPFieldS__IsIte__489AC854]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPFieldSortRules] ADD  DEFAULT ((0)) FOR [IsItemProcessRule]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPMessag__SIPMa__498EEC8D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPMessageFields] ADD  DEFAULT ((0)) FOR [SIPMappingId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPMessag__IsReq__4A8310C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPMessageMessageFields] ADD  DEFAULT ((0)) FOR [IsRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SIPMessag__Field__4B7734FF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SIPMessageMessageFields] ADD  DEFAULT ((0)) FOR [FieldOrderNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SortSchem__IsAct__4C6B5938]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SortSchemes] ADD  DEFAULT ((0)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SortSchem__IsAct__4D5F7D71]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SortSchemeScheduleItems] ADD  DEFAULT ((0)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptCo__Recei__4E53A1AA]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptContents] ADD  DEFAULT ((0)) FOR [ReceiptContentType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptCo__TextA__4F47C5E3]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptContents] ADD  DEFAULT ((0)) FOR [TextAlignment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptCo__DateT__503BEA1C]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptContents] ADD  DEFAULT ((0)) FOR [DateTimeFutureDays]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptDe__Recei__51300E55]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptDesigns] ADD  DEFAULT ((0)) FOR [ReceiptWidth]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptDe__Recei__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptDesigns] ADD  DEFAULT ((0)) FOR [ReceiptHeight]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptSI__Manip__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptSIPFieldConfigs] ADD  DEFAULT ((0)) FOR [ManipulationType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rp].[DF__ReceiptSI__Endin__540C7B00]') AND type = 'D')
BEGIN
ALTER TABLE [rp].[ReceiptSIPFieldConfigs] ADD  DEFAULT ((0)) FOR [EndingType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BinInductions_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[BinInductions]'))
ALTER TABLE [amh].[BinInductions]  WITH CHECK ADD  CONSTRAINT [FK_amh.BinInductions_amh.Conveyors_NextConveyorId] FOREIGN KEY([NextConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BinInductions_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[BinInductions]'))
ALTER TABLE [amh].[BinInductions] CHECK CONSTRAINT [FK_amh.BinInductions_amh.Conveyors_NextConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BinInductions_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[BinInductions]'))
ALTER TABLE [amh].[BinInductions]  WITH CHECK ADD  CONSTRAINT [FK_amh.BinInductions_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BinInductions_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[BinInductions]'))
ALTER TABLE [amh].[BinInductions] CHECK CONSTRAINT [FK_amh.BinInductions_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops]  WITH CHECK ADD  CONSTRAINT [FK_amh.BookDrops_amh.Conveyors_NextConveyorId] FOREIGN KEY([NextConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops] CHECK CONSTRAINT [FK_amh.BookDrops_amh.Conveyors_NextConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_dbo.Sounds_SoundId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops]  WITH CHECK ADD  CONSTRAINT [FK_amh.BookDrops_dbo.Sounds_SoundId] FOREIGN KEY([SoundId])
REFERENCES [dbo].[Sounds] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_dbo.Sounds_SoundId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops] CHECK CONSTRAINT [FK_amh.BookDrops_dbo.Sounds_SoundId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops]  WITH CHECK ADD  CONSTRAINT [FK_amh.BookDrops_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.BookDrops_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[BookDrops]'))
ALTER TABLE [amh].[BookDrops] CHECK CONSTRAINT [FK_amh.BookDrops_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channel_ChannelModes_dbo.ChannelModes_ChannelModeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channel_ChannelModes]'))
ALTER TABLE [amh].[Channel_ChannelModes]  WITH CHECK ADD  CONSTRAINT [FK_hwc.Channel_ChannelModes_dbo.ChannelModes_ChannelModeId] FOREIGN KEY([ChannelModeId])
REFERENCES [dbo].[ChannelModes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channel_ChannelModes_dbo.ChannelModes_ChannelModeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channel_ChannelModes]'))
ALTER TABLE [amh].[Channel_ChannelModes] CHECK CONSTRAINT [FK_hwc.Channel_ChannelModes_dbo.ChannelModes_ChannelModeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channel_ChannelModes_hwc.Channels_ChannelId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channel_ChannelModes]'))
ALTER TABLE [amh].[Channel_ChannelModes]  WITH CHECK ADD  CONSTRAINT [FK_hwc.Channel_ChannelModes_hwc.Channels_ChannelId] FOREIGN KEY([ChannelId])
REFERENCES [amh].[Channels] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channel_ChannelModes_hwc.Channels_ChannelId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channel_ChannelModes]'))
ALTER TABLE [amh].[Channel_ChannelModes] CHECK CONSTRAINT [FK_hwc.Channel_ChannelModes_hwc.Channels_ChannelId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ChannelInitParams_amh.Channels_Id]') AND parent_object_id = OBJECT_ID(N'[amh].[ChannelInitParams]'))
ALTER TABLE [amh].[ChannelInitParams]  WITH CHECK ADD  CONSTRAINT [FK_amh.ChannelInitParams_amh.Channels_Id] FOREIGN KEY([Id])
REFERENCES [amh].[Channels] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ChannelInitParams_amh.Channels_Id]') AND parent_object_id = OBJECT_ID(N'[amh].[ChannelInitParams]'))
ALTER TABLE [amh].[ChannelInitParams] CHECK CONSTRAINT [FK_amh.ChannelInitParams_amh.Channels_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.ChannelItemInformationModules_ChannelItemInformationModuleId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_amh.Channels_amh.ChannelItemInformationModules_ChannelItemInformationModuleId] FOREIGN KEY([ChannelItemInformationModuleId])
REFERENCES [dbo].[DraggableWidgets] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.ChannelItemInformationModules_ChannelItemInformationModuleId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels] CHECK CONSTRAINT [FK_amh.Channels_amh.ChannelItemInformationModules_ChannelItemInformationModuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_amh.Channels_amh.Conveyors_ConveyorId] FOREIGN KEY([ConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels] CHECK CONSTRAINT [FK_amh.Channels_amh.Conveyors_ConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.ItemProcesses_ItemProcessId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_amh.Channels_amh.ItemProcesses_ItemProcessId] FOREIGN KEY([ItemProcessId])
REFERENCES [amh].[ItemProcesses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_amh.ItemProcesses_ItemProcessId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels] CHECK CONSTRAINT [FK_amh.Channels_amh.ItemProcesses_ItemProcessId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_amh.Channels_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Channels_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels] CHECK CONSTRAINT [FK_amh.Channels_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channels_hwc.ReaderDevices_ReaderDeviceId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_hwc.Channels_hwc.ReaderDevices_ReaderDeviceId] FOREIGN KEY([ReaderDeviceId])
REFERENCES [amh].[ReaderDevices] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_hwc.Channels_hwc.ReaderDevices_ReaderDeviceId]') AND parent_object_id = OBJECT_ID(N'[amh].[Channels]'))
ALTER TABLE [amh].[Channels] CHECK CONSTRAINT [FK_hwc.Channels_hwc.ReaderDevices_ReaderDeviceId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ChatWidgets_dbo.DragDropItems_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ChatWidgets]'))
ALTER TABLE [amh].[ChatWidgets]  WITH CHECK ADD  CONSTRAINT [FK_amh.ChatWidgets_dbo.DragDropItems_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ChatWidgets_dbo.DragDropItems_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ChatWidgets]'))
ALTER TABLE [amh].[ChatWidgets] CHECK CONSTRAINT [FK_amh.ChatWidgets_dbo.DragDropItems_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors]  WITH CHECK ADD  CONSTRAINT [FK_amh.Conveyors_amh.Conveyors_NextConveyorId] FOREIGN KEY([NextConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors] CHECK CONSTRAINT [FK_amh.Conveyors_amh.Conveyors_NextConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_amh.ConveyorTypes_ConveyorTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors]  WITH CHECK ADD  CONSTRAINT [FK_amh.Conveyors_amh.ConveyorTypes_ConveyorTypeId] FOREIGN KEY([ConveyorTypeId])
REFERENCES [amh].[ConveyorTypes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_amh.ConveyorTypes_ConveyorTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors] CHECK CONSTRAINT [FK_amh.Conveyors_amh.ConveyorTypes_ConveyorTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors]  WITH CHECK ADD  CONSTRAINT [FK_amh.Conveyors_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Conveyors_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Conveyors]'))
ALTER TABLE [amh].[Conveyors] CHECK CONSTRAINT [FK_amh.Conveyors_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_amh.ItemProcesses_ItemProcessId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemProcessActions_amh.ItemProcesses_ItemProcessId] FOREIGN KEY([ItemProcessId])
REFERENCES [amh].[ItemProcesses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_amh.ItemProcesses_ItemProcessId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions] CHECK CONSTRAINT [FK_amh.ItemProcessActions_amh.ItemProcesses_ItemProcessId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.SIPFieldSortRules_ItemProcessRuleId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemProcessActions_dbo.SIPFieldSortRules_ItemProcessRuleId] FOREIGN KEY([ItemProcessRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.SIPFieldSortRules_ItemProcessRuleId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions] CHECK CONSTRAINT [FK_amh.ItemProcessActions_dbo.SIPFieldSortRules_ItemProcessRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.SIPMessages_SIPMessageId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemProcessActions_dbo.SIPMessages_SIPMessageId] FOREIGN KEY([SIPMessageId])
REFERENCES [dbo].[SIPMessages] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.SIPMessages_SIPMessageId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions] CHECK CONSTRAINT [FK_amh.ItemProcessActions_dbo.SIPMessages_SIPMessageId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.Sounds_SoundId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemProcessActions_dbo.Sounds_SoundId] FOREIGN KEY([SoundId])
REFERENCES [dbo].[Sounds] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_dbo.Sounds_SoundId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions] CHECK CONSTRAINT [FK_amh.ItemProcessActions_dbo.Sounds_SoundId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_rp.ReceiptDesigns_ReceiptDesignId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemProcessActions_rp.ReceiptDesigns_ReceiptDesignId] FOREIGN KEY([ReceiptDesignId])
REFERENCES [rp].[ReceiptDesigns] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemProcessActions_rp.ReceiptDesigns_ReceiptDesignId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemProcessActions]'))
ALTER TABLE [amh].[ItemProcessActions] CHECK CONSTRAINT [FK_amh.ItemProcessActions_rp.ReceiptDesigns_ReceiptDesignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemTesterConfigs_amh.Channels_ChannelId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemTesterConfigs]'))
ALTER TABLE [amh].[ItemTesterConfigs]  WITH CHECK ADD  CONSTRAINT [FK_amh.ItemTesterConfigs_amh.Channels_ChannelId] FOREIGN KEY([ChannelId])
REFERENCES [amh].[Channels] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ItemTesterConfigs_amh.Channels_ChannelId]') AND parent_object_id = OBJECT_ID(N'[amh].[ItemTesterConfigs]'))
ALTER TABLE [amh].[ItemTesterConfigs] CHECK CONSTRAINT [FK_amh.ItemTesterConfigs_amh.Channels_ChannelId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.RadioInitParams_amh.ReaderDevices_Id]') AND parent_object_id = OBJECT_ID(N'[amh].[RadioInitParams]'))
ALTER TABLE [amh].[RadioInitParams]  WITH CHECK ADD  CONSTRAINT [FK_amh.RadioInitParams_amh.ReaderDevices_Id] FOREIGN KEY([RadioInitParamsId])
REFERENCES [amh].[ReaderDevices] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.RadioInitParams_amh.ReaderDevices_Id]') AND parent_object_id = OBJECT_ID(N'[amh].[RadioInitParams]'))
ALTER TABLE [amh].[RadioInitParams] CHECK CONSTRAINT [FK_amh.RadioInitParams_amh.ReaderDevices_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ReaderDevices_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ReaderDevices]'))
ALTER TABLE [amh].[ReaderDevices]  WITH CHECK ADD  CONSTRAINT [FK_amh.ReaderDevices_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ReaderDevices_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ReaderDevices]'))
ALTER TABLE [amh].[ReaderDevices] CHECK CONSTRAINT [FK_amh.ReaderDevices_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorters_amh.Conveyors_ConveyorId] FOREIGN KEY([ConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters] CHECK CONSTRAINT [FK_amh.Sorters_amh.Conveyors_ConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.SorterTypes_SorterTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorters_amh.SorterTypes_SorterTypeId] FOREIGN KEY([SorterTypeId])
REFERENCES [amh].[sorterTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.SorterTypes_SorterTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters] CHECK CONSTRAINT [FK_amh.Sorters_amh.SorterTypes_SorterTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Sorts_ExceptionSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorters_amh.Sorts_ExceptionSortId] FOREIGN KEY([ExceptionSortId])
REFERENCES [amh].[Sorts] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Sorts_ExceptionSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters] CHECK CONSTRAINT [FK_amh.Sorters_amh.Sorts_ExceptionSortId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Sorts_NextSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorters_amh.Sorts_NextSortId] FOREIGN KEY([NextSortId])
REFERENCES [amh].[Sorts] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_amh.Sorts_NextSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters] CHECK CONSTRAINT [FK_amh.Sorters_amh.Sorts_NextSortId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorters_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorters_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorters]'))
ALTER TABLE [amh].[Sorters] CHECK CONSTRAINT [FK_amh.Sorters_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_amh.Conveyors_ConveyorId] FOREIGN KEY([ConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Conveyors_ConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_amh.Conveyors_ConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_amh.Conveyors_NextConveyorId] FOREIGN KEY([NextConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_amh.Conveyors_NextConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Sorters_SorterId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_amh.Sorters_SorterId] FOREIGN KEY([SorterId])
REFERENCES [amh].[Sorters] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Sorters_SorterId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_amh.Sorters_SorterId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Sorts_NextSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_amh.Sorts_NextSortId] FOREIGN KEY([NextSortId])
REFERENCES [amh].[Sorts] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.Sorts_NextSortId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_amh.Sorts_NextSortId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.SortTypes_SortTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_amh.SortTypes_SortTypeId] FOREIGN KEY([SortTypeId])
REFERENCES [amh].[SortTypes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_amh.SortTypes_SortTypeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_amh.SortTypes_SortTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts]  WITH CHECK ADD  CONSTRAINT [FK_amh.Sorts_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.Sorts_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[Sorts]'))
ALTER TABLE [amh].[Sorts] CHECK CONSTRAINT [FK_amh.Sorts_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ToteInductions_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[ToteInductions]'))
ALTER TABLE [amh].[ToteInductions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ToteInductions_amh.Conveyors_NextConveyorId] FOREIGN KEY([NextConveyorId])
REFERENCES [amh].[Conveyors] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ToteInductions_amh.Conveyors_NextConveyorId]') AND parent_object_id = OBJECT_ID(N'[amh].[ToteInductions]'))
ALTER TABLE [amh].[ToteInductions] CHECK CONSTRAINT [FK_amh.ToteInductions_amh.Conveyors_NextConveyorId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ToteInductions_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ToteInductions]'))
ALTER TABLE [amh].[ToteInductions]  WITH CHECK ADD  CONSTRAINT [FK_amh.ToteInductions_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[amh].[FK_amh.ToteInductions_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[amh].[ToteInductions]'))
ALTER TABLE [amh].[ToteInductions] CHECK CONSTRAINT [FK_amh.ToteInductions_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_amh.ChannelItemInformationModules_dbo.DragDropItems_NodeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DraggableWidgets]'))
ALTER TABLE [dbo].[DraggableWidgets]  WITH CHECK ADD  CONSTRAINT [FK_amh.ChannelItemInformationModules_dbo.DragDropItems_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_amh.ChannelItemInformationModules_dbo.DragDropItems_NodeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[DraggableWidgets]'))
ALTER TABLE [dbo].[DraggableWidgets] CHECK CONSTRAINT [FK_amh.ChannelItemInformationModules_dbo.DragDropItems_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.EmailAddresses_dbo.AdminSettings_AdminSettingsId]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailAddresses]'))
ALTER TABLE [dbo].[EmailAddresses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmailAddresses_dbo.AdminSettings_AdminSettingsId] FOREIGN KEY([AdminSettingsId])
REFERENCES [dbo].[AdminSettings] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.EmailAddresses_dbo.AdminSettings_AdminSettingsId]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmailAddresses]'))
ALTER TABLE [dbo].[EmailAddresses] CHECK CONSTRAINT [FK_dbo.EmailAddresses_dbo.AdminSettings_AdminSettingsId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_CheckedStateSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_CheckedStateSelectionRuleId] FOREIGN KEY([CheckedStateSelectionRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_CheckedStateSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules] CHECK CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_CheckedStateSelectionRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_InTransitSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_InTransitSelectionRuleId] FOREIGN KEY([InTransitSelectionRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_InTransitSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules] CHECK CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_InTransitSelectionRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_OnHoldSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_OnHoldSelectionRuleId] FOREIGN KEY([OnHoldSelectionRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_OnHoldSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules] CHECK CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_OnHoldSelectionRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_TransitHoldSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_TransitHoldSelectionRuleId] FOREIGN KEY([TransitHoldSelectionRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_TransitHoldSelectionRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStateRules]'))
ALTER TABLE [dbo].[ItemStateRules] CHECK CONSTRAINT [FK_dbo.ItemStateRules_dbo.SIPFieldSortRules_TransitHoldSelectionRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStatusLogDTOes_dbo.ItemLogDTOes_ItemIdentifier]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStatusLogs]'))
ALTER TABLE [dbo].[ItemStatusLogs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStatusLogDTOes_dbo.ItemLogDTOes_ItemIdentifier] FOREIGN KEY([ItemIdentifier])
REFERENCES [dbo].[ItemLogs] ([ItemIdentifier])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStatusLogDTOes_dbo.ItemLogDTOes_ItemIdentifier]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStatusLogs]'))
ALTER TABLE [dbo].[ItemStatusLogs] CHECK CONSTRAINT [FK_dbo.ItemStatusLogDTOes_dbo.ItemLogDTOes_ItemIdentifier]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStatusLogDTOes_dbo.Sessions_SessionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStatusLogs]'))
ALTER TABLE [dbo].[ItemStatusLogs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemStatusLogDTOes_dbo.Sessions_SessionId] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ItemStatusLogDTOes_dbo.Sessions_SessionId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemStatusLogs]'))
ALTER TABLE [dbo].[ItemStatusLogs] CHECK CONSTRAINT [FK_dbo.ItemStatusLogDTOes_dbo.Sessions_SessionId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.PLCParameterInfoes_dbo.PLCCommandInfoes_PLCCommandInfo_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[PLCParameterInfoes]'))
ALTER TABLE [dbo].[PLCParameterInfoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PLCParameterInfoes_dbo.PLCCommandInfoes_PLCCommandInfo_Id] FOREIGN KEY([PLCCommandInfo_Id])
REFERENCES [dbo].[PLCCommandDatabaseInfoes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.PLCParameterInfoes_dbo.PLCCommandInfoes_PLCCommandInfo_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[PLCParameterInfoes]'))
ALTER TABLE [dbo].[PLCParameterInfoes] CHECK CONSTRAINT [FK_dbo.PLCParameterInfoes_dbo.PLCCommandInfoes_PLCCommandInfo_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.PLCParameterInfoes_dbo.PLCDataTypes_DataType_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[PLCParameterInfoes]'))
ALTER TABLE [dbo].[PLCParameterInfoes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PLCParameterInfoes_dbo.PLCDataTypes_DataType_Id] FOREIGN KEY([DataTypeId])
REFERENCES [dbo].[PLCDataTypes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.PLCParameterInfoes_dbo.PLCDataTypes_DataType_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[PLCParameterInfoes]'))
ALTER TABLE [dbo].[PLCParameterInfoes] CHECK CONSTRAINT [FK_dbo.PLCParameterInfoes_dbo.PLCDataTypes_DataType_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo._3MItemIdMemoryMapItem__3MTagDataMemoryMapId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo._3MItemIdMemoryMapItem__3MTagDataMemoryMapId] FOREIGN KEY([_3MTagDataMemoryMapId])
REFERENCES [dbo].[_3MItemIdMemoryMapItem] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo._3MItemIdMemoryMapItem__3MTagDataMemoryMapId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo._3MItemIdMemoryMapItem__3MTagDataMemoryMapId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo._3MTagDataField__3MTagDataFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo._3MTagDataField__3MTagDataFieldId] FOREIGN KEY([_3MTagDataFieldId])
REFERENCES [dbo].[_3MTagDataField] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo._3MTagDataField__3MTagDataFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo._3MTagDataField__3MTagDataFieldId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.ISO28560DataFormat_ISO28560DataFormatId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo.ISO28560DataFormat_ISO28560DataFormatId] FOREIGN KEY([ISO28560DataFormatId])
REFERENCES [dbo].[ISO28560DataFormat] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.ISO28560DataFormat_ISO28560DataFormatId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo.ISO28560DataFormat_ISO28560DataFormatId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.ISO28560OIDItem_ISO28560OIDItemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo.ISO28560OIDItem_ISO28560OIDItemId] FOREIGN KEY([ISO28560OIDItemId])
REFERENCES [dbo].[ISO28560OIDItem] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.ISO28560OIDItem_ISO28560OIDItemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo.ISO28560OIDItem_ISO28560OIDItemId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo.SIPMessageFields_SIPMessageFieldId] FOREIGN KEY([SIPMessageFieldId])
REFERENCES [dbo].[SIPMessageFields] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo.SIPMessageFields_SIPMessageFieldId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.TagModelDTOes_TagModelDTOId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProfileDTOes_dbo.TagModelDTOes_TagModelDTOId] FOREIGN KEY([TagModelDTOId])
REFERENCES [dbo].[TagModelDTOes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ProfileDTOes_dbo.TagModelDTOes_TagModelDTOId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfileDTOes]'))
ALTER TABLE [dbo].[ProfileDTOes] CHECK CONSTRAINT [FK_dbo.ProfileDTOes_dbo.TagModelDTOes_TagModelDTOId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRuleGroups_SIPFieldSortRuleGroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroup_SortRule]'))
ALTER TABLE [dbo].[SIPFieldSortRuleGroup_SortRule]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRuleGroups_SIPFieldSortRuleGroupId] FOREIGN KEY([SIPFieldSortRuleGroupId])
REFERENCES [dbo].[SIPFieldSortRuleGroups] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRuleGroups_SIPFieldSortRuleGroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroup_SortRule]'))
ALTER TABLE [dbo].[SIPFieldSortRuleGroup_SortRule] CHECK CONSTRAINT [FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRuleGroups_SIPFieldSortRuleGroupId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRules_SIPFieldSortRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroup_SortRule]'))
ALTER TABLE [dbo].[SIPFieldSortRuleGroup_SortRule]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRules_SIPFieldSortRuleId] FOREIGN KEY([SIPFieldSortRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRules_SIPFieldSortRuleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRuleGroup_SortRule]'))
ALTER TABLE [dbo].[SIPFieldSortRuleGroup_SortRule] CHECK CONSTRAINT [FK_dbo.SIPFieldSortRuleGroup_SortRule_dbo.SIPFieldSortRules_SIPFieldSortRuleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRules_dbo.SIPFieldSortRules_CombinedRule_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRules]'))
ALTER TABLE [dbo].[SIPFieldSortRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPFieldSortRules_dbo.SIPFieldSortRules_CombinedRule_Id] FOREIGN KEY([CombineRuleId])
REFERENCES [dbo].[SIPFieldSortRules] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRules_dbo.SIPFieldSortRules_CombinedRule_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRules]'))
ALTER TABLE [dbo].[SIPFieldSortRules] CHECK CONSTRAINT [FK_dbo.SIPFieldSortRules_dbo.SIPFieldSortRules_CombinedRule_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRules_dbo.SIPMessageFields_ParameterAID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRules]'))
ALTER TABLE [dbo].[SIPFieldSortRules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPFieldSortRules_dbo.SIPMessageFields_ParameterAID] FOREIGN KEY([SIPFieldId])
REFERENCES [dbo].[SIPMessageFields] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPFieldSortRules_dbo.SIPMessageFields_ParameterAID]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPFieldSortRules]'))
ALTER TABLE [dbo].[SIPFieldSortRules] CHECK CONSTRAINT [FK_dbo.SIPFieldSortRules_dbo.SIPMessageFields_ParameterAID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageFields_dbo.SIPFieldTypes_SIPFieldTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageFields]'))
ALTER TABLE [dbo].[SIPMessageFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPMessageFields_dbo.SIPFieldTypes_SIPFieldTypeId] FOREIGN KEY([SIPFieldTypeId])
REFERENCES [dbo].[SIPFieldTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageFields_dbo.SIPFieldTypes_SIPFieldTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageFields]'))
ALTER TABLE [dbo].[SIPMessageFields] CHECK CONSTRAINT [FK_dbo.SIPMessageFields_dbo.SIPFieldTypes_SIPFieldTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageFields_dbo.SIPMessageFieldFormats_FieldMessageFormatId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageFields]'))
ALTER TABLE [dbo].[SIPMessageFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPMessageFields_dbo.SIPMessageFieldFormats_FieldMessageFormatId] FOREIGN KEY([FieldMessageFormatId])
REFERENCES [dbo].[SIPMessageFieldFormats] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageFields_dbo.SIPMessageFieldFormats_FieldMessageFormatId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageFields]'))
ALTER TABLE [dbo].[SIPMessageFields] CHECK CONSTRAINT [FK_dbo.SIPMessageFields_dbo.SIPMessageFieldFormats_FieldMessageFormatId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageMessageFields_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageMessageFields]'))
ALTER TABLE [dbo].[SIPMessageMessageFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPMessageMessageFields_dbo.SIPMessageFields_SIPMessageFieldId] FOREIGN KEY([SIPMessageFieldId])
REFERENCES [dbo].[SIPMessageFields] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageMessageFields_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageMessageFields]'))
ALTER TABLE [dbo].[SIPMessageMessageFields] CHECK CONSTRAINT [FK_dbo.SIPMessageMessageFields_dbo.SIPMessageFields_SIPMessageFieldId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageMessageFields_dbo.SIPMessages_SIPMessage_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageMessageFields]'))
ALTER TABLE [dbo].[SIPMessageMessageFields]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SIPMessageMessageFields_dbo.SIPMessages_SIPMessage_Id] FOREIGN KEY([SIPMessageId])
REFERENCES [dbo].[SIPMessages] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SIPMessageMessageFields_dbo.SIPMessages_SIPMessage_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIPMessageMessageFields]'))
ALTER TABLE [dbo].[SIPMessageMessageFields] CHECK CONSTRAINT [FK_dbo.SIPMessageMessageFields_dbo.SIPMessages_SIPMessage_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SIPFieldSortRuleGroups_SortRuleGroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortScheme_RuleGroup_SortZone]'))
ALTER TABLE [dbo].[SortScheme_RuleGroup_SortZone]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SIPFieldSortRuleGroups_SortRuleGroupId] FOREIGN KEY([SortRuleGroupId])
REFERENCES [dbo].[SIPFieldSortRuleGroups] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SIPFieldSortRuleGroups_SortRuleGroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortScheme_RuleGroup_SortZone]'))
ALTER TABLE [dbo].[SortScheme_RuleGroup_SortZone] CHECK CONSTRAINT [FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SIPFieldSortRuleGroups_SortRuleGroupId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SortSchemes_SortSchemeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortScheme_RuleGroup_SortZone]'))
ALTER TABLE [dbo].[SortScheme_RuleGroup_SortZone]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SortSchemes_SortSchemeId] FOREIGN KEY([SortSchemeId])
REFERENCES [dbo].[SortSchemes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SortSchemes_SortSchemeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortScheme_RuleGroup_SortZone]'))
ALTER TABLE [dbo].[SortScheme_RuleGroup_SortZone] CHECK CONSTRAINT [FK_dbo.SortScheme_RuleGroup_SortZone_dbo.SortSchemes_SortSchemeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortSchemeScheduleItems_dbo.SortSchemes_SortSchemeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleItems]'))
ALTER TABLE [dbo].[SortSchemeScheduleItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SortSchemeScheduleItems_dbo.SortSchemes_SortSchemeId] FOREIGN KEY([SortSchemeId])
REFERENCES [dbo].[SortSchemes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortSchemeScheduleItems_dbo.SortSchemes_SortSchemeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleItems]'))
ALTER TABLE [dbo].[SortSchemeScheduleItems] CHECK CONSTRAINT [FK_dbo.SortSchemeScheduleItems_dbo.SortSchemes_SortSchemeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortSchemeScheduleItems_dbo.SortSchemeScheduleIntervalTypes_IntervalTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleItems]'))
ALTER TABLE [dbo].[SortSchemeScheduleItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SortSchemeScheduleItems_dbo.SortSchemeScheduleIntervalTypes_IntervalTypeId] FOREIGN KEY([IntervalTypeId])
REFERENCES [dbo].[SortSchemeScheduleIntervalTypes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.SortSchemeScheduleItems_dbo.SortSchemeScheduleIntervalTypes_IntervalTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[SortSchemeScheduleItems]'))
ALTER TABLE [dbo].[SortSchemeScheduleItems] CHECK CONSTRAINT [FK_dbo.SortSchemeScheduleItems_dbo.SortSchemeScheduleIntervalTypes_IntervalTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TagModelDTOes_dbo._3MItemIdMemoryMapItem__3MItemIdMemoryMapItemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagModelDTOes]'))
ALTER TABLE [dbo].[TagModelDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TagModelDTOes_dbo._3MItemIdMemoryMapItem__3MItemIdMemoryMapItemId] FOREIGN KEY([_3MItemIdMemoryMapItemId])
REFERENCES [dbo].[_3MItemIdMemoryMapItem] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TagModelDTOes_dbo._3MItemIdMemoryMapItem__3MItemIdMemoryMapItemId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagModelDTOes]'))
ALTER TABLE [dbo].[TagModelDTOes] CHECK CONSTRAINT [FK_dbo.TagModelDTOes_dbo._3MItemIdMemoryMapItem__3MItemIdMemoryMapItemId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TagModelDTOes_dbo._3MItemType__3MItemTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagModelDTOes]'))
ALTER TABLE [dbo].[TagModelDTOes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TagModelDTOes_dbo._3MItemType__3MItemTypeId] FOREIGN KEY([_3MItemTypeId])
REFERENCES [dbo].[_3MItemType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.TagModelDTOes_dbo._3MItemType__3MItemTypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[TagModelDTOes]'))
ALTER TABLE [dbo].[TagModelDTOes] CHECK CONSTRAINT [FK_dbo.TagModelDTOes_dbo._3MItemType__3MItemTypeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_rp.ReceiptConfigs_ReceiptConfigId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents]  WITH CHECK ADD  CONSTRAINT [FK_rp.ReceiptDatas_rp.ReceiptConfigs_ReceiptConfigId] FOREIGN KEY([ReceiptConfigId])
REFERENCES [rp].[ReceiptDesigns] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_rp.ReceiptConfigs_ReceiptConfigId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents] CHECK CONSTRAINT [FK_rp.ReceiptDatas_rp.ReceiptConfigs_ReceiptConfigId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents]  WITH CHECK ADD  CONSTRAINT [FK_rp.ReceiptDatas_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigId] FOREIGN KEY([ReceiptSIPFieldConfigId])
REFERENCES [rp].[ReceiptSIPFieldConfigs] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents] CHECK CONSTRAINT [FK_rp.ReceiptDatas_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents]  WITH CHECK ADD  CONSTRAINT [FK_rp.ReceiptDatas_sf.Nodes_NodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[DragDropItems] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptDatas_sf.Nodes_NodeId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptContents]'))
ALTER TABLE [rp].[ReceiptContents] CHECK CONSTRAINT [FK_rp.ReceiptDatas_sf.Nodes_NodeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptSIPFieldConfigs_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptSIPFieldConfigs]'))
ALTER TABLE [rp].[ReceiptSIPFieldConfigs]  WITH CHECK ADD  CONSTRAINT [FK_rp.ReceiptSIPFieldConfigs_dbo.SIPMessageFields_SIPMessageFieldId] FOREIGN KEY([SIPMessageFieldId])
REFERENCES [dbo].[SIPMessageFields] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptSIPFieldConfigs_dbo.SIPMessageFields_SIPMessageFieldId]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptSIPFieldConfigs]'))
ALTER TABLE [rp].[ReceiptSIPFieldConfigs] CHECK CONSTRAINT [FK_rp.ReceiptSIPFieldConfigs_dbo.SIPMessageFields_SIPMessageFieldId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptSIPSwapTexts_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigDTO_Id]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptSIPSwapTexts]'))
ALTER TABLE [rp].[ReceiptSIPSwapTexts]  WITH CHECK ADD  CONSTRAINT [FK_rp.ReceiptSIPSwapTexts_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigDTO_Id] FOREIGN KEY([ReceiptSIPFieldConfigDTO_Id])
REFERENCES [rp].[ReceiptSIPFieldConfigs] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[rp].[FK_rp.ReceiptSIPSwapTexts_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigDTO_Id]') AND parent_object_id = OBJECT_ID(N'[rp].[ReceiptSIPSwapTexts]'))
ALTER TABLE [rp].[ReceiptSIPSwapTexts] CHECK CONSTRAINT [FK_rp.ReceiptSIPSwapTexts_rp.ReceiptSIPFieldConfigs_ReceiptSIPFieldConfigDTO_Id]
GO
/****** Object:  StoredProcedure [dbo].[BackupEZSortDatabase]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BackupEZSortDatabase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BackupEZSortDatabase] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[BackupEZSortDatabase]
	-- Add the parameters for the stored procedure here
	@backupPath VARCHAR(MAX),
	@backupName VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @fileName VARCHAR(256);

	SET @fileName = @backupPath + '\' + @backupName + '.bak'

   BACKUP DATABASE EZSort
   TO DISK = @fileName;

END


GO
/****** Object:  StoredProcedure [dbo].[CleanLogs]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CleanLogs] AS' 
END
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CleanLogs]
	-- Add the parameters for the stored procedure here
	@days INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
	FROM nlog.GeneralLogs
	WHERE [DateTime] <= DATEADD(hh, -(@days * 24), GETDATE())

	SELECT @@ROWCOUNT AS DELETED;

END
GO
/****** Object:  StoredProcedure [dbo].[GetDaysLogsWithSearchTerm]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDaysLogsWithSearchTerm]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetDaysLogsWithSearchTerm] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetDaysLogsWithSearchTerm]
	-- Add the parameters for the stored procedure here
	@searchTerm varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM nlog.GeneralLogs
		WHERE [Message] LIKE('%'+@searchTerm+'%')
		AND [Level] <> 'Debug'
		AND [DateTime] >= DATEADD(hh, -24, GETDATE())
		ORDER BY [DateTime] DESC
END


/****** Object:  StoredProcedure [dbo].[GetWeeksLogsWithSearchTerm]    Script Date: 10/10/2017 9:42:00 AM ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[GetLogsStartingFromDate]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLogsStartingFromDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetLogsStartingFromDate] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetLogsStartingFromDate]
	@date AS DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 10000 * FROM nlog.GeneralLogs
	WHERE [DateTime] < @date
	ORDER BY [DateTime] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogsWithinWindow]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLogsWithinWindow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetLogsWithinWindow] AS' 
END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetLogsWithinWindow]
	-- Add the parameters for the stored procedure here
	@startId INT,
	@startIndex INT,
	@endIndex INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM nlog.GeneralLogs
	WHERE Id BETWEEN (@startId - @endIndex) AND (@startId - @startIndex)
	ORDER BY DATETIME DESC

END


GO
/****** Object:  StoredProcedure [dbo].[GetWeeksLogsWithSearchTerm]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetWeeksLogsWithSearchTerm]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetWeeksLogsWithSearchTerm] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetWeeksLogsWithSearchTerm]
	-- Add the parameters for the stored procedure here
	@searchTerm varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM nlog.GeneralLogs
		WHERE [Message] LIKE('%'+@searchTerm+'%')
		AND [Level] <> 'Debug'
		 AND [DateTime] >= DATEADD(hh, -168, GETDATE())
		 ORDER BY [DateTime] DESC
END


GO
/****** Object:  StoredProcedure [dbo].[PurgeAllItemDataOlderThanTwoWeeks]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurgeAllItemDataOlderThanTwoWeeks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PurgeAllItemDataOlderThanTwoWeeks] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PurgeAllItemDataOlderThanTwoWeeks]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @date AS DATETIME

	SET @date = DATEADD(hh, -(24 * 4), GETDATE());

	--DELETE ITEM SIP LOGS
	DELETE FROM dbo.ItemSIPLogs
		WHERE ItemIdentifier IN (SELECT ItemIdentifier FROM dbo.ItemStatusLogs
			WHERE CreateDate <= @date)
		AND VersionNumber IN (SELECT VersionNumber FROM dbo.ItemStatusLogs
			WHERE CreateDate <= @date)

	--DELETE ITEM STATUS LOGS
	DELETE FROM dbo.ItemStatusLogs
		WHERE CreateDate <= @date;

	SELECT @@ROWCOUNT AS DELETED;
END

GO
/****** Object:  StoredProcedure [dbo].[RestoreEZSortDatabase]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RestoreEZSortDatabase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[RestoreEZSortDatabase] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[RestoreEZSortDatabase] 
	-- Add the parameters for the stored procedure here
	@path VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- grant proper permissions
	--EXEC sp_addsrvrolemember 'EZSortApp', 'db_backupoperator'

	-- Close all connections and rollback all transaction
	ALTER DATABASE EZSort SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

	--restore db
	RESTORE DATABASE EZSort  
		FROM DISK = @path;  

	--have to run this because sql is dumb
	ALTER USER EZSortApp WITH LOGIN = EZSortApp;

	ALTER DATABASE EZSort SET MULTI_USER;

END


GO
/****** Object:  StoredProcedure [dbo].[TrimItemStatusLogsOlderThanOneWeek]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrimItemStatusLogsOlderThanOneWeek]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TrimItemStatusLogsOlderThanOneWeek] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TrimItemStatusLogsOlderThanOneWeek]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--ALTER TABLE dbo.ItemSIPLogs
    --DROP CONSTRAINT  [FK_dbo.ItemSIPLogs_dbo.ItemStatusLogs_ItemIdentifier_VersionNumber_SessionId]

   
    DECLARE @weekAgo AS DATETIME
	SET @weekAgo = DATEADD(hh, -(24 * 1), GETDATE());

	DECLARE @twoWeeksAgo AS DATETIME
	SET @twoWeeksAgo = DATEADD(hh, -(24 * 4), GETDATE());

	
	--IF THE LATEST VERSION OF AN ItemStatusLog IS OLDER THAN 1 WEEK,
	--KEEP ONLY THE LATEST VERSION
	DECLARE @MyCursor CURSOR;
	DECLARE @Version INT;
	DECLARE @Id VARCHAR(50);
	DECLARE @Count INT;

	SET @Count = 0;

	BEGIN
		SET @MyCursor = CURSOR FOR

		--GRAB THE LATEST VERSION FOR AN ITEM FALLING BETWEEN 1 WEEK AND 1 MONTH AGO
		SELECT MAX(VersionNumber), ItemIdentifier FROM dbo.ItemStatusLogs
			WHERE CreateDate < @weekAgo
			AND CreateDate > @twoWeeksAgo
			GROUP BY ItemIdentifier

		OPEN @MyCursor 
		FETCH NEXT FROM @MyCursor 
		INTO @Version, @Id

		--LOOP THROUGH RESULT OF SELECT STATEMENT
		WHILE @@FETCH_STATUS = 0
		BEGIN
		  
		  --IF VERSION FOUND IS THE MAXIMUM LATEST VERSION OF THE ITEM, 
		  --DELETE ALL OTHER VERSIONS FOR ITEM

		  DECLARE @LatestVersion INT;

		  SET @LatestVersion = (
			SELECT MAX(VersionNumber) 
			FROM dbo.ItemStatusLogs
			WHERE ItemIdentifier = @Id
			)

		  PRINT 'ID:'
		  PRINT @Id
		  PRINT 'RELATIVE LATEST VERSION:'
		  PRINT @Version
		  PRINT 'ABSOLUTE LATEST VERSION:'
		  PRINT @LatestVersion

		  IF @LatestVersion = @Version
			  BEGIN
				DELETE FROM dbo.ItemSIPLogs
					WHERE ItemIdentifier = @Id
					AND VersionNumber < @LatestVersion
				DELETE FROM dbo.ItemStatusLogs
					WHERE ItemIdentifier = @Id
					AND VersionNumber < @LatestVersion
			  END

		  SET @Count = @Count +1;

		  FETCH NEXT FROM @MyCursor 
		  INTO @Version, @Id
		END; 

		CLOSE @MyCursor ;
		DEALLOCATE @MyCursor;

		SELECT @Count;
	END;

	--ALTER TABLE [dbo].[ItemSIPLogs]  WITH CHECK 
	--	ADD CONSTRAINT [FK_dbo.ItemSIPLogs_dbo.ItemStatusLogs_ItemIdentifier_VersionNumber_SessionId] 
	--	FOREIGN KEY([ItemIdentifier], [VersionNumber], [SessionId])
	--	REFERENCES [dbo].[ItemStatusLogs] ([ItemIdentifier], [VersionNumber], [SessionId])
	--	ON DELETE CASCADE

	--ALTER TABLE [dbo].[ItemSIPLogs] CHECK CONSTRAINT [FK_dbo.ItemSIPLogs_dbo.ItemStatusLogs_ItemIdentifier_VersionNumber_SessionId]

END

GO
/****** Object:  StoredProcedure [dbo].[TruncateLdfFile]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TruncateLdfFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TruncateLdfFile] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TruncateLdfFile]
AS
BEGIN
    -- Insert statements for procedure here
	DBCC SHRINKFILE ('EZSort_log', 5000);  

END
GO
/****** Object:  StoredProcedure [dbo].[TruncateMdfFile]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TruncateMdfFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TruncateMdfFile] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TruncateMdfFile]
AS
BEGIN

	DBCC SHRINKFILE ('EZSort', 5000);  
	  
END
GO
/****** Object:  StoredProcedure [nlog].[GeneralLogs_AddEntry_p]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[nlog].[GeneralLogs_AddEntry_p]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [nlog].[GeneralLogs_AddEntry_p] AS' 
END
GO


ALTER PROCEDURE [nlog].[GeneralLogs_AddEntry_p] 
	@message NVARCHAR(MAX),
	@level NVARCHAR(MAX),
	@datetime DATETIME,
	@stacktrace NVARCHAR(MAX),
	@userId NVARCHAR(MAX),
	@innerException NVARCHAR(MAX)
AS
BEGIN

	SET NOCOUNT ON;

    INSERT INTO nlog.GeneralLogs
	(
		[Message],
		[Level],
		[DateTime],
		[StackTrace],
		[UserId],
		[InnerException]
	)
	VALUES
	(
		@message,
		@level,
		@datetime,
		@stacktrace,
		@userId,
		@innerException
	);

END





GO
/****** Object:  StoredProcedure [nlog].[GetAllGeneralLogs]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[nlog].[GetAllGeneralLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [nlog].[GetAllGeneralLogs] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [nlog].[GetAllGeneralLogs]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM nlog.GeneralLogs ORDER BY [DateTime] DESC
END


GO
/****** Object:  StoredProcedure [nlog].[GetAllGeneralLogsFromDay]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[nlog].[GetAllGeneralLogsFromDay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [nlog].[GetAllGeneralLogsFromDay] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [nlog].[GetAllGeneralLogsFromDay]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM nlog.GeneralLogs
	 WHERE [DateTime] >= DATEADD(hh, -24, GETDATE())
		AND [Level] <> 'Debug'
	 ORDER BY [DateTime] DESC
END



GO
/****** Object:  StoredProcedure [nlog].[GetAllGeneralLogsFromWeek]    Script Date: 9/5/2018 2:57:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[nlog].[GetAllGeneralLogsFromWeek]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [nlog].[GetAllGeneralLogsFromWeek] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [nlog].[GetAllGeneralLogsFromWeek]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM nlog.GeneralLogs
	 WHERE [DateTime] >= DATEADD(hh, -168, GETDATE())
		AND [Level] <> 'Debug'
	 ORDER BY [DateTime] DESC
END



GO
