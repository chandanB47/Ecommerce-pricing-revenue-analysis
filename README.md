# Ecommerce-pricing-revenue-analysis  📊
End-to-end E-commerce pricing &amp; revenue analysis using SQL and Power BI


# E-commerce Pricing & Revenue Analysis

## 📌 Project Overview
This project presents an **end-to-end analysis of e-commerce pricing and revenue performance** using **SQL** for data analysis and **Power BI** for interactive dashboarding.  
The objective is to identify **key revenue drivers**, **pricing effectiveness**, **customer behavior**, and **geographic performance** to support data-driven business decisions.

---

## 🛠 Tools & Technologies
- **SQL (MySQL)** – Data cleaning, transformation, aggregation, and advanced analytics  
- **Power BI** – Interactive dashboards and business storytelling  
- **CSV Dataset** – Indian e-commerce pricing & revenue data (36 months)

---

## 📂 Dataset Summary
- Time Period: **36 months**
- Granularity: **Order-level**
- Key Dimensions:
  - Order Date
  - Product Category
  - State & Zone
  - Customer Age & Gender
  - Sales Event
  - Brand Type
- Key Measures:
  - Revenue
  - Units Sold
  - Discount %
  - Inventory Pressure
  - Competition Intensity

---

## 🧹 Data Preparation (SQL)
Key preprocessing steps:
- Converted `order_date` from text to DATE format
- Validated record counts and date ranges
- Created derived fields for:
  - Age groups
  - Discount bands
  - Month-over-Month growth
- Ensured clean aggregation using `DISTINCT order_id`

---

## 🔍 SQL Analysis Performed

### 1️⃣ Business Performance Overview
- Total revenue & total orders
- Revenue and order volume by year
- Average Revenue per Order (ARPO)

### 2️⃣ Product & Pricing Analysis
- Revenue by product category
- Category revenue contribution (% of total)
- Price sensitivity by discount band
- Brand comparison: Mass vs Premium

### 3️⃣ Customer & Demographic Insights
- Revenue by customer age group
- Revenue split by gender
- High-value customer segments identification

### 4️⃣ Geographic Analysis
- Revenue by state
- Revenue by zone
- State ranking within each zone

### 5️⃣ Sales Event & Inventory Insights
- Revenue comparison: Normal vs Festival sales
- Inventory pressure impact on revenue
- Competition intensity vs discount behavior

### 6️⃣ Time-Series Analysis
- Monthly revenue trend
- Month-over-Month (MoM) revenue growth
- Rolling revenue insights (used in Power BI)

---

## 📊 Power BI Dashboards

### 🔹 Executive Overview
- Total Revenue, Orders & ARPO
- MoM Revenue Growth
- Revenue Share by Category
- Monthly Revenue Trend with Rolling 3-Month Average
- Sales Event Contribution

### 🔹 Pricing & Geographic Insights
- Discount vs Revenue & Order Value (Scatter Plot)
- Top Revenue-Generating States
- Top Revenue-Generating Categories
- Geographic Revenue Distribution by State & Zone

### 🔹 Customer & Demand Insights
- Revenue by Age Group
- Revenue Split by Gender
- Inventory Pressure Impact on Revenue
- Discount vs Revenue by Sales Event

## 📊 Power BI Dashboards

### 📌 Executive Overview
![Executive Overview](https://raw.githubusercontent.com/chandanB47/Ecommerce-pricing-revenue-analysis/main/Executive%20Overview.png)

### 💰 Executive Pricing Overview
![Executive Pricing Overview](https://raw.githubusercontent.com/chandanB47/Ecommerce-pricing-revenue-analysis/main/Executive%20Pricing%20Overview.png)

### 👥 Customer, Pricing & Demand Insights
![Customer Pricing Demand Insights](https://raw.githubusercontent.com/chandanB47/Ecommerce-pricing-revenue-analysis/main/Customer%2C%20Pricing%20%26%20Demand%20Insights.png)

---

## 📈 Key Business Insights
- **Low inventory pressure accounts for over 70% of total revenue**, highlighting availability as a critical demand driver.
- **Customers aged 25–34 contribute the highest revenue**, making them the core monetizable segment.
- **Revenue is evenly split across genders**, indicating neutral pricing and broad product appeal.
- **Premium Lifestyle and Electronics categories dominate revenue**, driving the majority of sales.
- **Festival sales require higher discounts**, but normal sales periods generate stronger overall revenue.
- **Western and Northern zones lead geographically**, with Delhi NCR, Maharashtra, and Karnataka as top-performing states.

---

## ✅ Conclusion

This project demonstrates a full-cycle analytics workflow—from raw transactional data to executive-ready insights. By combining SQL-based data preparation and advanced analytical queries with interactive Power BI dashboards, the analysis uncovers how pricing strategy, inventory availability, customer demographics, and geography collectively drive revenue performance.

The insights highlight that revenue growth is primarily influenced by product mix, inventory pressure, and targeted customer segments rather than aggressive discounting alone. The dashboards are designed to support strategic decision-making across pricing optimization, demand planning, inventory management, and regional expansion.

Overall, this project reflects real-world business analytics practices and showcases the ability to translate complex data into actionable insights for stakeholders.


---




