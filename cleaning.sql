CREATE DATABASE CoffeeMachine_Order;
USE CoffeeMachine_Order;

CREATE TABLE raw_data(
	TransactionID INT,
    ProductName VARCHAR(150),
    BrandType VARCHAR(100),
    Color VARCHAR(50),
    City VARCHAR(100),
    SaleDate VARCHAR(50),
    UnitsSold INT,
    UnitPrice DECIMAL(10,2),
    SupplierName VARCHAR(150),
    StockAvailable INT,
    BrandName VARCHAR(100),
    MachineType VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/coffee_machine.csv'
INTO TABLE raw_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE cleaned_dataset LIKE raw_data;

INSERT INTO cleaned_dataset
SELECT *
FROM raw_data;

SELECT *FROM cleaned_dataset
WHERE transactionid = '' OR transactionid IS NULL;

SELECT *FROM cleaned_dataset
WHERE productName = '' OR productName IS NULL;

SELECT *FROM cleaned_dataset
WHERE UnitsSold = '' OR UnitsSold IS NULL;

DELETE FROM cleaned_dataset
WHERE unitssold ='' OR unitssold IS NULL;

SELECT *FROM cleaned_dataset
WHERE SupplierName = '' OR SupplierName IS NULL;
UPDATE cleaned_dataset SET SupplierName = 'Unknown Supplier' WHERE SupplierName IS NULL OR SupplierName = '';

SELECT transactionid, COUNT(*)
FROM
    cleaned_dataset
GROUP BY transactionid
HAVING COUNT(*) > 1;

SELECT *, COUNT(*)
FROM
    cleaned_dataset
GROUP BY transactionid , productname , brandtype , color , city , saledate , unitssold , unitprice , suppliername , stockavailable , brandname , machinetype
HAVING COUNT(*) > 1;


DELETE t1 FROM cleaned_dataset t1
        JOIN
    cleaned_dataset t2 ON t1.transactionid = t2.transactionid
        AND t1.productname = t2.productname
        AND t1.brandtype = t2.brandtype
        AND t1.color = t2.color
        AND t1.city = t2.city
        AND t1.saledate = t2.saledate
        AND t1.unitssold = t2.unitssold
        AND t1.unitprice = t2.unitprice
        AND t1.suppliername = t2.suppliername
        AND t1.stockavailable = t2.stockavailable
        AND t1.brandname = t2.brandname
        AND t1.machinetype = t2.machinetype
        AND t1.transactionid > t2.transactionid;



UPDATE cleaned_dataset 
SET 
    productname = LOWER(TRIM(productname)),
    brandname = LOWER(TRIM(brandname)),
    city = LOWER(TRIM(city)),
    suppliername = LOWER(TRIM(suppliername)),
    machinetype = LOWER(TRIM(machinetype)),
    brandtype = LOWER(TRIM(brandtype));
 
SELECT *
FROM
    cleaned_dataset
WHERE
    UnitsSold < 0 OR UnitPrice < 0;

DELETE FROM cleaned_dataset 
WHERE
    UnitsSold < 0 OR UnitPrice < 0;
 
SELECT DISTINCT SaleDate
FROM
    cleaned_dataset
LIMIT 20;

ALTER TABLE cleaned_dataset ADD COLUMN SaleDateFormatted DATE;
UPDATE cleaned_dataset
SET SaleDateFormatted = STR_TO_DATE(SaleDate, '%d-%m-%Y');

SELECT SaleDate, SaleDateFormatted FROM cleaned_dataset LIMIT 10;
ALTER TABLE cleaned_dataset DROP COLUMN SaleDate;
ALTER TABLE cleaned_dataset RENAME COLUMN SaleDateFormatted TO SaleDate;




