Zepto Dataset SQL Analysis
📌 Project Overview
This project explores and analyzes the Zepto product dataset using PostgreSQL in pgAdmin4. The dataset includes product details such as SKU ID, Category, Name, MRP, Discount Percentage, Available Quantity, Selling Price, Weight, and stock availability.
Goals of the project:
•	Explore the dataset
•	Perform data cleaning (handling nulls, zero values, conversions)
•	Run analytical queries to extract business insights
________________________________________
🗂️ Dataset Structure
The zepto table contains the following columns:
•	sku_id → Unique product ID
•	category → Product category
•	name → Product name
•	mrp → Maximum Retail Price
•	discountPercent → Discount percentage offered
•	availableQuantity → Stock available
•	discountedSellingPrice → Price after discount
•	weightInGms → Weight of the product (grams)
•	outOfStock → Boolean (True/False)
•	quantity → Quantity in units
________________________________________
🔍 Data Exploration
•	Checked row count and viewed sample records
•	Identified NULL values across critical columns
•	Listed all distinct product categories and their counts
•	Analyzed in-stock vs out-of-stock product counts
•	Found duplicate product names with multiple SKUs
________________________________________
🧹 Data Cleaning
•	Removed products with MRP = 0
•	Converted MRP and discountedSellingPrice from paise to rupees
•	Ensured price consistency and checked for anomalies
________________________________________
📊 Analysis Queries
1. Discount & Pricing Analysis
•	Top 10 best-value products (highest discount percentage)
•	High MRP products that are out of stock
•	Products with MRP > ₹500 and discount < 10%
•	Price per gram calculation for products above 100g
2. Category-Level Insights
•	Estimated revenue per category (selling price × available quantity)
•	Top 5 categories with highest average discount %
•	Total inventory weight per category
3. Product Segmentation
•	Classified products into:
o	Low (<1kg)
o	Medium (<5kg)
o	Bulk (≥5kg)
________________________________________
🚀 Key Insights
•	Identified products with unrealistic pricing (MRP = 0)
•	Found categories with highest revenue contribution
•	Highlighted best-value products based on discount per gram
•	Segmented inventory into weight categories to understand stock distribution
________________________________________
🛠️ Tech Stack
•	PostgreSQL → SQL queries & analysis
•	pgAdmin4 → Database management & execution

