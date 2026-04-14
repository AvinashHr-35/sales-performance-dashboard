rename table projecte to superstore;
--  Table check karo 
select * from superstore limit 10; 
-- NULL values check karo
SELECT 
    COUNT(*) - COUNT(Sales) AS null_sales,
    count(*)-count(profit)as null_profit,
    count(*)-count(region) as null_region
FROM
    superstore;
--     Region wise total Sales 
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT 'order id') AS total_id
FROM
    superstore
GROUP BY region
ORDER BY total_sales DESC;
-- Monthly Sales Trend
SELECT 
    YEAR('order date') AS years,
    MONTH('order date') AS months,
    ROUND(SUM(sales), 2) AS month_sale
FROM
    superstore
GROUP BY YEAR('order date') , MONTH('order date')
ORDER BY years , months;
-- Category wise Sales & Profit 
select count(distinct 'category') as category from superstore;
select round(sum(sales),2) as cat_sales,
round(sum(profit),2) as cat_profit,
round(sum(sales)/sum(profit)*100,2) as cat_total from superstore;
select * from superstore;
 ALTER TABLE superstore
 MODIFY Order_Date DATE;
 ALTER TABLE superstore 
ADD COLUMN new_order_date DATE;
UPDATE superstore
SET new_order_date = STR_TO_DATE(TRIM(Order_Date), '%d-%m-%Y')
WHERE Order_Date REGEXP '^[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}$';
SELECT Order_Date, new_order_date
FROM superstore;
ALTER TABLE superstore DROP COLUMN Order_Date;
ALTER TABLE superstore CHANGE new_order_date Order_Date DATE;
INSERT INTO superstore (Order_Date)
VALUES (STR_TO_DATE('11-08-2016', '%d-%m-%Y'));
UPDATE superstore
SET order_date = '2000-01-01'
WHERE order_date IS NULL;
select * from superstore;
-- use sales_db;