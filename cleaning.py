import os
import pandas as pd
import numpy as np

# ==========================================
# Paths
# ==========================================

RAW_PATH = "../dataset/raw/"
CLEAN_PATH = "../dataset/cleaned/"

os.makedirs(CLEAN_PATH, exist_ok=True)

# ==========================================
# Load Datasets
# ==========================================

customers = pd.read_csv(RAW_PATH + "customers.csv")
products = pd.read_csv(RAW_PATH + "products.csv")
sales = pd.read_csv(RAW_PATH + "sales.csv")

print("=" * 50)
print("Datasets Loaded Successfully")
print("=" * 50)

# ==========================================
# Customers Cleaning
# ==========================================

customers.drop_duplicates(inplace=True)

customers["Customer_Name"] = customers["Customer_Name"].str.title()

customers["Gender"] = customers["Gender"].str.capitalize()

customers["City"] = customers["City"].str.title()

customers["State"] = customers["State"].str.title()

customers["Region"] = customers["Region"].str.title()

customers["Age"] = customers["Age"].fillna(
    customers["Age"].median()
)

# ==========================================
# Products Cleaning
# ==========================================

products.drop_duplicates(inplace=True)

products["Product_Name"] = products["Product_Name"].str.title()

products["Category"] = products["Category"].str.title()

products["Sub_Category"] = products["Sub_Category"].str.title()

products["Cost_Price"] = products["Cost_Price"].fillna(0)

# ==========================================
# Sales Cleaning
# ==========================================

sales.drop_duplicates(inplace=True)

sales["Order_Date"] = pd.to_datetime(
    sales["Order_Date"]
)

sales["Quantity"] = sales["Quantity"].fillna(1)

sales["Sales"] = sales["Sales"].fillna(0)

sales["Profit"] = sales["Profit"].fillna(0)

sales["Discount"] = sales["Discount"].fillna(0)

# ==========================================
# Feature Engineering
# ==========================================

sales["Month"] = sales["Order_Date"].dt.month_name()

sales["Year"] = sales["Order_Date"].dt.year

sales["Quarter"] = sales["Order_Date"].dt.quarter

sales["Profit_Margin"] = np.round(

    (sales["Profit"] / sales["Sales"]) * 100,

    2

)

sales["Profit_Margin"] = sales["Profit_Margin"].replace(

    np.inf,

    0

)

sales["Profit_Margin"] = sales["Profit_Margin"].fillna(0)

# ==========================================
# Relationship Validation
# ==========================================

invalid_customers = sales[
    ~sales["Customer_ID"].isin(customers["Customer_ID"])
]

invalid_products = sales[
    ~sales["Product_ID"].isin(products["Product_ID"])
]

print()

print("Invalid Customers :", len(invalid_customers))

print("Invalid Products  :", len(invalid_products))

# ==========================================
# Save Cleaned Data
# ==========================================

customers.to_csv(

    CLEAN_PATH + "customers_clean.csv",

    index=False

)

products.to_csv(

    CLEAN_PATH + "products_clean.csv",

    index=False

)

sales.to_csv(

    CLEAN_PATH + "sales_clean.csv",

    index=False

)

print()

print("=" * 50)

print("Cleaning Completed Successfully")

print("=" * 50)

print()

print("Customers :", customers.shape)

print("Products  :", products.shape)

print("Sales     :", sales.shape)