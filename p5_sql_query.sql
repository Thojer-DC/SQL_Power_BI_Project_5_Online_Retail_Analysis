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

SELECT * FROM retail;


-- Total Sales Over Time: Query to calculate total sales per month:

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


-- Top 10 Products by Sales: Query to find the top 10 products by sales value:
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


-- Sales by Region (Country): Query to calculate sales by region:
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


-- Customer Demographics Analysis: To analyze customer buying patterns:

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


























