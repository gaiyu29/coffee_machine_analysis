#Coffee Machine Sales Analysis

Overview

This project performs end-to-end sales data analysis on 20,000 coffee machine sales records using MySQL for data cleaning and Power BI for visualization and business intelligence. The goal was to transform raw sales data into meaningful business insights through SQL processing and interactive dashboard reporting.

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
