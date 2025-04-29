# 📊 Ecommerce Funnel Analysis Project

## Overview
In this project, I analyzed real world ecommerce user behavior data from Kaggle (https://www.kaggle.com/datasets/mkechinov/ecommerce-behavior-data-from-multi-category-store) to understand the customer journey through a traditional online sales funnel, from product views, to cart additions, to final purchases.  
The project simulates a real company analysis pipeline by connecting **SQL Server** and **Power BI** without manual exports.

I used **SQL views** to organize the data transformation and **Power BI** to build a clean, insightful dashboard ready for presentation.

---

## Project Objectives
- Analyze user drop-off at each funnel stage (view → cart → purchase)
- Calculate funnel conversion rates and drop-off percentages
- Segment purchasing patterns by product category and brand
- Visualize key revenue drivers clearly and interactively

---

## Tools & Technologies

- **Kaggle** — sourced the ecommerce behavioral dataset (raw CSV files)
- **Excel** — used for initial exploratory data inspection and basic cleaning (checked for missing values, corrected datatypes)
- **SQL Server Management Studio (SSMS)** — 
  - Imported the cleaned data into a SQL Server database
  - Wrote complex SQL queries using:
    - `SELECT`, `FROM`, `WHERE` clauses for filtering
    - `GROUP BY` and `ORDER BY` for aggregations and sorting
    - `COUNT(DISTINCT ...)`, `SUM(...)` for metrics like users, revenue, and conversions
    - Common Table Expressions (CTEs) to structure funnel logic and simplify multi-step queries
    - Scalar subqueries for dynamic calculations like conversion/drop-off rates
  - Created SQL views for each major metric (funnel stages, conversion %, category/brand summaries) for seamless Power BI integration

- **Power BI Desktop**  
  - Connected directly to SQL Server using a live connection
  - Imported SQL views without exporting CSVs
  - Built an interactive dashboard showcasing funnel analysis, conversion percentages, brand/category performance
  - Designed slicers, cards, pie charts, funnel charts, bar charts, and cards for dynamic reporting

---


## Insights Uncovered
- Only **2.83%** of total users completed the full funnel (view → cart → purchase)
- The largest user drop-off occurred between **viewing a product** and **adding to cart**
- **Electronics** represented the most purchased general category (74%+ of purchases)
- **Apple** and **Samsung** dominated the total revenue by brand
- **Smartphones** were the top individual product category purchased


---

## 📈 Dashboard Preview

![screenshot](Ecommerce_Store_Funnel_Analysis/Ecommerce_Funnel_Dashboard.png)


