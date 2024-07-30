USE LogisticsDB
;
GO

ALTER TABLE Costs
ADD CONSTRAINT fk_Costs_Vehicles
FOREIGN KEY (TruckID)
REFERENCES Vehicles(TruckID)
;
GO

ALTER TABLE Costs 
ADD CONSTRAINT fk_Costs_Drivers 
FOREIGN KEY (DriverID) 
REFERENCES Drivers(DriverID)
;
GO

ALTER TABLE Freight 
ADD CONSTRAINT fk_Freight_Customers 
FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID)
;
GO

ALTER TABLE Freight 
ADD CONSTRAINT fk_Freight_Vehicles 
FOREIGN KEY (TruckID) 
REFERENCES Vehicles(TruckID)
;
GO

ALTER TABLE Costs 
ADD TotalCost DECIMAL(10,2)
;
GO
UPDATE Costs 
SET TotalCost = FuelCost + MaintenanceCost + FixedCost
;
GO

ALTER TABLE Freight 
ADD CONSTRAINT 
fk_Freight_Date 
FOREIGN KEY (Date) 
REFERENCES Date(Date)
;
GO

ALTER TABLE Costs 
ADD CONSTRAINT fk_Costs_Date 
FOREIGN KEY (Date) 
REFERENCES Date(Date)
;
GO

ALTER TABLE Costs
ADD LitersPer100Km DECIMAL(10,2)
;
GO

UPDATE Costs 
SET LitersPer100Km = 
CASE							
	WHEN  KmTravelled = 0 THEN 0
	ELSE (LitersConsumption / KmTravelled) * 100
	END;
GO

ALTER TABLE Date 
ADD DateID INT
;
GO

UPDATE Date 
SET DateID = (Month * 1000) + RIGHT(Year, 2)
;
GO

ALTER TABLE Date
DROP COLUMN DateID
;
GO

ALTER  TABLE Vehicles
ADD TargetID INT 
;
GO

UPDATE Vehicles
SET TargetID  = (
SELECT TargetID
FROM Targets
WHERE Vehicles.TruckType =
Targets.TruckType
)
;
GO

ALTER TABLE Vehicles
ADD CONSTRAINT fk_Vehicles_Targets
FOREIGN KEY (TargetID)
REFERENCES Targets(TargetID)
;
GO