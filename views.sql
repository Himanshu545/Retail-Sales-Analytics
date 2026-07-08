-- view 1 sales summary

CREATE VIEW vw_sales_summary AS

SELECT

    s.Order_ID,

    c.Customer_Name,

    p.Product_Name,

    p.Category,

    s.Quantity,

    s.Sales,

    s.Profit,

    s.Order_Date

FROM Sales s

JOIN Customers c
ON s.Customer_ID = c.Customer_ID

JOIN Products p
ON s.Product_ID = p.Product_ID;
------------------------------------------------
-- view 2 customer revenue

CREATE VIEW vw_customer_revenue AS

SELECT

    c.Customer_ID,

    c.Customer_Name,

    c.Region,

    ROUND(SUM(s.Sales),2) AS Revenue,

    ROUND(SUM(s.Profit),2) AS Profit

FROM Customers c

JOIN Sales s
ON c.Customer_ID = s.Customer_ID

GROUP BY

    c.Customer_ID,
    c.Customer_Name,
    c.Region;
-------------------------------------------------
-- view 3 product performance

CREATE VIEW vw_product_performance AS

SELECT

    p.Product_ID,

    p.Product_Name,

    p.Category,

    SUM(s.Quantity) AS Total_Quantity,

    ROUND(SUM(s.Sales),2) AS Revenue,

    ROUND(SUM(s.Profit),2) AS Profit

FROM Products p

JOIN Sales s
ON p.Product_ID = s.Product_ID

GROUP BY

    p.Product_ID,
    p.Product_Name,
    p.Category;
