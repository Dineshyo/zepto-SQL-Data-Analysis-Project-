create database zepto_project;

use zepto_project;

CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(120) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock ENUM('TRUE','FALSE'),
    quantity INT
);

-- data exploration 

-- count of rows
SELECT COUNT(*) FROM zepto;

-- sample data
SELECT * FROM zepto limit 10;

-- null values
SELECT * from zepto WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products n stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
from zepto 
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) as 'Number of SKUs'
FROM zepto
GROUP BY name
HAVING count(sku_id)
order by count(sku_id) desc;

-- data cleaning

-- products with price = 0
select * from zepto 
where mrp = 0 
or discountSellingPrice = 0;

delete from zepto 
where mrp = 0;

-- convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

select mrp,discountSellingPrice from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name,mrp,discountPercent 
from zepto 
order by discountPercent desc
limit 10;

desc zepto;

-- Q2. What are the products with high mrp but out of stock.
select distinct name,mrp
from zepto
where outOfStock is true 
and mrp > 300
order by mrp desc;

-- Q3. Calculate estimated revenue for each category
SELECT category,
       SUM(discountSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where mrp is greater than 500 and discount is less than 10%
select distinct name, mrp, discountPercent 
from zepto 
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage
select category,
round(avg (discountPercent),2) as avg_discount 
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name,weightInGms,discountSellingPrice,
round(DiscountsellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

-- Q7. Group the products into categories like low, medium, bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'LOW'
     when weightINGms < 5000 then 'MEDIUM'
     else 'BULK'
     end as weight_category
from zepto
order by weight_category desc ;
    
-- Q8. what is the local inventory weight per category.
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;

select * from zepto limit 10;