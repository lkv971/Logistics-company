CREATE DATABASE LogisticsDB
;
GO

USE LogisticsDB
;
GO

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
City VARCHAR(50), 
State CHAR(2), 
Latitude FLOAT, 
Longitude FLOAT
)
;
GO

CREATE TABLE Vehicles (
TruckID INT PRIMARY KEY,
Plate VARCHAR(20),
Brand CHAR(2),
TruckType VARCHAR(20),
TrailersType VARCHAR(10),
Year INT
)
;
GO

CREATE TABLE Drivers (
DriverID INT PRIMARY KEY, 
Driver VARCHAR(50)
)
;
GO

CREATE TABLE Costs (
Date DATE,
TruckID INT,
DriverID INT,
KmTravelled INT,
LitersConsumption DECIMAL(10,2),
FuelCost FLOAT,
MaintenanceCost DECIMAL(10,2),
FixedCost DECIMAL(10,2)
)
;
GO

CREATE TABLE Freight (
Date DATE,
CustomerID INT,
TruckID INT,
InvoiceNumber INT,
FreightID VARCHAR(50),
City VARCHAR(50),
Revenue DECIMAL(10,2),
WeightKg DECIMAL(10,2),
WeightCubic DECIMAL(10,2),
GoodsValue DECIMAL(10,2)
)
;
GO

DECLARE @StartDate DATE = '2018-01-01'
;
DECLARE @EndDate DATE = '2050-12-31'
;

CREATE TABLE Date (
Date DATE PRIMARY KEY,
Year INT, 
Month INT, 
Day INT, 
DayName VARCHAR(20), 
MonthName VARCHAR(20), 
Quarter INT
)
;

WHILE @StartDate <= @EndDate
BEGIN
	INSERT INTO Date (
	Date,
	Year, 
	Month,
	Day,
	DayName,
	MonthName,
	Quarter
	)
	VALUES (
	@StartDate,
	YEAR(@StartDate),
	MONTH(@StartDate),
	DAY(@StartDate),
	DATENAME(WEEKDAY, @StartDate),
	DATENAME(MONTH, @StartDate),
	DATEPART(QUARTER, @StartDate)
	)
	;
	SET @StartDate = DATEADD(DAY, 1, @StartDate)
	;
END

CREATE TABLE CostsAudit (
CostAuditID INT IDENTITY(1,1) PRIMARY KEY,
TruckID INT,
DriverID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldDate DATE,
NewDate DATE,
OldKmTravelled INT,
NewKmTravelled INT,
OldLitersConsumption DECIMAL(10,2),
NewLitersConsumption DECIMAL(10,2),
OldFuelCost FLOAT,
NewFuelCost FLOAT,
OldMaintenanceCost DECIMAL(10,2),
NewMaintenanceCost DECIMAL(10,2),
OldFixedCost DECIMAL(10,2),
NewFixedCost DECIMAL(10,2)
)
;
GO

CREATE TABLE FreightAudit (
FreightAuditID INT IDENTITY(1,1) PRIMARY KEY,
CustomerID INT,
TruckID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldDate DATE,
NewDate DATE,
OldInvoiceNumber INT,
NewInvoiceNumber INT,
OldFreightID VARCHAR(50),
NewFreightID VARCHAR(50),
OldCity VARCHAR(50),
NewCity VARCHAR(50),
OldRevenue DECIMAL(10,2),
NewRevenue DECIMAL(10,2),
OldWeightKg DECIMAL(10,2),
NewWeightKg DECIMAL(10,2),
OldWeightCubic DECIMAL(10,2),
NewWeightCubic DECIMAL(10,2),
OldGoodsValue DECIMAL(10,2),
NewGoodsValue DECIMAL(10,2)
)
;
GO

CREATE TABLE CustomerAudit (
CustomerAuditID INT PRIMARY KEY,
CustomerID INT,
ChangeType VARCHAR(50),
ChangeDate DATETIME,
OldCity VARCHAR(50),
NewCity VARCHAR(50),
OldState CHAR(2),
NewState CHAR(2),
State CHAR(2),
OldLatitude FLOAT,
NewLatitude FLOAT,
OldLongitude FLOAT,
NewLongitude FLOAT
)
;
GO

CREATE TABLE VehicleAudit (
TruckAuditID INT PRIMARY KEY,
TruckID INT,
ChangeType VARCHAR(50),
ChangeDate DATETIME,
OldPlate VARCHAR(20),
NewPlate VARCHAR(20),
OldBrand CHAR(2),
NewBrand CHAR(2),
OldTruckType VARCHAR(20),
NewTruckType VARCHAR(20),
OldTrailersType VARCHAR(10),
NewTrailersType VARCHAR(10),
OldYear INT,
NewYear INT
)
;
GO

CREATE TABLE DriverAudit (
DriverAuditID INT PRIMARY KEY,
DriverID INT,
ChangeType VARCHAR(50),
ChangeDate DATETIME,
OldDriver VARCHAR(50),
NewDriver VARCHAR(50)
)
;
GO

CREATE TABLE Targets (
TargetID INT IDENTITY(1,1) PRIMARY KEY,
TruckType VARCHAR(30),
Target INT
)
;
GO





