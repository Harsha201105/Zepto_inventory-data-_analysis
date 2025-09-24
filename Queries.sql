drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
OUToFsTOCK BOOLEAN,
quantity INTEGER
);

------------------------------------------
--data exploration

select count(*) from zepto;

--Sample data
select * from zepto 
Limit 10;

--check for null values

select * from zepto
where name is NULL
or 
mrp is NULL
or 
discountpercent is NULL
or 
availablequantity is NULL
or 
discountedsellingprice is NULL
or
weightingms is NULL
or 
outofstock is NULL
or
quantity is NULL;

--different product categories

select distinct category from zepto order by category;
SELECT COUNT(DISTINCT(category)) from zepto;

--products in stock vs out of stock
select outofStock, count(sku_id) from zepto group by outofStock;

--product names present multiple times

select name ,count(sku_id) as "Number of SKUs"
from zepto
group by name
Having count(sku_id)>1
order by count(sku_id) DESC;

--**data cleaning**--

--products with price zero

select * from zepto
where mrp =0 or discountedSellingPrice = 0;

delete from zepto where mrp=0;

--convert mrp in paise into rupees

update zepto 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;

--Find the top 10 best-value products based on the discount percentage
select distinct name, mrp, discountPercent 
from zepto 
order by discountPercent desc
limit 10;

--What are the Products with high MRP but out of stock
select distinct name, mrp,outofstock 
from zepto 
where outofstock
order by mrp desc
limit 5;

--Calculate estimated revenue for each category
select category, sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Find all products where MRP is greater than 500rps and discoutn is less than 10%

select distinct name, mrp, discountPercent
from zepto
where mrp >500 and discountPercent <10
order by mrp desc, discountPercent desc;

--Identify the top5 categories offereing the highest average discount percentage.

select category, round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;
--Find the price per gram for products above 100g and sort by best value

select distinct name, weightIngms, discountedSellingPrice, round(discountedSellingPrice/weightInGms,2) as price_per_gram 
from zepto
where weightIngms>100
order by price_per_gram
--Group the products into categories like low, Medium, Bulk

select distinct name, weightIngms,
case when weightIngms<1000 then 'low'
	 when weightIngms <5000 then 'medium'
	 else 'bulk'
     end as weight_category
from zepto;

--What is the total inventory weight per category 
select category, sum(weightIngms*availableQuantity) as total_weight
from zepto
group by category
order by total_weight;
