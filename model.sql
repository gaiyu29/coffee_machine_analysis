CREATE TABLE dim_product AS
SELECT DISTINCT
    ProductName,
    BrandName,
    BrandType,
    MachineType
FROM cleaned_dataset;

ALTER TABLE dim_product ADD COLUMN ProductID INT AUTO_INCREMENT PRIMARY KEY FIRST;

SELECT * FROM dim_product ORDER BY ProductName;

DROP TABLE IF EXISTS dim_supplier;

CREATE TABLE dim_supplier AS
SELECT DISTINCT
    SupplierName
FROM cleaned_dataset;

ALTER TABLE dim_supplier ADD COLUMN SupplierID INT AUTO_INCREMENT PRIMARY KEY FIRST;

DROP TABLE IF EXISTS dim_location;

CREATE TABLE dim_location AS
SELECT DISTINCT
    City
FROM cleaned_dataset;

ALTER TABLE dim_location ADD COLUMN LocationID INT AUTO_INCREMENT PRIMARY KEY FIRST;


DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
    SaleDate,
    DAY(SaleDate) AS Day,
    MONTH(SaleDate) AS Month,
    YEAR(SaleDate) AS Year,
    QUARTER(SaleDate) AS Quarter,
    MONTHNAME(SaleDate) AS MonthName
FROM cleaned_dataset;

ALTER TABLE dim_date ADD PRIMARY KEY (SaleDate);

SELECT COUNT(*) FROM DIM_DATE;

SELECT COUNT(*) FROM CLEANED_DATASET;

DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales AS
SELECT 
    c.TransactionID,
    p.ProductID,
    s.SupplierID,
    l.LocationID,
    c.SaleDate,
    c.UnitsSold,
    c.UnitPrice,
    c.StockAvailable,
    (c.UnitsSold * c.UnitPrice) AS TotalRevenue
FROM cleaned_dataset c
JOIN dim_product p ON c.ProductName = p.ProductName 
    AND c.BrandName = p.BrandName 
    AND c.BrandType = p.BrandType 
    AND c.MachineType = p.MachineType
JOIN dim_supplier s ON c.SupplierName = s.SupplierName
JOIN dim_location l ON c.City = l.City;

ALTER TABLE fact_sales ADD PRIMARY KEY (TransactionID);

SELECT COUNT(*) FROM fact_sales;


SELECT 
    c.ProductName, p.ProductName,
    c.BrandName, p.BrandName,
    c.BrandType, p.BrandType,
    c.MachineType, p.MachineType
FROM cleaned_dataset c
LEFT JOIN dim_product p ON c.ProductName = p.ProductName 
    AND c.BrandName = p.BrandName 
    AND c.BrandType = p.BrandType 
    AND c.MachineType = p.MachineType
WHERE p.ProductID IS NULL
LIMIT 5;


DESCRIBE fact_sales;
SELECT * FROM fact_sales;
