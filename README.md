# 💳 Credit Card Portfolio Performance & Growth Analysis  
### (SQL Server + Power BI End-to-End Analytics Project)

---

## 📊 Project Overview

This project is an end-to-end credit card analytics solution built using **Microsoft SQL Server and Power BI**, starting from raw CSV ingestion to a structured **4-page interactive Power BI analytical report**.

The objective was to simulate a real-world banking analytics scenario by designing a reporting solution that supports:

- Executive performance monitoring  
- Product portfolio evaluation  
- Market and customer behavior analysis  
- Time-based growth intelligence  

The project demonstrates the integration of SQL-based analytics with business-focused visualization.

---

## 📥 Dataset

**Source:** Kaggle  
https://www.kaggle.com/datasets/thedevastator/analyzing-credit-card-spending-habits-in-india  

The dataset consists of transaction-level credit card data where each row represents a single transaction.

### Key Attributes

- `transaction_id` – Unique identifier (Primary Key)  
- `transaction_date` – Date of transaction  
- `city` – Transaction location  
- `card_type` – Card category (Gold, Silver, Platinum, Signature)  
- `exp_type` – Expense category  
- `amount` – Transaction amount  
- `gender` – Customer gender  

**Grain:** One row per transaction  
**Time Coverage:** Multi-year transactional history  

---

# 🗄️ SQL Layer (Data Ingestion & Analytics)

## 📥 Data Ingestion

- CSV dataset imported directly into SQL Server using **Bulk Insert**
- Data validation and null checks performed
- Primary key constraint enforced on `transaction_id`
- Cleaned transaction table structured at transaction-level granularity

---

## 🏗 SQL Analytics & Business Logic

Business logic and performance calculations were implemented in SQL using:

- KPI aggregations (Total Spend, Total Transactions)
- Monthly performance analysis
- City-wise spend contribution
- Card type segmentation
- Gender-based segmentation
- Ranking logic using window functions
- Month-over-Month (MoM) growth calculations
- Advanced analytical queries using CTEs and partition functions

All core metrics were validated in SQL before being consumed in Power BI.

---

# 📊 Power BI Visualization Layer

SQL Server was connected to Power BI using **Import Mode**.

A structured **4-page analytical report** was developed to enable interactive and business-focused insights.

---

## 🏗 Report Structure (4 Pages)

### 1️⃣ Executive Performance Overview

- Total Spend  
- Total Transactions  
- Average Transaction Value  
- Month-over-Month (MoM) Growth %  
- Monthly Spend Trend  
- Drill-through to detailed growth analysis  

**Purpose:**  
Provides a high-level snapshot of overall credit card business performance.

---

### 2️⃣ Market & Transaction Analysis

- Dynamic Top N Cities (Parameter Driven)
- Daily Transaction Value vs Monthly Benchmark
- Conditional formatting (Above/Below Average logic)
- Spend Distribution by Gender

**Purpose:**  
Identifies geographic revenue concentration, daily volatility, and behavioral patterns.

---

### 3️⃣ Card Portfolio Analysis

- Total Spend by Card Type
- Average Transaction Value by Card Type
- Dynamic multi-selection title using `CONCATENATEX()`

**Purpose:**  
Evaluates product positioning (premium vs mass usage) and portfolio contribution.

---

### 4️⃣ Growth Deep Dive (Drill-Through Page)

- MoM Growth Table
- YoY Growth Trend
- Running Total (Cumulative Revenue)
- Rolling 3-Month Performance

**Purpose:**  
Enables root cause analysis of growth fluctuations and long-term trend validation.

---

# 🔍 Key Insights

- A small number of cities contribute a disproportionately large share of total credit card spend.
- Premium card types (e.g., Platinum, Signature) show higher average transaction values despite lower transaction volumes.
- Certain expense categories consistently dominate spending patterns.
- Gender-based segmentation highlights differences in spending behavior and transaction frequency.
- Rolling metrics smooth short-term volatility and reveal underlying growth momentum.

---

# 🧠 Key DAX Concepts Used

- Context transition using `CALCULATE()`
- Time intelligence with `SAMEPERIODLASTYEAR()` and `DATESINPERIOD()`
- Iterators such as `AVERAGEX()`
- Ranking using `RANKX()`
- Filter context manipulation with `ALL()` and `ALLSELECTED()`
- Dynamic selections using `SELECTEDVALUE()`
- Multi-value dynamic titles using `CONCATENATEX()`
- Conditional formatting using dynamic color measures

---

# 🏛 Data Modeling Approach

- Custom Date Table (Marked as Date Table)
- One-to-Many Relationship (Calendar → Transactions)
- Separate Measures Table for organized DAX logic
- Star Schema Modeling
- Parameter Table for Dynamic Top N Analysis

---

# 🛠 Tools & Technologies

- Microsoft SQL Server  
- Power BI Desktop  
- DAX  
- Power Query  
- CSV Dataset  
- GitHub  

---

## 📁 Repository Structure

- **Credit_Card_Portfolio_Analysis.pbix**  
  4-page Power BI analytical report.

- **credit_card_transactions.csv**  
  Raw dataset downloaded from Kaggle.

- **Report_Screenshots/**  
  Contains project screenshots including:
  - Power Query data preparation  
  - Calendar table creation  
  - Data model & relationships  
  - Measures table setup  
  - Executive Performance Overview page  
  - Market & Transaction Analysis page  
  - Card Portfolio Analysis page  
  - Growth Deep Dive (Drill-Through) page  

- **README.md**  
  Project documentation.


# 🎯 Business Value

This project demonstrates how structured SQL modeling combined with a multi-page Power BI report can transform raw transaction data into actionable insights for:

- Executive performance tracking  
- Product portfolio optimization  
- Geographic revenue analysis  
- Customer segmentation insights  
- Growth trend evaluation  

---


**Rahul Khare**  


