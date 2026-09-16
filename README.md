# Manufacturing ESG Reporting & Analytics

## 📌 Project Overview

This project presents an end-to-end **Manufacturing ESG Reporting & Analytics solution** developed to analyze environmental sustainability performance across manufacturing facilities.

The project focuses on energy consumption, greenhouse gas emissions, water usage, waste generation, recycling performance, supplier spending, and facility-level ESG benchmarking.

The objective is to transform raw and messy manufacturing data into meaningful business insights using **Python, SQL, and Power BI**.

---

## 🎯 Business Objectives

- Monitor total energy consumption across facilities.
- Analyze Scope 1 and Scope 2 greenhouse gas emissions.
- Measure energy intensity and emissions intensity.
- Track water consumption and waste generation.
- Calculate recycling performance.
- Compare ESG performance across manufacturing facilities.
- Identify potential energy-related outliers and data-quality issues.
- Build an interactive ESG reporting dashboard for management.

---

## 🛠️ Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and preprocessing |
| Pandas | Data manipulation and data-quality checks |
| NumPy | Numerical calculations |
| Matplotlib | Exploratory data analysis |
| MySQL | Data storage and SQL analysis |
| Power BI | Interactive ESG dashboard development |
| DAX | KPI calculations and business measures |
| GitHub | Project version control and documentation |

---

## 📂 Project Structure

```text
Manufacturing_ESG_Reporting_Analytics
│
├── BI
│   └── Manufacturing_ESG_Reporting_Analytics.pbix
│
├── Pandas
│   └── Python data-cleaning and preprocessing files
│
├── Raw & Cleaned
│   └── Raw and cleaned ESG datasets
│
├── Screenshots
│   └── Dashboard screenshots
│
├── SQL
│   └── SQL scripts and analytical queries
│
├── Manufacturing_ESG_Reporting_Analytics.pdf
│
└── README.md
```

---

## 📊 Dataset Overview

The dataset contains manufacturing ESG records covering:

- Facility information
- Facility location
- Reporting month
- Supplier information
- Supplier type
- Energy consumption
- Water consumption
- Production units
- Waste generation
- Recycled waste
- Scope 1 emissions
- Scope 2 emissions
- Supplier spending

The dataset initially contained approximately **20,000 records** and required data cleaning and validation before analysis.

---

## 🧹 Data Cleaning and Preparation

The data-cleaning process included:

- Handling missing values
- Removing duplicate records
- Converting date columns into the correct format
- Standardizing energy units
- Creating standardized energy-consumption values
- Calculating energy intensity
- Identifying potential energy outliers
- Performing waste-logic validation checks
- Preparing the cleaned dataset for SQL and Power BI analysis

---

## 📈 Power BI Dashboard Pages

### 1. ESG Executive Overview

This page provides a high-level summary of manufacturing ESG performance.

Key metrics include:

- Total Energy Consumption
- Total Emissions
- Total Production
- Recycling Rate
- Monthly Emissions Trends
- Facility-Level Energy Intensity

---

### 2. Energy & Emissions Analysis

This page focuses on energy consumption and greenhouse gas emissions.

Key metrics and visuals include:

- Scope 1 Emissions
- Scope 2 Emissions
- Total Emissions
- Energy Intensity
- Scope 1 vs. Scope 2 Emissions by Facility
- Energy Consumption by Facility

---

### 3. Water & Waste Management

This page analyzes water consumption and waste-management performance.

Key metrics and visuals include:

- Total Water Consumption
- Total Waste Generated
- Recycled Waste
- Recycling Rate
- Water Consumption by Facility
- Waste Generation vs. Recycled Waste

---

### 4. Facility Performance

This page compares sustainability performance across manufacturing facilities.

Key metrics and visuals include:

- Total Production
- Energy Intensity
- Average Energy Intensity
- Emissions Intensity
- Facility-Level Energy Intensity Benchmarking
- Facility-Level Emissions Intensity Benchmarking

---

## 📌 Key ESG Metrics

### Energy Intensity

Energy consumed per unit of production.

```text
Energy Intensity = Total Energy Consumption / Total Production
```

### Emissions Intensity

Greenhouse gas emissions per unit of production.

```text
Emissions Intensity = Total Emissions / Total Production
```

### Recycling Rate

The percentage of total waste that has been recycled.

```text
Recycling Rate = Recycled Waste / Total Waste × 100
```

### Total Emissions

```text
Total Emissions = Scope 1 Emissions + Scope 2 Emissions
```

---

## 💡 Business Value

This dashboard can help sustainability and business teams to:

- Monitor environmental performance.
- Identify facilities with higher energy intensity.
- Track emissions trends.
- Evaluate waste-recycling performance.
- Support ESG reporting activities.
- Improve data-driven sustainability decision-making.
- Compare facility-level performance using standardized KPIs.

---

## 🚀 Future Improvements

Potential future enhancements include:

- Adding Scope 3 emissions analysis.
- Including monthly ESG targets and actual performance.
- Adding automated data-refresh functionality.
- Introducing ESG performance alerts.
- Adding supplier-level sustainability risk analysis.
- Publishing the dashboard through Power BI Service.
- Connecting the dashboard to a cloud data warehouse.
- Adding automated data-quality reports.

---

## 👤 Author

**Navin **
---
