USE LogisticsDB
;
GO

CREATE VIEW VehicleCount
AS 
SELECT COUNT(TruckID) AS VehicleCount
FROM Vehicles
;
GO

CREATE VIEW VehicleAverageYear
AS
SELECT Plate AS Vehicle,
AVG(YEAR(GETDATE()) - Year) AS AverageAge
FROM Vehicles
GROUP BY Plate
;
GO

ALTER VIEW VehicleAverageYear
AS
SELECT AVG(YEAR(GETDATE()) - Year) AS AverageAge
FROM Vehicles
;
GO

CREATE VIEW TripDataPerVehicle
AS
SELECT YEAR(c.Date) AS Year,
v.Plate AS Vehicle,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID 
GROUP BY YEAR(c.Date), v.Plate
;
GO

CREATE VIEW VehicleFuelPerformance2018
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

CREATE VIEW VehicleFuelPerformance2019
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

CREATE VIEW TruckTypeCount
AS
SELECT TruckType,
COUNT(TruckType) AS VehicleCount
FROM Vehicles
GROUP BY TruckType
;
GO

CREATE VIEW TripDataPerTruckType
AS
SELECT YEAR(c.Date) AS Year,
v.TruckType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID 
GROUP BY YEAR(c.Date), v.TruckType
;
GO

CREATE VIEW TrailerTypeCount
AS
SELECT TrailersType,
COUNT(TrailersType) AS VehicleCount
FROM Vehicles
GROUP BY TrailersType
;
GO

CREATE VIEW TripDataPerTrailersType
AS
SELECT YEAR(c.Date) AS Year,
v.TrailersType,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c
ON v.TruckID = c.TruckID 
GROUP BY YEAR(c.Date), v.TrailersType
;
GO

CREATE VIEW DriverCount
AS
SELECT COUNT(DriverID) AS DriverCount
FROM Drivers
WHERE DriverID != 1
;
GO

CREATE VIEW TripDataPerDriver
AS
SELECT YEAR(c.Date) AS Year,
d.Driver,
SUM(c.KmTravelled)AS TotalKm,
AVG(c.KmTravelled) AS AverageKm,
AVG(c.Litersper100Km) AS FuelConsuptionPer100Km
FROM Vehicles v
INNER JOIN Costs c ON v.TruckID = c.TruckID
INNER JOIN Drivers d ON d.DriverID = c.DriverID
WHERE d.DriverID != 1
GROUP BY YEAR(c.Date), d.Driver
;
GO

CREATE VIEW DriverFuelPerformance2018
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

CREATE VIEW DriverFuelPerformance2019
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

CREATE VIEW CustomerCount
AS 
SELECT COUNT(CustomerID) AS CustomerCount
FROM Customers
;
GO

CREATE VIEW CustomerFreightDetailsPerState
AS
SELECT cu.State,
AVG(f.WeightKg) AS GoodsWeight,
AVG(f.GoodsValue) AS GoodsValue
FROM Customers cu
INNER JOIN Freight f
ON cu.CustomerID = f.CustomerID
GROUP BY cu.State
;
GO







