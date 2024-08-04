# Logistics Data Analytics Repository

## Overview

This repository is dedicated to the data analytics of a company's freight operations. It encompasses detailed information about drivers, customers, costs, and vehicles. The repository contains T-SQL scripts, a database SQL file, and a Power BI report designed for comprehensive logistics data analysis.

## Table of Contents

- [Repository Structure](#repository-structure)
- [Detailed Description](#detailed-description)
- [Database and Tools](#database-and-tools)
- [How to Use](#how-to-use)

## Repository Structure

The repository is organized into the following folders and files:

### 1. SQL Scripts

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

## Detailed Description

This repository provides a complete framework for analyzing logistics operations, from raw data ingestion to advanced data visualization. It includes:

- **Database Management**: SQL scripts for creating and maintaining database structures, including tables, views, triggers, and functions.
- **Data Ingestion**: Scripts to insert and manage raw data related to freight operations.
- **Data Analysis**: Power BI reports that offer insights into the operational and financial performance of the logistics company.
- **Visualization**: Dashboards that provide an at-a-glance view of key performance indicators (KPIs) and metrics.

## Database and Tools

### Database

The database for this project is designed using SQL Server, with scripts provided to create and populate the necessary tables and structures for logistics data analysis.

### Tools Used

- **SQL Server Management Studio (SSMS)**: Used for managing the SQL Server database, executing T-SQL scripts, and performing database maintenance tasks.
- **Power BI**: Utilized for creating interactive and visually appealing reports and dashboards, providing insights into logistics data.

## How to Use

### Set Up the Database

1. **Prerequisites**:
   - SQL Server 2016 or higher.
   - SQL Server Management Studio (SSMS) installed.
   - Power BI Desktop installed.

2. **Instructions**:
   - Open the `logistics_database.sql` file in SQL Server Management Studio (SSMS).
   - Execute the script to create the database, tables, and insert the data.

### Database Maintenance

- Utilize the scripts in `alter_tables`, `views`, `triggers`, `functions`, `procedures`, and `indexes` to maintain and optimize the database.

### Data Analysis

- Open the `Logistics Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
- Refer to the `Logistics Analytics.pdf` for a static, printable version of the report.

### Visualizations

- Review the screenshots in the `Screenshots` folder to get a quick overview of the financial and performance dashboards.


