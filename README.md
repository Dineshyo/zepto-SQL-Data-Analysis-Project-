Got it 🙂
I’ll rewrite the entire **README.md** without using bold formatting, while keeping it clean, professional, and personalized for your **Zepto SQL Data Analysis Project**.

Here’s the **final full README.md** you can directly paste into your GitHub repository:

---

# 🛒 Zepto SQL Data Analysis Project

This project analyzes Zepto's sales, products, pricing, and discounts data using MySQL.
It demonstrates database creation, data cleaning, exploratory data analysis (EDA), and advanced SQL queries to extract actionable business insights.

---

## 📌 Project Overview

The goal of this project is to simulate how data analysts in the e-commerce and retail industries work behind the scenes to analyze data using SQL.

Here’s what I focused on:

✅ Setting up a real-world e-commerce inventory database
✅ Performing Exploratory Data Analysis (EDA) to explore categories, availability, and pricing inconsistencies
✅ Cleaning messy data by handling nulls, removing invalid entries, and converting prices from paise to rupees
✅ Writing business-driven SQL queries to analyze pricing, stock, revenue, and discounts
✅ Generating insights that could drive better pricing and inventory decisions

---

## 📁 Dataset Overview

The dataset was sourced from Kaggle and represents realistic product listings from Zepto.
It mimics what you'd typically see in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit), but duplicate product names exist because the same product may have different weights, packages, or discounts — exactly how catalogs look in reality.

### Columns in the dataset:

* sku_id: Unique identifier for each product entry
* name: Product name
* category: Product category like Fruits, Snacks, Beverages, etc.
* mrp: Maximum Retail Price (originally in paise, converted to ₹)
* discountPercent: Discount applied on MRP
* discountSellingPrice: Final price after discount (in ₹)
* availableQuantity: Units available in inventory
* weightInGms: Product weight in grams
* outOfStock: Boolean flag indicating stock availability
* quantity: Number of units per package (mixed with grams for loose produce)

---

## 🔧 Project Workflow

### 1. Database and Table Creation

Created a structured table in MySQL with appropriate data types:

```sql
CREATE TABLE zepto (
  sku_id INT AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp DECIMAL(8,2),
  discountPercent DECIMAL(5,2),
  availableQuantity INT,
  discountSellingPrice DECIMAL(8,2),
  weightInGms INT,
  outOfStock BOOLEAN,
  quantity INT
);
```

---

### 2. Data Import

* Imported the dataset (zepto\_v2.csv) into MySQL
* Faced UTF-8 encoding issues, which were fixed by saving the CSV file in UTF-8 format

---

### 3. Data Exploration

* Counted the total number of records in the dataset
* Viewed a sample of the dataset to understand its structure and content
* Checked for null values across all columns
* Identified distinct product categories available in the dataset
* Compared in-stock vs out-of-stock product counts
* Detected duplicate products with multiple SKUs

---

### 4. Data Cleaning

* Removed rows where MRP or discounted selling price was zero
* Converted mrp and discountSellingPrice from paise to rupees for consistency
* Ensured no missing values in important columns

---

### 5. Business Insights

* Found top 10 best-value products based on discount percentage
* Identified high-MRP products that are currently out of stock
* Estimated potential revenue for each product category
* Filtered expensive products (MRP > ₹500) with minimal discount
* Ranked top 5 categories offering highest average discounts
* Calculated price per gram to identify value-for-money products
* Grouped products based on weight into Low, Medium, and Bulk categories
* Measured total inventory weight per product category

---

## 🛠️ How to Use This Project

### Clone the repository

```bash
git clone https://github.com/Dineshyo/zepto-SQL-Data-Analysis-Project.git
cd zepto-SQL-Data-Analysis-Project
```

### Open the main SQL file

The file `zepto_SQL_data_analysis.sql` contains:

* Table creation
* Data exploration queries
* Data cleaning queries
* Business analysis queries

### Import the dataset

* Load the `zepto_v2.csv` dataset into MySQL
* Create a database and run the SQL file
* Make sure the dataset is saved in UTF-8 format before importing

---

## 📜 License

MIT — feel free to fork, star, and use this project in your portfolio.

---

## 👨‍💻 About the Author

Hi, I’m Dinesh Babu an aspiring data analyst passionate about SQL, data analytics, and solving business problems using data.
I enjoy building projects that simulate real-world analytics scenarios and sharing them with the community.

* LinkedIn: www.linkedin.com/in/dinesh-babu-459a80371
* Email: dineshbabupersonal@gmail.com

---

## 🚀 Final Note

If you liked this project, consider giving it a ⭐ on GitHub.
---
