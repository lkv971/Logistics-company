USE LogisticsDB
;
GO

CREATE FUNCTION GetVehicleMonthlyCost (@VehicleID INT)
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

CREATE FUNCTION GetFreightTransitDetails (@InvoiceNumber INT)
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

CREATE FUNCTION GetDriverInfo (@DriverID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT * FROM Drivers
WHERE DriverID = @DriverID
)
;
GO

CREATE FUNCTION GetVehicleInfo (@VehicleID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT * FROM Vehicles 
WHERE TruckID = @VehicleID
)
;
GO

CREATE FUNCTION GetCustomerInfo (@CustomerID INT)
RETURNS TABLE
AS 
RETURN 
(
SELECT * FROM Customers
WHERE CustomerID = @CustomerID
)
;
GO





