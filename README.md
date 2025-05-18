## 📦 Repository Overview:
- *This repository showcases my SQL skills through an end-to-end analysis of datasets. All the projects are designed to demonstrate practical data analyst capabilities such as:*
  - Data cleaning and preprocessing
  - Writing optimized SQL queries
  - **Performing exploratory data analysis (EDA)**
  - Deriving key business **insights and KPIs**

  - **💡 Goal:** Simulate a real-world scenario where a business analyst or data analyst would extract insights from sales data to help stakeholders make informed decisions.
  - **🛠️ Tools & Technologies:**
       - SQL Server
       - Microsoft SQL Server Management Studio (SSMS)
---
# 📊 Superstore Data Analysis with SQL

This repository contains an end-to-end SQL-based analysis of the **Superstore** dataset. The project covers data cleaning, exploratory data analysis (EDA), customer segmentation, and business insights to assist decision-makers in understanding sales, profits, customer behavior, and more.

---
## 📁 Database Used

[SuperStore Dataset](https://github.com/somshubh/Data_Analyst_SQL_Project/blob/main/SuperStore_Sales_Analysis/Superstore.xlsx)

---

## 🧼 1. Data Cleaning

- ✅ **Null Handling**: Replaced null values in `Order Date` by setting them 5 days before the `Ship Date`.
- 📅 **New Column**: Added `Order_Year` column for time-based grouping.
- 🔁 **Duplicate Detection**: Logic included to identify and remove duplicate entries based on `Order ID` and `Product ID`.

---

## 📊 2. Exploratory Data Analysis (EDA)

### a. Total Sales, Profit, and Quantity
Summarizes total sales, profit, and items sold across the dataset.

### b. 📈 Monthly Sales Trend
Identifies month-on-month trends in sales including percent change from the previous month.

### c. 🛍 Top 5 Best-Selling Products
Ranks products based on total sales.

### d. 💰 Profit by Region
Shows profit contribution from each region.

---

## 👥 3. Customer Segmentation

Grouped customers by their segment:
- Consumer
- Corporate
- Home Office

Ranks them based on total sales contribution.

---

## 🔻 4. Discount Impact on Profit

Analyzed the correlation between discount rates and their impact on:
- Total Sales
- Total Profit

Helps in understanding how discounting strategies affect profitability.

---

## 📌 5. KPIs and Business Insights

### a. 📅 Monthly Growth
Shows cumulative monthly sales growth to understand business performance over time.

### b. 🌍 Region-wise Performance
Identifies which region performs best in terms of total sales.

### c. 🧑‍💼 Top Customers
- Top 10 customers based on **Sales**
- Top 10 customers based on **Profit**
- Insights on customers who generate high sales but low or negative profit.

### d. ⚠️ Products with High Sales but Low/Negative Profit
Lists products that, despite having high sales, result in losses — useful for cost optimization and product strategy.

---

## 📌 Key Takeaways

- The **Corporate** segment yields the highest revenue.
- Some **products** generate losses even with high sales—need further investigation.
- Not all top-selling **customers** are profitable—discount strategies may need adjustment.

---

## 🛠️ Tools Used

- **SQL Server**
- **Superstore Dataset**
- **Microsoft SQL Server Management Studio (SSMS)** or any preferred SQL IDE

---

## 🚀 Getting Started

1. Import the `Superstore` dataset into your SQL Server.
2. Execute the `Superstore_Analysis.sql` script.
3. Explore and modify queries based on your business needs.

---

## 📬 Contact

**Somshubhra Giri**  
📍 Kolkata, India  
🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/somshubhra-giri-5a2666198)  
✉️ Email: somshubhra.1999@gmail.com


