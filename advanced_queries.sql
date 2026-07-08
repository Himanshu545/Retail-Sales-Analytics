-- ==========================================
-- WINDOW FUNCTION : RANK
-- ==========================================

SELECT

    Product_ID,

    Sales,

    RANK() OVER(
        ORDER BY Sales DESC
    ) AS Sales_Rank

FROM Sales;
-------------------------------------------------
-- Section 2- Dense rank

SELECT

    Product_ID,

    Profit,

    DENSE_RANK() OVER(
        ORDER BY Profit DESC
    ) AS Profit_Rank

FROM Sales;
------------------------------------------------------
-- section 3 row number

SELECT

    Customer_ID,

    Sales,

    ROW_NUMBER() OVER(
        ORDER BY Sales DESC
    ) AS Row_No

FROM Sales;
-------------------------------------------------
-- section 4 running total
SELECT

    Order_Date,

    Sales,

    SUM(Sales)

    OVER(

        ORDER BY Order_Date

    ) AS Running_Total

FROM Sales;
----------------------------------------------------
-- section 5 common table expression

WITH CustomerRevenue AS
(
    SELECT

        Customer_ID,

        SUM(Sales) AS Revenue

    FROM Sales

    GROUP BY Customer_ID
)

SELECT *

FROM CustomerRevenue

ORDER BY Revenue DESC;
------------------------------------------------
-- section 6 highest selling category

SELECT

    Category,

    Revenue

FROM(

    SELECT

        p.Category,

        SUM(s.Sales) AS Revenue,

        RANK() OVER(

            ORDER BY SUM(s.Sales) DESC

        ) AS rk

    FROM Sales s

    JOIN Products p

    ON s.Product_ID=p.Product_ID

    GROUP BY p.Category

)t

WHERE rk=1;
---------------------------------------------------
-- section 7 case statement
SELECT

Order_ID,

Sales,

CASE

WHEN Sales>=20000 THEN 'High'

WHEN Sales>=10000 THEN 'Medium'

ELSE 'Low'

END AS Sales_Category

FROM Sales;
------------------------------------------------
-- section 8 subquery
SELECT *

FROM Sales

WHERE Sales>(

SELECT AVG(Sales)

FROM Sales

);
-----------------------------------------------
-- section 9 correlated subquery

SELECT

Customer_ID,

Sales

FROM Sales s1

WHERE Sales>(

SELECT AVG(Sales)

FROM Sales s2

WHERE s1.Customer_ID=s2.Customer_ID

);
-----------------------------------------------------
-- section 10 top 3 customers

SELECT *

FROM(

SELECT

c.Customer_Name,

SUM(s.Sales) AS Revenue,

DENSE_RANK()

OVER(

ORDER BY SUM(s.Sales) DESC

) AS Ranking

FROM Sales s

JOIN Customers c

ON s.Customer_ID=c.Customer_ID

GROUP BY c.Customer_Name

)t

WHERE Ranking<=3;