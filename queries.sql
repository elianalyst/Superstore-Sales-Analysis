--Schema
SELECT name FROM sqlite_master WHERE type='table';
PRAGMA table_info(superstore);

--Exploratory queries
SELECT COUNT(*) FROM superstore;

SELECT * FROM superstore LIMIT 2;

SELECT 
    MIN(Sales) AS Min_Sales,
    MAX(Sales) AS Max_Sales,
    AVG(Sales) AS Avg_Sales,
    SUM(Sales) AS Total_Sales
FROM superstore;

SELECT
    Region,
    COUNT(*) AS Count
FROM superstore
GROUP BY Region
ORDER BY Count DESC;

SELECT 
    COUNT(DISTINCT City),
    COUNT(DISTINCT [Product Name]),
    COUNT(DISTINCT [Customer Name])
FROM superstore;

-- Key Performance Indicators -- 

-- 1. Total Sales and Profit by Region
SELECT
    Region,
    COUNT(DISTINCT [Customer Name]) AS Num_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

--2. Top-Selling Products (by revenue)
SELECT
    [Product Name],
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Sale,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY [Product Name]
HAVING COUNT(*) > 5
ORDER BY Total_Sales DESC
LIMIT 10;

--3. Top Purchasing Customers
SELECT
    [Customer Name],
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Sale_Value
FROM superstore
GROUP BY [Customer Name]
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4. Top 5 Sub-Categories Driving Sales
SELECT
    [Sub-Category],
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Percent,
    COUNT(DISTINCT [Customer Name]) AS Num_Customers
FROM superstore
GROUP BY [Sub-Category]
ORDER BY Total_Sales DESC
LIMIT 5;


