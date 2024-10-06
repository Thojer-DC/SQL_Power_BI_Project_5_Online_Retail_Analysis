# Online Retail Analysis using Power BI & SQL


## Overview
- The analysis was performed on Online Retail dataset using SQL for extraction and Power BI for data visualization. Key insights were drawn from the data to help improve business strategies, particularly in product performance, regional sales, and customer demographics.

## Objectives
- Analyze sales data to identify trends over time.
- Identify top-performing products and regions.
- Analyze customer demographics to understand buying patterns.
- Create an interactive Power BI dashboard to visualize the insights.

## Dataset

The data for this project is sourced:

- **Dataset Link:** [Online Retail Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)

## Schema

```sql
-- Create Database

CREATE DATABASE online_retail;

-- Create table

DROP TABLE IF EXISTS retail;
CREATE TABLE retail
(
	InvoiceNo VARCHAR(55),
	StockCode VARCHAR(55),
	Description TEXT,
	Quantity INT,
	InvoiceDate TIMESTAMP,
	UnitPrice DECIMAL(10,2),
	CustomerID VARCHAR(55),
	Country VARCHAR(55)

);
```

## SQL Queries And Data Analysis

### Total Sales Over Time: Query to calculate total sales per month:

```sql
    CREATE TABLE overtime_sales
    AS 
    (
    SELECT 
        EXTRACT(YEAR FROM invoicedate) AS year,
        EXTRACT(MONTH FROM invoicedate) AS month,
        SUM(quantity * unitprice) AS total_sale
    FROM retail
    GROUP BY 1,2
    ORDER BY 1,2
    );

    SELECT * FROM overtime_sales;
```


### Top 10 Products by Sales: Query to find the top 10 products by sales value:

```sql
    CREATE TABLE product_sales
    AS 
    (
        SELECT 
            stockcode,
            description,
            SUM(quantity * unitprice) AS product_sale
        FROM retail
        GROUP BY 1,2
        ORDER BY 3 DESC
        LIMIT 10
    );

    SELECT * FROM product_sales;
```

### Sales by Region (Country): Query to calculate sales by region:

```sql
    CREATE TABLE country_sales
    AS 
    (
        SELECT 
            country,
            SUM(quantity * unitprice) AS country_sale
        FROM retail
        GROUP BY 1
    );

    SELECT * FROM country_sales;
```


### Customer Demographics Analysis: To analyze customer buying patterns:

```sql
    CREATE TABLE customer_demographics
    AS 
    (
        SELECT 
            customerid,
            COUNT(DISTINCT invoiceno) AS total_transaction,
            SUM(quantity * unitprice) AS total_spent
        FROM retail
        WHERE customerid IS NOT NULL
        GROUP BY 1
    );

    SELECT * FROM customer_demographics;
```

## Dashboard

### Power BI - Online Retail Performance Dashboard:

![Dashboard](https://github.com/Thojer-DC/SQL_Power_BI_Project_5_Online_Retail_Analysis/blob/main/Dashboard/Dashboard.png)


## Findings and Conclusion

- **Sales Trends Over Time:** Sales fluctuated over the months, with a clear peak during the month of (Septeber - December).
- **Top 10 Products by Sales:** The top 10 products accounted for 30% of total sales. For example, Product 1 generated $206K, while Product 2 made $165K.
- **Sales by Region:** The United kingdom is the top-performing region, contributing 50% of total sales.
- **Customer Demographics and Buying Patterns:** A group of high-value customers is responsible for a large percentage of sales.

- The analysis provided valuable insights into Online Retail performance. The recommendations focus on increasing sales during low months, enhancing customer loyalty, and targeting underperforming regions. Implementing these strategies could result in higher revenue and stronger customer engagement in the coming year.

- Project by Thomas Jericho Dela Cruz
