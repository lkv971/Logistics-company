USE LogisticsDB
;
GO

BULK INSERT Costs 
FROM "C:\Users\ACER\OneDrive\Logistic Fleet Data\Costs.csv" 
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Customers 
FROM "C:\Users\ACER\OneDrive\Logistic Fleet Data\Customers.csv" 
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Drivers
FROM "C:\Users\ACER\OneDrive\Logistic Fleet Data\Drivers.csv" 
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR ='\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Freight
FROM "C:\Users\ACER\OneDrive\Logistic Fleet Data\Freight.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Vehicles
FROM "C:\Users\ACER\OneDrive\Logistic Fleet Data\Vehicles.csv" 
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

INSERT INTO Targets (
TruckType,
Target
)
SELECT DISTINCT TruckType,
CASE
	WHEN TruckType = 'TRAILER' THEN 30
	WHEN TruckType = 'SEMI-TRAILER' THEN 30
	WHEN TruckType = 'BOX' THEN 20
	WHEN TruckType = 'TRACTOR' THEN 25
END AS Target
FROM Vehicles
;
GO



	