CREATE DATABASE RetailSalesAnalytics;

USE RetailSalesAnalytics;

CREATE TABLE Customers (

    Customer_ID VARCHAR(10) PRIMARY KEY,

    Customer_Name VARCHAR(100),

    Gender VARCHAR(20),

    Age INT,

    City VARCHAR(100),

    State VARCHAR(100),

    Region VARCHAR(50)

);

CREATE TABLE Products (

    Product_ID VARCHAR(10) PRIMARY KEY,

    Product_Name VARCHAR(100),

    Category VARCHAR(100),

    Sub_Category VARCHAR(100),

    Cost_Price DECIMAL(10,2)

);

CREATE TABLE Sales (

    Order_ID INT PRIMARY KEY,

    Customer_ID VARCHAR(10),

    Product_ID VARCHAR(10),

    Order_Date DATE,

    Quantity INT,

    Sales DECIMAL(12,2),

    Profit DECIMAL(12,2),

    Discount DECIMAL(10,2),

    Month VARCHAR(20),

    Year INT,

    Quarter INT,

    Profit_Margin DECIMAL(10,2),

    FOREIGN KEY(Customer_ID)

        REFERENCES Customers(Customer_ID),

    FOREIGN KEY(Product_ID)

        REFERENCES Products(Product_ID)

);