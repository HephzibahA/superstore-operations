
# Superstore Operations Dashboard

A complete data pipeline and interactive Tableau workbook analyzing regional delivery efficiency, discount profitability, and customer retention profiles.

---

# Dashboard Preview
<img width="1041" height="764" alt="superstore-dashboard" src="https://github.com/user-attachments/assets/6db186c3-d5a0-4dfd-aeb2-3274631e84f9" />

### 📊 Project Overview


This project takes raw transactional retail data, cleans and aggregates it using SQL, and models it into a high-performance Tableau dashboard to monitor operational logistics, promotional pricing risks, and customer base composition.

# Data Pipeline & Prep Work

# Extraction & Querying (SQL)

Queried raw transactional databases to extract operational performance metrics, including regional shipping speeds, discount structures, and customer purchase histories.

Performed initial aggregations to transform high-volume order logs into structured summaries, categorizing discounts into distinct bands (no_discount, low_discount, high_discount, clearance) and calculating transaction intervals.

# Data Cleaning & Auditing (SQL)

Handled data profiling directly in SQL to identify and filter out null values, standardize date-time fields, and correct regional grouping anomalies.

Wrote SQL validation queries to cross-verify calculated delivery timelines (calculating the datediff between shipping and order dates) and customer segmentations before exporting the clean dataset to Tableau.

# Data Modeling (Tableau)
Resolved schema discrepancies between shipping logs, promotional transactions, and customer master records.

Established a solid relationship model to stitch together transactional shipping lines with customer-level purchase counts on the fly.

# Key Visualizations
Delivery Timeline By Region: Horizontal bar chart displaying average delivery transit times across global regions, immediately highlighting shipping inefficiencies (e.g., Canada and Central Asia averaging longer delivery timelines).

Discount Performance By Region: Multi-tiered bar chart analyzing total profitability across four key promotional bands (no_discount, low_discount, high_discount, and clearance) by region, with interactive filters for shipping modes to isolate cost-heavy operations.

Customer Retention Profile: Dynamic breakdown (pie chart) illustrating the proportion of single-purchase users (highlighting 426 One-Time Customers) against repeat buyers to evaluate long-term brand retention.
