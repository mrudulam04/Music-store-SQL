# Music-store-SQL
SQL-based data analysis of a digital music store database to identify top-selling genres and high-value customers across different countries using CTEs and Window Functions.

📌 Project Overview
This project involves a comprehensive analysis of a digital music store's database. By executing complex SQL queries, I extracted actionable insights regarding customer behavior, regional sales performance, and music popularity. The goal was to demonstrate proficiency in database design and advanced data retrieval techniques.
🛠️ Technical Skills Demonstrated
Database Schema Design: Created 11 relational tables with Primary/Foreign Key constraints and cascading updates/deletes.

Complex Data Aggregation: Used SUM, COUNT, and AVG to generate financial and inventory reports.

Advanced Joins: Multi-table joins (up to 6 tables) to connect customers, invoices, tracks, and artists.

Window Functions: Implemented RANK() and PARTITION BY to solve "Top-N" ranking problems across countries.

Common Table Expressions (CTEs): Structured modular and readable code for multi-layered analysis.

Subqueries: Used nested queries for sophisticated filtering (e.g., finding tracks longer than the average).

🗄️ Database Schema
The database follows a normalized relational structure including:

Sales: Invoice, InvoiceLine

Inventory: Track, Album, Artist, Genre, MediaType

People: Employee, Customer

Playlists: Playlist, PlaylistTrack

🔍 Key Insights & Business Questions
1. Customer & Revenue Analysis
Top Revenue City: Identified the city with the highest cumulative invoice totals to guide promotional events.

High-Value Customers: Pinpointed the "Best Customer" based on total lifetime spending.

Regional Spenders: Used CTEs and Ranking to identify the top spender in every individual country.

2. Music Genre & Artist Trends
The "Rock" Market: Filtered all customers who purchased Rock music to create a targeted marketing list.

Top Artists: Ranked the top 10 artists based on the volume of Rock tracks in the store.

Regional Popularity: Determined the most popular music genre for each country based on purchase counts.
