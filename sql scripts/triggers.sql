USE LogisticsDB
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