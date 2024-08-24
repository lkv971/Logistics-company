# Logistics Data Analytics Repository

## Overview
This repository is dedicated to the data analytics of a company's freight operations. It encompasses detailed information about drivers, customers, costs, and vehicles. The repository includes T-SQL scripts, a database SQL file, Power BI reports, a transformation notebook, and a data pipeline that copies data to a lakehouse on Microsoft Fabric for comprehensive logistics data analysis.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Detailed Description](#detailed-description)
- [Database and Tools](#database-and-tools)
- [How to Use](#how-to-use)

## Repository Structure
The repository is organized into the following folders and files:

### 1. RDBMS Scripts
This folder contains all SQL scripts necessary for database setup and maintenance:
- **alter_tables**: Scripts for altering existing tables.
- **views**: SQL views for data aggregation and simplification.
- **triggers**: Triggers to automate database tasks.
- **functions**: Custom functions for specific data operations.
- **procedures**: Stored procedures for complex data processing.
- **create_db_tables**: Scripts to create initial database tables.
- **insert_data**: Scripts to insert raw data into tables.
- **indexes**: Scripts for creating indexes to optimize database performance.

### 2. Database
This folder contains the SQL file for creating the database:
- **logistics_database.sql**: Complete SQL script to create and populate the logistics database.

### 3. Raw Data
This folder includes the raw data used for analysis:
- **costs**: Data related to freight costs.
- **freight**: Freight details and records.
- **vehicles**: Information about the vehicles used in operations.
- **drivers**: Details about the drivers.
- **customers**: Customer data.

### 4. Power BI Reports and Dashboards
This folder contains Power BI reports and dashboards for data visualization:
- **Logistics Analytics.pbix**: The Power BI report file for logistics analysis.
- **Logistics Analytics.pdf**: A PDF version of the logistics analysis report.
- **Screenshots**: Visual snapshots of the Power BI dashboards:
  - **July 2019 Financial Dashboard**: A financial performance overview for July 2019.
  - **Semi-Trailers Performance 2019 Dashboard**: Performance analysis of semi-trailers for 2019.

### 5. Schema
This folder contains schema-related documentation and diagrams:
- **Snowflake Schema Diagram**: Diagram representing the snowflake schema used for organizing the data.

### 6. Database Maintenance Scripts
This folder includes SQL scripts used for automating routine database tasks:
- **daily_differential_backup_logistics.sql**: Script for performing daily differential backups of the logistics database.
- **daily_insert_logistics_freight.sql**: Script for daily data inserts into the freight-related tables.
- **monthly_full_backup_logistics.sql**: Script for performing monthly full backups of the logistics database.
- **monthly_insert_logistics_costs.sql**: Script for monthly data inserts into the costs-related tables.

### 7. ELT Pipeline Diagrams
This folder contains screenshots and diagrams of data pipelines:
- **logistics_pipeline.png**: A diagram showing the ELT data pipeline that moves data from SQL Server to the Lakehouse in Microsoft Fabric.

### 8. ELT Transformation Notebooks
This folder contains notebooks used for data transformation:
- **transformation_logistics.ipynb**: Notebook used for transforming the data within Microsoft Fabric.

## Detailed Description
This repository provides a complete framework for analyzing logistics operations, from raw data ingestion to advanced data visualization. It follows an **ELT (Extract, Load, Transform)** process, where data is first extracted from SQL Server, loaded into a Lakehouse in Microsoft Fabric, and then transformed using PySpark notebooks. The repository includes:

- **Database Management**: SQL scripts for creating and maintaining database structures, including tables, views, triggers, and functions.
- **Data Ingestion and ELT**: Scripts to load raw data related to freight operations into a Lakehouse, followed by transformation using PySpark notebooks.
- **Data Analysis**: Power BI reports that offer insights into the operational and financial performance of the logistics company.
- **Visualization**: Dashboards that provide an at-a-glance view of key performance indicators (KPIs) and metrics.
- **Data Transformation**: A notebook for transforming raw data before analysis, integrated into a data pipeline on Microsoft Fabric.

## Database and Tools

### Database
The database for this project is designed using SQL Server, with scripts provided to create and populate the necessary tables and structures for logistics data analysis.

### Tools Used
- **SQL Server Management Studio (SSMS)**: Used for managing the SQL Server database, executing T-SQL scripts, and performing database maintenance tasks.
- **Power BI**: Utilized for creating interactive and visually appealing reports and dashboards, providing insights into logistics data.
- **Microsoft Fabric (Synapse Data Engineering)**: Used to create a data pipeline and transform the data in a Lakehouse.

## How to Use

### 1. Set Up the Database
**Prerequisites**:
- SQL Server 2016 or higher.
- SQL Server Management Studio (SSMS) installed.
- Power BI Desktop installed.

**Instructions**:
- Open the `logistics_database.sql` file in SQL Server Management Studio (SSMS).
- Execute the script to create the database, tables, and insert the data.

### 2. Database Maintenance
- Utilize the scripts in `alter_tables`, `views`, `triggers`, `functions`, `procedures`, and `indexes` to maintain and optimize the database.

### 3. Data Ingestion and ELT Process
- Use the ELT pipeline as described in the `ELT Pipeline Diagrams` folder to load data into the Lakehouse.
- Use `transformation_logistics.ipynb` in Microsoft Fabric to transform the data after loading.

### 4. Data Analysis
- Open the `Logistics Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
- Refer to the `Logistics Analytics.pdf` for a static, printable version of the report.

### 5. Visualizations
- Review the screenshots in the `Screenshots` folder to get a quick overview of the financial and performance dashboards as well as the pipeline flow.

### 6. Database Maintenance Scripts
- **Daily Differential Backup**: The `daily_differential_backup_logistics.sql` script automates daily differential backups, capturing changes since the last full backup.
- **Daily Data Insert**: The `daily_insert_logistics_freight.sql` script automates the daily insertion of freight-related data into the relevant tables.
- **Monthly Full Backup**: The `monthly_full_backup_logistics.sql` script creates a full backup of the database each month, preserving the entire database state.
- **Monthly Data Insert**: The `monthly_insert_logistics_costs.sql` script automates the insertion of cost-related data into the relevant tables on a monthly basis.

