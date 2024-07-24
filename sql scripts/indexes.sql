USE LogisticsDB
;
GO

CREATE INDEX idx_Costs_Date ON Costs(Date)
;
GO
CREATE INDEX idx_Freight_InvoiceNumber ON Freight(InvoiceNumber)
;
GO
