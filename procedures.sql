-- sales by region

DELIMITER $$

CREATE PROCEDURE GetSalesByRegion(
    IN region_name VARCHAR(50)
)

BEGIN

SELECT

c.Region,

SUM(s.Sales) AS Total_Sales,

SUM(s.Profit) AS Total_Profit

FROM Sales s

JOIN Customers c

ON s.Customer_ID=c.Customer_ID

WHERE c.Region=region_name

GROUP BY c.Region;

END $$

DELIMITER ;
----------------------------------------------
-- customer purchase history

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(
    IN customer_id VARCHAR(10)
)

BEGIN

SELECT *

FROM Sales

WHERE Customer_ID=customer_id;

END $$

DELIMITER ;
--------------------------------------------------
-- product revenue

DELIMITER $$

CREATE PROCEDURE ProductRevenue()

BEGIN

SELECT

p.Product_Name,

SUM(s.Sales) AS Revenue,

SUM(s.Profit) AS Profit

FROM Sales s

JOIN Products p

ON s.Product_ID=p.Product_ID

GROUP BY p.Product_Name

ORDER BY Revenue DESC;

END $$

DELIMITER ;
---------------------------------------------------
-- monthly sales

DELIMITER $$

CREATE PROCEDURE MonthlySales()

BEGIN

SELECT

Month,

SUM(Sales) AS Revenue,

SUM(Profit) AS Profit

FROM Sales

GROUP BY Month

ORDER BY Revenue DESC;

END $$

DELIMITER ;