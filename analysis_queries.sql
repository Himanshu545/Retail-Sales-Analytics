-- Section 1 Bussiness KPIs --

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Sales;

-- Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM Sales;

-- Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM Sales;

-- Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM Sales;

-- Average Order Value
SELECT ROUND(AVG(Sales),2) AS Average_Order_Value
FROM Sales;

---------------------------------------------------------------------
-- Section 2 Customer Analysis

-- Top Customers

SELECT

c.Customer_Name,

ROUND(SUM(s.Sales),2) AS Revenue

FROM Sales s

JOIN Customers c

ON s.Customer_ID=c.Customer_ID

GROUP BY c.Customer_Name

ORDER BY Revenue DESC;

------------------------------------------------

-- Customer Count by Region

SELECT

Region,

COUNT(*) AS Customers

FROM Customers

GROUP BY Region;

------------------------------------------------

-- Average Customer Age

SELECT

ROUND(AVG(Age),2)

AS Average_Age

FROM Customers;

----------------------------------------------------
-- Section 3 Product Analysis

-- Top Selling Products

SELECT

p.Product_Name,

SUM(s.Quantity)

AS Quantity_Sold

FROM Sales s

JOIN Products p

ON s.Product_ID=p.Product_ID

GROUP BY p.Product_Name

ORDER BY Quantity_Sold DESC;

------------------------------------------------

-- Product Profit

SELECT

p.Product_Name,

ROUND(SUM(s.Profit),2)

AS Profit

FROM Sales s

JOIN Products p

ON s.Product_ID=p.Product_ID

GROUP BY p.Product_Name

ORDER BY Profit DESC;

------------------------------------------------

-- Category Wise Sales

SELECT

p.Category,

ROUND(SUM(s.Sales),2)

AS Revenue

FROM Sales s

JOIN Products p

ON s.Product_ID=p.Product_ID

GROUP BY p.Category

ORDER BY Revenue DESC;
----------------------------------------------------------------

-- Section 4 Regional Analysis
SELECT

c.Region,

ROUND(SUM(s.Sales),2)

AS Sales,

ROUND(SUM(s.Profit),2)

AS Profit

FROM Sales s

JOIN Customers c

ON s.Customer_ID=c.Customer_ID

GROUP BY c.Region

ORDER BY Sales DESC;
--------------------------------------------------------------------------------

-- Section 5 Monthly Analysis
SELECT

Month,

ROUND(SUM(Sales),2)

AS Monthly_Sales,

ROUND(SUM(Profit),2)

AS Monthly_Profit

FROM Sales

GROUP BY Month

ORDER BY Year, Quarter;
------------------------------------------------------------------------------

-- Section 6 Discount Analysis
SELECT

Discount,

COUNT(*)

AS Orders,

ROUND(AVG(Profit),2)

AS Avg_Profit

FROM Sales

GROUP BY Discount

ORDER BY Discount;
-----------------------------------------------------------------------

-- Section 7 Profit margin
SELECT

ROUND(AVG(Profit_Margin),2)

AS Avg_Profit_Margin

FROM Sales;
---------------------------------------------------------------------------

-- Section 8 Highest revenue order
SELECT *

FROM Sales

ORDER BY Sales DESC

LIMIT 1;
------------------------------------------------------------------------------

-- Section 8 Lowest profit order
SELECT *

FROM Sales

ORDER BY Profit

LIMIT 1;
----------------------------------------------------------------------------

-- Section 10 Dashboard KPIs
SELECT

COUNT(*) AS Orders,

ROUND(SUM(Sales),2) AS Revenue,

ROUND(SUM(Profit),2) AS Profit,

ROUND(AVG(Sales),2) AS Avg_Order_Value,

SUM(Quantity) AS Quantity

FROM Sales;