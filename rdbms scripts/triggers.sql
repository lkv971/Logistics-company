USE LogisticsDB
;
GO

CREATE TRIGGER TrgInsertCost
ON Costs
AFTER INSERT
AS 
BEGIN
INSERT INTO CostsAudit (
TruckID,
DriverID,
ChangeType,
ChangeDate,
NewDate,
NewKmTravelled,
NewLitersConsumption,
NewFuelCost,
NewMaintenanceCost,
NewFixedCost
)
SELECT
i.TruckID,
i.DriverID,
'INSERT',
GETDATE(),
i.Date,
i.KmTravelled,
i.LitersConsumption,
i.FuelCost,
i.MaintenanceCost,
i.FixedCost
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgDeleteCost
ON Costs
AFTER DELETE
AS 
BEGIN
INSERT INTO CostsAudit (
TruckID,
DriverID,
ChangeType,
ChangeDate,
OldDate,
OldKmTravelled,
OldLitersConsumption,
OldFuelCost,
OldMaintenanceCost,
OldFixedCost
)
SELECT
d.TruckID,
d.DriverID,
'DELETE',
GETDATE(),
d.Date,
d.KmTravelled,
d.LitersConsumption,
d.FuelCost,
d.MaintenanceCost,
d.FixedCost
FROM deleted d
;
END
;
GO

CREATE Trigger TrgInsertFreight
ON Freight
AFTER INSERT
AS 
BEGIN 
INSERT INTO FreightAudit (
CustomerID,
TruckID,
ChangeType,
ChangeDate,
NewDate,
NewInvoiceNumber,
NewFreightID,
NewCity,
NewRevenue,
NewWeightKg,
NewWeightCubic,
NewGoodsValue
)
SELECT
i.CustomerID,
i.TruckID,
'INSERT',
GETDATE(),
i.Date,
i.InvoiceNumber,
i.FreightID,
i.City,
i.Revenue,
i.WeightKg,
i.WeightCubic,
i.GoodsValue
FROM inserted i
;
END
;
GO

CREATE Trigger TrgDeleteFreight
ON Freight
AFTER DELETE
AS 
BEGIN 
INSERT INTO FreightAudit (
CustomerID,
TruckID,
ChangeType,
ChangeDate,
OldDate,
OldInvoiceNumber,
OldFreightID,
OldCity,
OldRevenue,
OldWeightKg,
OldWeightCubic,
OldGoodsValue
)
SELECT
d.CustomerID,
d.TruckID,
'DELETE',
GETDATE(),
d.Date,
d.InvoiceNumber,
d.FreightID,
d.City,
d.Revenue,
d.WeightKg,
d.WeightCubic,
d.GoodsValue
FROM deleted d
;
END
;
GO

CREATE TRIGGER TrgInsertDriver
ON Drivers
AFTER INSERT
AS 
BEGIN
INSERT INTO DriverAudit (
DriverID,
ChangeType,
ChangeDate,
NewDriver
)
SELECT
i.DriverID,
'INSERT',
GETDATE(),
i.Driver
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgUpdateDriver
ON Drivers
AFTER UPDATE
AS 
BEGIN 
INSERT INTO DriverAudit (
DriverID,
ChangeType,
ChangeDate,
OldDriver,
NewDriver
)
SELECT
d.DriverID,
'UPDATE',
GETDATE(),
d.Driver,
i.Driver
FROM deleted d 
INNER JOIN inserted i
ON d.DriverID = i.DriverID
;
END
GO
;

CREATE TRIGGER TrgRemoveDriver
ON Drivers
AFTER DELETE
AS 
BEGIN
INSERT INTO DriverAudit (
DriverID,
ChangeType,
ChangeDate,
OldDriver
)
SELECT
d.DriverID,
'DELETE',
GETDATE(),
d.Driver
FROM deleted d
;
END
;
GO

CREATE TRIGGER TrgInsertVehicle
ON Vehicles
AFTER INSERT
AS
BEGIN
INSERT INTO VehicleAudit (
TruckID,
ChangeType,
ChangeDate,
NewPlate,
NewBrand,
NewTruckType,
NewTrailersType,
NewYear
)
SELECT
i.TruckID,
'INSERT',
GETDATE(),
i.Plate,
i.Brand,
i.TruckType,
i.TrailersType,
i.Year
FROM inserted i
;
END;
GO

CREATE TRIGGER TrgRemoveVehicle
ON Vehicles
AFTER DELETE
AS
BEGIN
INSERT INTO VehicleAudit (
TruckID,
ChangeType,
ChangeDate,
OldPlate,
OldBrand,
OldTruckType,
OldTrailersType,
OldYear
)
SELECT
d.TruckID,
'DELETE',
GETDATE(),
d.Plate,
d.Brand,
d.TruckType,
d.TrailersType,
d.Year
FROM deleted d
;
END;
GO

CREATE TRIGGER TrgInsertCustomer
ON Customers
AFTER INSERT
AS
BEGIN
INSERT INTO CustomerAudit (
CustomerID,
ChangeType,
ChangeDate,
NewCity,
NewState,
NewLatitude,
NewLongitude
)
SELECT
i.CustomerID,
'INSERT',
GETDATE(),
i.City,
i.State,
i.Latitude,
i.Longitude
FROM inserted i
;
END;
GO

CREATE TRIGGER TrgRemoveCustomer
ON Customers
AFTER DELETE
AS
BEGIN
INSERT INTO CustomerAudit (
CustomerID,
ChangeType,
ChangeDate,
OldCity,
OldState,
OldLatitude,
OldLongitude
)
SELECT
d.CustomerID,
'DELETE',
GETDATE(),
d.City,
d.State,
d.Latitude,
d.Longitude
FROM deleted d
;
END;
GO