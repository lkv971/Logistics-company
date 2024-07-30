USE LogisticsDB
;
GO


CREATE VIEW TripDataPerVehicle2018
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

CREATE VIEW TripDataPerVehicle2019
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


CREATE VIEW TripDataPerTruckType2018
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

CREATE VIEW TripDataPerTruckType2019
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

CREATE VIEW TripDataPerTrailersType2018
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

CREATE VIEW TripDataPerTrailersType2019
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


CREATE VIEW TripDataPerDriver2018
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

CREATE VIEW TripDataPerDriver2019
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


CREATE VIEW CustomerFreightDetailsPerState2018
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

CREATE VIEW CustomerFreightDetailsPerState2019
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






