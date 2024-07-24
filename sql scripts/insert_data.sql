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