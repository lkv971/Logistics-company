USE LogisticsDB;
GO

CREATE PROCEDURE InsertCosts
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

CREATE PROCEDURE InsertFreight
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


CREATE PROCEDURE InsertTrucks
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

CREATE PROCEDURE RemoveTrucks
@TruckID INT
AS
BEGIN
DELETE FROM Vehicles
WHERE TruckID = @TruckID
END
;
GO

CREATE PROCEDURE UpdateTruckPlate
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


CREATE PROCEDURE InsertCustomers
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

CREATE PROCEDURE RemoveCustomers
@CustomerID INT
AS
BEGIN
DELETE FROM Customers
WHERE CustomerID = @CustomerID
END
;
GO

CREATE PROCEDURE InsertDrivers
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

CREATE PROCEDURE RemoveDrivers
@DriverID INT
AS
BEGIN
DELETE FROM Drivers
WHERE DriverID = @DriverID
END
;
GO

