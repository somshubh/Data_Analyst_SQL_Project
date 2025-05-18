USE [Super_Store_Data_Analysis];

-- 1. Data Cleaning
/*
-- Null value Handle
select * from Superstore;

select COUNT(*) as Null_Date_Count from Superstore where [Order Date] is null;
select COUNT(*) as total_count from Superstore;
-- replace null value of `Order Date` column 5 days before of `ship date`

begin transaction
UPDATE Superstore set [Order Date] = ISNULL([Order Date], DATEADD(day, -5, [Ship Date]))
where [Order Date] is null;

--commit;

-- Add new column `Order Year`
 alter table superstore add Order_Year nvarchar(10)
 update Superstore set order_year  = YEAR([Order Date])

 -- Duplicate check
 --  select [order id], [Product id] from Superstore group by [order id], [Product id] having COUNT(*) >1
--with duplicate_Record as(
--  Select *,
--  COUNT(*) over(PARTITION BY [order id], [Product id]) as dup_cnt
--  from Superstore
--)
--delete from superstore where [Order ID] in (select [order id] from duplicate_Record where dup_cnt > 1)
*/
-- 2. Exploratory Data Analysis (EDA)
select * from Superstore;
--    a. Total Sales, Profit, and Quantity

 select round(SUM(sales),2) as "Total Sales", SUM(Quantity) as "Total Quantity", round(SUM(profit), 2) "Total Profit" 
 from Superstore;

--    b. Monthly Sales Trend
--select distinct(YEAR([Order Date])) from Superstore;
select year, MONTH, Total_Sales,
LAG(total_sales,1) over(partition by year order by month) as prev_month_sales,
isnull(round((Total_Sales - LAG(total_sales,1) over(partition by year order by month)) / Total_Sales * 100, 2), '') as "Sales VS PSales %"
from(
Select year([order Date]) "Year", month([order Date]) "Month", SUM([Sales]) as Total_Sales from Superstore 
group by year([order Date]), month([order Date])
) a;

--    c. Top 5 Best-Selling Products

-- select distinct [product Name] from Superstore;

select Top 5 [product Name], round(SUM(sales), 0) as total_sales from Superstore
group by [Product Name]
order by 2 desc;

--    d. Profit by Region

select [Region], round(SUM(profit), 2) Total_Profit from Superstore
group by [Region]
order by 2 desc;

-- 3. Customer Segmentation

select distinct [segment] from Superstore;

select [segment], round(SUM(sales), 2) as total_sale
from Superstore group by [Segment]
order by 2 desc;


-- 4. Discount Impact on Profit

select distinct [discount] from Superstore;

select [discount],  round(SUM(Sales), 2) as total_Sales, round(SUM(profit), 2) as total_profit from Superstore
group by Discount
order by 1, 3 desc;

-- 5. KPIs and Business Insights

--     a. Monthly Growth

with monthly_growth as(
 select 
 YEAR([order date]) as year,
 MONTH([order date]) as Month,
 round(SUM(sales) over(partition by year([order date]) order by year([order date]), MONTH([order date])), 2) as Sales_Growth
 from Superstore
 )
 select distinct * from monthly_growth order by year, month;

 --  b. Region-wise performance

select [Region], round(SUM(Sales), 2) Total_Sales from Superstore
group by [Region]
order by 2 desc;

--   c. Top Customers

--  Respect to Sales
select Top 10 [Customer Name], round(SUM(sales), 0) as total_sales from Superstore
group by [Customer Name]
order by 2 desc;

--  Respect to Profit
select Top 10 [Customer Name], round(SUM(Profit), 0) as total_Profit from Superstore
group by [Customer Name]
order by 2 desc;

-- In this top 10 customers which customers are present in top 10 list as per sales but not in Profit
--Then those Customers are not makes profitable sales..
 
 --    d. Products with loss despite high sales

 select * from Superstore;

select [product Name], round(SUM(sales), 0) as total_sales, round(SUM(Profit), 0) as total_Profit from Superstore
group by [Product Name] having round(SUM(Profit), 0) < 0
order by 2 desc;