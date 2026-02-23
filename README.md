# Music-store-SQL
SQL-based data analysis of a digital music store database to identify top-selling genres and high-value customers across different countries using CTEs and Window Functions.

**📌 Project Overview**

This project involves a comprehensive analysis of a digital music store's database. By executing complex SQL queries, I extracted actionable insights regarding customer behavior, regional sales performance, and music popularity. The goal was to demonstrate proficiency in database design and advanced data retrieval techniques.

**🛠️ Technical Skills Demonstrated**

_Database Schema Design_: Created 11 relational tables with Primary/Foreign Key constraints and cascading updates/deletes.

_Complex Data Aggregation_: Used SUM, COUNT, and AVG to generate financial and inventory reports.

_Advanced Joins_: Multi-table joins (up to 6 tables) to connect customers, invoices, tracks, and artists.

_Window Functions_: Implemented RANK() and PARTITION BY to solve "Top-N" ranking problems across countries.

_Common Table Expressions (CTEs)_: Structured modular and readable code for multi-layered analysis.

_Subqueries_: Used nested queries for sophisticated filtering (e.g., finding tracks longer than the average).

**🗄️ Database Schema**

The database follows a normalized relational structure including:

_Sales_: Invoice, InvoiceLine

_Inventory_: Track, Album, Artist, Genre, MediaType

_People_: Employee, Customer

_Playlists_: Playlist, PlaylistTrack

**🔍 Key Insights & Business Questions**

_1. Customer & Revenue Analysis_
Top Revenue City: Identified the city with the highest cumulative invoice totals to guide promotional events.

High-Value Customers: Pinpointed the "Best Customer" based on total lifetime spending.

Regional Spenders: Used CTEs and Ranking to identify the top spender in every individual country.

_2. Music Genre & Artist Trends_
The "Rock" Market: Filtered all customers who purchased Rock music to create a targeted marketing list.

Top Artists: Ranked the top 10 artists based on the volume of Rock tracks in the store.

Regional Popularity: Determined the most popular music genre for each country based on purchase counts.

**📂 Project Structure**

database_setup.sql (The tables): Contains the CREATE TABLE and schema definition scripts.

analysis_queries.sql: Contains the 11 business-critical queries and analysis.

**DATABASE SCHEMA**

![Database Schema Diagram](schema_diagram.png)
