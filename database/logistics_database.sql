USE [master]
GO
/****** Object:  Database [LogisticsDB]    Script Date: 8/3/2024 9:25:51 PM ******/
CREATE DATABASE [LogisticsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogisticsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LogisticsDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LogisticsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LogisticsDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LogisticsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogisticsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogisticsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogisticsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogisticsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogisticsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogisticsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogisticsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogisticsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogisticsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogisticsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogisticsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogisticsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogisticsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogisticsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogisticsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogisticsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LogisticsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogisticsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogisticsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogisticsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogisticsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogisticsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogisticsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogisticsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LogisticsDB] SET  MULTI_USER 
GO
ALTER DATABASE [LogisticsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogisticsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogisticsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogisticsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LogisticsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LogisticsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LogisticsDB', N'ON'
GO
ALTER DATABASE [LogisticsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LogisticsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LogisticsDB]
GO
/****** Object:  User [leeroy]    Script Date: 8/3/2024 9:25:51 PM ******/
CREATE USER [leeroy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[TruckID] [int] NOT NULL,
	[Plate] [varchar](20) NULL,
	[Brand] [char](2) NULL,
	[TruckType] [varchar](20) NULL,
	[TrailersType] [varchar](10) NULL,
	[Year] [int] NULL,
	[TargetID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costs]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costs](
	[Date] [date] NULL,
	[TruckID] [int] NULL,
	[DriverID] [int] NULL,
	[KmTravelled] [int] NULL,
	[LitersConsumption] [decimal](10, 2) NULL,
	[FuelCost] [float] NULL,
	[MaintenanceCost] [decimal](10, 2) NULL,
	[FixedCost] [decimal](10, 2) NULL,
	[TotalCost] [decimal](10, 2) NULL,
	[LitersPer100Km] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TripDataPerVehicle2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerVehicle2018]
AS
SELECT v.Plate AS Vehicle,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID 
WHERE YEAR(c.Date) =2018
GROUP BY v.Plate
;
GO
/****** Object:  View [dbo].[TripDataPerVehicle2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerVehicle2019]
AS
SELECT v.Plate AS Vehicle,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID 
WHERE YEAR(c.Date) =2019
GROUP BY v.Plate
;
GO
/****** Object:  View [dbo].[TripDataPerTruckType2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerTruckType2018]
AS
SELECT v.TruckType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) =2018
GROUP BY v.TruckType
;
GO
/****** Object:  View [dbo].[TripDataPerTruckType2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerTruckType2019]
AS
SELECT v.TruckType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) = 2019
GROUP BY v.TruckType
;
GO
/****** Object:  View [dbo].[TripDataPerTrailersType2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerTrailersType2018]
AS
SELECT v.TrailersType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) = 2018
GROUP BY v.TrailersType
;
GO
/****** Object:  View [dbo].[TripDataPerTrailersType2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerTrailersType2019]
AS
SELECT v.TrailersType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) = 2019
GROUP BY v.TrailersType
;
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverID] [int] NOT NULL,
	[Driver] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TripDataPerDriver2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerDriver2018]
AS
SELECT d.Driver,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c ON v.TruckID = c.TruckID
INNER JOIN Drivers d ON d.DriverID = c.DriverID
WHERE d.DriverID != 1
AND YEAR(c.Date) = 2018
GROUP BY d.Driver
;
GO
/****** Object:  View [dbo].[TripDataPerDriver2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TripDataPerDriver2019]
AS
SELECT d.Driver,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c ON v.TruckID = c.TruckID
INNER JOIN Drivers d ON d.DriverID = c.DriverID
WHERE d.DriverID != 1
AND YEAR(c.Date) = 2019
GROUP BY d.Driver
;
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Freight]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freight](
	[Date] [date] NULL,
	[CustomerID] [int] NULL,
	[TruckID] [int] NULL,
	[InvoiceNumber] [int] NULL,
	[FreightID] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Revenue] [decimal](10, 2) NULL,
	[WeightKg] [decimal](10, 2) NULL,
	[WeightCubic] [decimal](10, 2) NULL,
	[GoodsValue] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustomerFreightDetailsPerState2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerFreightDetailsPerState2018]
AS
SELECT cu.State,
AVG(f.WeightKg) AS GoodsWeight,
AVG(f.GoodsValue) AS GoodsValue
FROM Customers cu
INNER JOIN Freight f
ON cu.CustomerID = f.CustomerID
WHERE YEAR(f.Date) = 2018
GROUP BY cu.State
;
GO
/****** Object:  View [dbo].[CustomerFreightDetailsPerState2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerFreightDetailsPerState2019]
AS
SELECT cu.State,
AVG(f.WeightKg) AS GoodsWeight,
AVG(f.GoodsValue) AS GoodsValue
FROM Customers cu
INNER JOIN Freight f
ON cu.CustomerID = f.CustomerID
WHERE YEAR(f.Date) = 2019
GROUP BY cu.State
;
GO
/****** Object:  View [dbo].[DriverCountPerTruckType]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DriverCountPerTruckType]
AS
SELECT v.TruckType,
COUNT(DISTINCT c.DriverID) AS DriverCount
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
GROUP BY v.TruckType
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetVehicleMonthlyCost]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetVehicleMonthlyCost] (@VehicleID INT)
RETURNS TABLE
AS
RETURN
(
SELECT YEAR(Date) AS Year,
AVG(FuelCost) AS AverageFuelCost,
AVG(MaintenanceCost) AS AverageMaintenanceCost,
AVG(FixedCost) AS FixedCost
FROM Costs 
WHERE TruckID = @VehicleID
GROUP BY YEAR(Date)
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetFreightTransitDetails]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetFreightTransitDetails] (@InvoiceNumber INT)
RETURNS TABLE
AS
RETURN
(
SELECT f.Date,
f.City AS FreightDestination,
f.GoodsValue AS FreightValue,
f.WeightKg AS FreightWeight,
v.TrailersType AS FreightTransportType
FROM Freight f
INNER JOIN Vehicles v
ON f.TruckID = v.TruckID
WHERE f.InvoiceNumber = @InvoiceNumber
)
;
GO
/****** Object:  View [dbo].[VehicleFuelPerformance2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VehicleFuelPerformance2018]
AS 
SELECT v.Plate AS Vehicle,
AVG(c.LitersPer100Km) AS FuelConsumptionPer100Km,
CASE
	WHEN AVG(c.LitersPer100Km) < 25 THEN 'Excellent'
	WHEN AVG(c.LitersPer100Km) BETWEEN 25 AND 30 THEN 'Good'
	WHEN AVG(c.LitersPer100Km) > 30 THEN 'Below Average'
    ELSE 'Unknown'
END AS FuelEfficiency
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) = 2018
GROUP BY v.Plate
;
GO
/****** Object:  View [dbo].[VehicleFuelPerformance2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VehicleFuelPerformance2019]
AS 
SELECT v.Plate AS Vehicle,
AVG(c.LitersPer100Km) AS FuelConsumptionPer100Km,
CASE
	WHEN AVG(c.LitersPer100Km) < 25 THEN 'Excellent'
	WHEN AVG(c.LitersPer100Km) BETWEEN 25 AND 30 THEN 'Good'
	WHEN AVG(c.LitersPer100Km) > 30 THEN 'Below Average'
    ELSE 'Unknown'
END AS FuelEfficiency
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID
WHERE YEAR(c.Date) = 2019
GROUP BY v.Plate
;
GO
/****** Object:  View [dbo].[DriverFuelPerformance2018]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DriverFuelPerformance2018]
AS 
SELECT d.Driver,
AVG(c.LitersPer100Km) AS FuelConsumptionPer100Km,
CASE
	WHEN AVG(c.LitersPer100Km) < 25 THEN 'Efficient'
	WHEN AVG(c.LitersPer100Km) BETWEEN 25 AND 30 THEN 'Standard'
	WHEN AVG(c.LitersPer100Km) > 30 THEN 'Less Efficient'
    ELSE 'Unknown'
END AS Efficiency
FROM Drivers d
INNER JOIN Costs c
ON d.DriverID = c.DriverID
WHERE YEAR(c.Date) = 2018
GROUP BY d.Driver
;
GO
/****** Object:  View [dbo].[DriverFuelPerformance2019]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DriverFuelPerformance2019]
AS 
SELECT d.Driver,
AVG(c.LitersPer100Km) AS FuelConsumptionPer100Km,
CASE
	WHEN AVG(c.LitersPer100Km) < 25 THEN 'Efficient'
	WHEN AVG(c.LitersPer100Km) BETWEEN 25 AND 30 THEN 'Standard'
	WHEN AVG(c.LitersPer100Km) > 30 THEN 'Less Efficient'
    ELSE 'Unknown'
END AS Efficiency
FROM Drivers d
INNER JOIN Costs c
ON d.DriverID = c.DriverID
WHERE YEAR(c.Date) = 2019
GROUP BY d.Driver
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetDriverInfo]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetDriverInfo] (@DriverID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT * FROM Drivers
WHERE DriverID = @DriverID
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetVehicleInfo]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetVehicleInfo] (@VehicleID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT * FROM Vehicles 
WHERE TruckID = @VehicleID
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomerInfo]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCustomerInfo] (@CustomerID INT)
RETURNS TABLE
AS 
RETURN 
(
SELECT * FROM Customers
WHERE CustomerID = @CustomerID
)
;
GO
/****** Object:  Table [dbo].[CostsAudit]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostsAudit](
	[CostAuditID] [int] IDENTITY(1,1) NOT NULL,
	[TruckID] [int] NULL,
	[DriverID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[OldDate] [date] NULL,
	[NewDate] [date] NULL,
	[OldKmTravelled] [int] NULL,
	[NewKmTravelled] [int] NULL,
	[OldLitersConsumption] [decimal](10, 2) NULL,
	[NewLitersConsumption] [decimal](10, 2) NULL,
	[OldFuelCost] [float] NULL,
	[NewFuelCost] [float] NULL,
	[OldMaintenanceCost] [decimal](10, 2) NULL,
	[NewMaintenanceCost] [decimal](10, 2) NULL,
	[OldFixedCost] [decimal](10, 2) NULL,
	[NewFixedCost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CostAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAudit]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAudit](
	[CustomerAuditID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[ChangeType] [varchar](50) NULL,
	[ChangeDate] [datetime] NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldState] [char](2) NULL,
	[NewState] [char](2) NULL,
	[State] [char](2) NULL,
	[OldLatitude] [float] NULL,
	[NewLatitude] [float] NULL,
	[OldLongitude] [float] NULL,
	[NewLongitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[Date] [date] NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[DayName] [varchar](20) NULL,
	[MonthName] [varchar](20) NULL,
	[Quarter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverAudit]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverAudit](
	[DriverAuditID] [int] NOT NULL,
	[DriverID] [int] NULL,
	[ChangeType] [varchar](50) NULL,
	[ChangeDate] [datetime] NULL,
	[OldDriver] [varchar](50) NULL,
	[NewDriver] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightAudit]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightAudit](
	[FreightAuditID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[TruckID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[OldDate] [date] NULL,
	[NewDate] [date] NULL,
	[OldInvoiceNumber] [int] NULL,
	[NewInvoiceNumber] [int] NULL,
	[OldFreightID] [varchar](50) NULL,
	[NewFreightID] [varchar](50) NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldRevenue] [decimal](10, 2) NULL,
	[NewRevenue] [decimal](10, 2) NULL,
	[OldWeightKg] [decimal](10, 2) NULL,
	[NewWeightKg] [decimal](10, 2) NULL,
	[OldWeightCubic] [decimal](10, 2) NULL,
	[NewWeightCubic] [decimal](10, 2) NULL,
	[OldGoodsValue] [decimal](10, 2) NULL,
	[NewGoodsValue] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[FreightAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Targets]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Targets](
	[TargetID] [int] IDENTITY(1,1) NOT NULL,
	[TruckType] [varchar](30) NULL,
	[Target] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TargetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleAudit]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleAudit](
	[TruckAuditID] [int] NOT NULL,
	[TruckID] [int] NULL,
	[ChangeType] [varchar](50) NULL,
	[ChangeDate] [datetime] NULL,
	[OldPlate] [varchar](20) NULL,
	[NewPlate] [varchar](20) NULL,
	[OldBrand] [char](2) NULL,
	[NewBrand] [char](2) NULL,
	[OldTruckType] [varchar](20) NULL,
	[NewTruckType] [varchar](20) NULL,
	[OldTrailersType] [varchar](10) NULL,
	[NewTrailersType] [varchar](10) NULL,
	[OldYear] [int] NULL,
	[NewYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TruckAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_Costs_Date]    Script Date: 8/3/2024 9:25:52 PM ******/
CREATE NONCLUSTERED INDEX [idx_Costs_Date] ON [dbo].[Costs]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Freight_InvoiceNumber]    Script Date: 8/3/2024 9:25:52 PM ******/
CREATE NONCLUSTERED INDEX [idx_Freight_InvoiceNumber] ON [dbo].[Freight]
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [fk_Costs_Date] FOREIGN KEY([Date])
REFERENCES [dbo].[Date] ([Date])
GO
ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [fk_Costs_Date]
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [fk_Costs_Drivers] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([DriverID])
GO
ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [fk_Costs_Drivers]
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [fk_Costs_Vehicles] FOREIGN KEY([TruckID])
REFERENCES [dbo].[Vehicles] ([TruckID])
GO
ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [fk_Costs_Vehicles]
GO
ALTER TABLE [dbo].[Freight]  WITH CHECK ADD  CONSTRAINT [fk_Freight_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Freight] CHECK CONSTRAINT [fk_Freight_Customers]
GO
ALTER TABLE [dbo].[Freight]  WITH CHECK ADD  CONSTRAINT [fk_Freight_Date] FOREIGN KEY([Date])
REFERENCES [dbo].[Date] ([Date])
GO
ALTER TABLE [dbo].[Freight] CHECK CONSTRAINT [fk_Freight_Date]
GO
ALTER TABLE [dbo].[Freight]  WITH CHECK ADD  CONSTRAINT [fk_Freight_Vehicles] FOREIGN KEY([TruckID])
REFERENCES [dbo].[Vehicles] ([TruckID])
GO
ALTER TABLE [dbo].[Freight] CHECK CONSTRAINT [fk_Freight_Vehicles]
GO
/****** Object:  StoredProcedure [dbo].[InsertCosts]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCosts]
@Date DATE,
@TruckID INT,
@DriverID INT,
@KmTravelled INT,
@LitersConsumption DECIMAL(10,2),
@FuelCost FLOAT,
@MaintenanceCost DECIMAL(10,2),
@FixedCost DECIMAL(10,2)
AS 
BEGIN
INSERT INTO Costs (
Date,
TruckID,
DriverID,
KmTravelled,
LitersConsumption,
FuelCost,
MaintenanceCost,
FixedCost)
VALUES (
@Date,
@TruckID,
@DriverID,
@KmTravelled,
@LitersConsumption,
@FuelCost,
@MaintenanceCost,
@FixedCost
)
SELECT SCOPE_IDENTITY() AS NewCostInput
END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomers]
@City VARCHAR(30),
@State CHAR(2)
AS
BEGIN
INSERT INTO Customers (
City,
State
)
VALUES (
@City,
@State
)
SELECT SCOPE_IDENTITY() NewCustomer
END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertDrivers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDrivers]
@FullName VARCHAR(100)
AS
BEGIN
INSERT INTO Drivers (
Driver
)
VALUES (
@FullName
)
SELECT SCOPE_IDENTITY() NewDriver
END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertFreight]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertFreight]
@Date DATE,
@CustomerID INT,
@TruckID INT,
@InvoiceNumber INT,
@FreightID VARCHAR(50),
@City VARCHAR(50),
@Revenue DECIMAL(10,2),
@WeightKg DECIMAL(10,2),
@WeightCubic DECIMAL(10,2),
@GoodsValue DECIMAL(10,2)
AS 
BEGIN
INSERT INTO Freight (
Date,
CustomerID,
TruckID,
InvoiceNumber,
FreightID,
City,
Revenue,
WeightKg,
WeightCubic,
GoodsValue
)
VALUES (
@Date,
@CustomerID,
@TruckID,
@InvoiceNumber,
@FreightID,
@City,
@Revenue,
@WeightKg,
@WeightCubic,
@GoodsValue
)
SELECT SCOPE_IDENTITY() AS NewFreightInput
END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertTrucks]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTrucks]
@Plate VARCHAR(20),
@Brand CHAR(2),
@TruckType VARCHAR(20),
@TrailersType VARCHAR(20),
@Year INT
AS
BEGIN
INSERT INTO Vehicles (
Plate,
Brand,
TruckType,
TrailersType,
Year
)
VALUES (
@Plate,
@Brand,
@TruckType,
@TrailersType,
@Year
)
SELECT SCOPE_IDENTITY() NewVehicle
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveCustomers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveCustomers]
@CustomerID INT
AS
BEGIN
DELETE FROM Customers
WHERE CustomerID = @CustomerID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveDrivers]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveDrivers]
@DriverID INT
AS
BEGIN
DELETE FROM Drivers
WHERE DriverID = @DriverID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveTrucks]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveTrucks]
@TruckID INT
AS
BEGIN
DELETE FROM Vehicles
WHERE TruckID = @TruckID
END
;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTruckPlate]    Script Date: 8/3/2024 9:25:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTruckPlate]
@TruckID INT,
@Plate VARCHAR(15)
AS
BEGIN
UPDATE Vehicles
SET Plate = @Plate
WHERE TruckID = @TruckID
END
;
GO
USE [master]
GO
ALTER DATABASE [LogisticsDB] SET  READ_WRITE 
GO
