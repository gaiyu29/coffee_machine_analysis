#Coffee Machine Sales Analysis

Overview

This project performs end-to-end sales data analysis on 20,000 coffee machine sales records using MySQL for data cleaning and Power BI for visualization and business intelligence. The goal was to transform raw sales data into meaningful business insights through SQL processing and interactive dashboard reporting.

Dataset Description

It contains coffee machines sales information including:

1. Transactionid - Unique Identifier for each sale transaction

2. ProductName – Name of the coffee machine

3. BrandName – Brand of the machine

4. BrandType – category of the brand positioning

5. MachineType – Commercial or At-home use

6. UnitPrice – Unit price of the product

7. UnitsSold – Number of units sold

8. SupplierName – Supplier providing the product

9. City – Sales location

10. SalesDate - date of teh transaction

11. StockAvailable - Numbers of units available in inventory 

12. Color - color variant of the machine


Tools & Technologies Used

1. MySQL – Data loading, cleaning, transformation

2. SQL – Duplicate removal, data validation, formatting

3. Power BI – Data visualization and dashboard creation

4. GitHub – Project documentation 

Project Workflow

1. Data Ingestion - 
Imported a raw CSV file of 20,000 rows into MySQL, created the table, and validated the data structure and types.

2. Data Cleaning (SQL) - 
Removed exact duplicate rows, standardized text fields using TRIM and LOWER, converted date formats, handled negative and invalid values, and corrected data types (INT, DECIMAL, DATE).

3. Clean Dataset Creation - 
Built a structured cleaned_dataset, ensured data integrity, and validated row counts after cleaning.

4. Data Modeling (Power BI) - 
Loaded the cleaned dataset into Power BI, created calculated columns and measures, and designed an interactive dashboard.


Dashboard Insights

1. KPI Cards - Total Revenue, Total units sold, Total Transactions, Stock available

2. Revenue trend by month

3. Revenue breakdown by city

4. Supplier performance analysis

5. Machine type contribution

6. Revenue per stock
