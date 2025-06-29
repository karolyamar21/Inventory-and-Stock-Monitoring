Select *
FROM dbo.Products


--Manually Create table
INSERT INTO dbo.products VALUES
(1, 'USB Cable', 'Electronics', 50),
(2, 'Wireless Mouse', 'Electronics', 20),
(3, 'Notebook', 'Stationary', 80),
(4, 'Desk Chair', 'Furniture', 5),
(5, 'Office Table', 'Furniture', 12),
(6, 'Pen', 'Stationary', 10);


Select *
FROM dbo.Restocks

--Manually Create table
INSERT INTO dbo.Restocks VALUES
(94,1, '06-01-2025', 60),
(95,2, '06-01-2025', 30),
(96,3, '06-01-2025', 100),
(97,4, '06-01-2025', 10),
(98,5, '06-01-2025', 20),
(99,6, '06-01-2025', 20); 



--Date Correction
UPDATE Restocks
SET Date = '2025-06-02'
WHERE RestockID = 95;

UPDATE Restocks
SET Date = '2025-06-02'
WHERE RestockID = 96;

UPDATE Restocks
SET Date = '2025-06-03'
WHERE RestockID = 97;

UPDATE Restocks
SET Date = '2025-06-04'
WHERE RestockID = 98;

UPDATE Restocks
SET Date = '2025-06-05'
WHERE RestockID = 98;


Select *
FROM dbo.Shipments



INSERT INTO dbo.Shipments VALUES
(50,1, '06-01-2025', 60),
(51,2, '06-01-2025', 30),
(52,3, '06-01-2025', 100),
(53,4, '06-01-2025', 10),
(54,5, '06-01-2025', 20),
(55,6, '06-01-2025', 20); 




--Create view to be loaded in Power BI
CREATE VIEW v_RestockSummary AS
SELECT  
  FORMAT(r.Date, 'yyyy-MM') AS RestockMonth,
  CAST(p.Category AS NVARCHAR(100)) AS Category,
  SUM(r.Quantity) AS TotalRestocked
FROM dbo.Restocks r
JOIN dbo.Products p ON r.ProductID = p.ProductID
GROUP BY FORMAT(r.Date, 'yyyy-MM'), CAST(p.Category AS NVARCHAR(100));


CREATE VIEW v_MonthlyShipments AS
SELECT  
  FORMAT(s.Date, 'yyyy-MM') AS ShipmentMonth,
  CAST(p.Category AS NVARCHAR(100)) AS Category,
  SUM(s.Quantity) AS TotalShipped
FROM dbo.Shipments s
JOIN dbo.Products p ON s.ProductID = p.ProductID
GROUP BY FORMAT(s.Date, 'yyyy-MM'), CAST(p.Category AS NVARCHAR(100));

