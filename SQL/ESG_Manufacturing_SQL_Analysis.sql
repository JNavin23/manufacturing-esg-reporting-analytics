-- ============================================================
-- Manufacturing ESG Reporting & Analytics
-- SQL Data Analysis & Business Insights
-- ============================================================

-- DATABASE CREATE
CREATE DATABASE esg_analytics;
USE esg_analytics;

-- TABLE STRUCTURE
DESCRIBE esg_data;

-- CHANGE DATA TYPE
ALTER TABLE esg_data
MODIFY COLUMN reporting_month DATE;

-- DATA PROFILING
SELECT COUNT(*) AS total_records
FROM esg_data;

-- Top 10 Rows
SELECT * 
FROM esg_data
LIMIT 10;

-- Missing Values
SELECT
    COUNT(*) AS total_records,
    COUNT(water_m3) AS water_available,
    COUNT(recycled_waste_tonnes) AS recycled_waste_available,
    COUNT(supplier_spend_inr) AS spend_available
FROM esg_data;

-- Business Queries -- 
-- Total Energy Consumption by Facility
SELECT facility_name, ROUND(SUM(energy_kwh_standardized),2) AS total_energy_kwh
FROM esg_data
GROUP BY facility_name
ORDER BY total_energy_kwh DESC;

-- Energy Used By Facility
SELECT
    facility_name,
    ROUND(AVG(energy_intensity),2) AS avg_energy_intensity
FROM esg_data
GROUP BY facility_name
ORDER BY avg_energy_intensity DESC;

-- GHG Emissions Each Facility
SELECT
    facility_name,
    ROUND(SUM(scope1_tco2e),2) AS total_scope1,
    ROUND(SUM(scope2_tco2e),2) AS total_scope2,
    ROUND(SUM(scope1_tco2e + scope2_tco2e),2) AS total_emissions
FROM esg_data
GROUP BY facility_name
ORDER BY total_emissions DESC;

-- Monthly Emissions Trend
SELECT
    reporting_month,
    ROUND(SUM(scope1_tco2e), 2) AS total_scope1,
    ROUND(SUM(scope2_tco2e), 2) AS total_scope2,
    ROUND(
        SUM(scope1_tco2e + scope2_tco2e),
        2
    ) AS total_emissions
FROM esg_data
GROUP BY reporting_month
ORDER BY reporting_month;

-- Supplier Type  Highest Spend
SELECT
    supplier_type,
    ROUND(SUM(supplier_spend_inr), 2) AS total_supplier_spend
FROM esg_data
GROUP BY supplier_type
ORDER BY total_supplier_spend DESC;

-- Facility-wise Production
SELECT
    facility_name,
    ROUND(SUM(production_units), 2) AS total_production
FROM esg_data
GROUP BY facility_name
ORDER BY total_production DESC;

-- Emissions by Supplier Type
SELECT
    supplier_type,
    ROUND(SUM(scope1_tco2e), 2) AS total_scope1,
    ROUND(SUM(scope2_tco2e), 2) AS total_scope2,
    ROUND(
        SUM(scope1_tco2e + scope2_tco2e),
        2
    ) AS total_emissions
FROM esg_data
GROUP BY supplier_type
ORDER BY total_emissions DESC;

-- Month-over-Month Emissions Change
SELECT
    reporting_month,
    ROUND(SUM(scope1_tco2e + scope2_tco2e), 2) AS total_emissions,
    ROUND(
        SUM(scope1_tco2e + scope2_tco2e)
        - LAG(SUM(scope1_tco2e + scope2_tco2e))
          OVER (ORDER BY reporting_month),
        2
    ) AS change_from_previous_month
FROM esg_data
GROUP BY reporting_month
ORDER BY reporting_month;

-- Highest Energy-Intensive Facility
SELECT
    facility_name,
    ROUND(AVG(energy_intensity), 2) AS avg_energy_intensity
FROM esg_data
GROUP BY facility_name
ORDER BY avg_energy_intensity DESC;

-- Rank Facilities by Energy Efficiency
SELECT
    facility_name,
    ROUND(AVG(energy_intensity), 2) AS avg_energy_intensity,
    RANK() OVER (
        ORDER BY AVG(energy_intensity) DESC
    ) AS energy_intensity_rank
FROM esg_data
GROUP BY facility_name
ORDER BY energy_intensity_rank;

-- Top 3 Energy-Intensive Facilities
WITH facility_energy AS(
   SELECT 
      facility_name,
      ROUND(AVG(energy_intensity),2) AS avg_energy_intensity
	FROM esg_data
    GROUP BY facility_name
),
ranked_facilities AS (
   SELECT
      facility_name,
      ROUND(avg_energy_intensity, 2) AS avg_energy_intensity,
      RANK() OVER (ORDER BY avg_energy_intensity DESC) AS energy_rank
	  FROM facility_energy
)
SELECT
    facility_name,
    avg_energy_intensity,
    energy_rank
FROM ranked_facilities
WHERE energy_rank <= 3
ORDER BY energy_rank;

-- Facility + Month Analysis
WITH monthly_facility AS (
    SELECT
       reporting_month,
        facility_name,
        AVG(energy_intensity) AS avg_energy_intensity
    FROM esg_data
    GROUP BY
        reporting_month,
        facility_name
),
ranked AS (
     SELECT
        reporting_month,
        facility_name,
        ROUND(avg_energy_intensity, 2) AS avg_energy_intensity,
        RANK() OVER (
            PARTITION BY reporting_month
            ORDER BY avg_energy_intensity DESC
        ) AS energy_rank
    FROM monthly_facility
)
SELECT
    reporting_month,
    facility_name,
    avg_energy_intensity,
    energy_rank
FROM ranked
WHERE energy_rank = 1
ORDER BY reporting_month;

-- Emissions Intensity
SELECT
    facility_name,
    ROUND(
        SUM(scope1_tco2e + scope2_tco2e)
        / SUM(production_units),
        4
    ) AS emissions_intensity
FROM esg_data
GROUP BY facility_name
ORDER BY emissions_intensity DESC;

-- Energy Category
SELECT
    CASE
        WHEN energy_intensity > 6 THEN 'High'
        WHEN energy_intensity >= 5.5 THEN 'Medium'
        ELSE 'Low'
    END AS energy_category,
    COUNT(*) AS record_count
FROM esg_data
GROUP BY
    CASE
        WHEN energy_intensity > 6 THEN 'High'
        WHEN energy_intensity >= 5.5 THEN 'Medium'
        ELSE 'Low'
    END
ORDER BY record_count DESC;

