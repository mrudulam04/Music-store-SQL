-- senior most employee based on job title --
select * from employee
order by hire_date DESC
limit 1;

-- country that has most invoices --
select billing_country,
count(invoice_id) AS total_invoices
from invoice
group by billing_country
order by total_invoices DESC;

-- top 3 invoice totals --
SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;
-- city with best customers(high revenue) --
SELECT billing_city,
SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_city
order by total_revenue DESC
limit 1;

-- name of the best customer --
SELECT c.customer_id,
c.first_name,
c.last_name,
SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i
ON c.customer_id = i.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
ORDER BY total_spent DESC
limit 1;

-- list the rock music listerners --
SELECT distinct
c.email,c.first_name,c.last_name,g.name AS genre
FROM customer c
join invoice i 
on c.customer_id = i.customer_id
join invoiceline il
on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join genre g 
on t.genre_id = g.genre_id
where g.name = 'Rock'
order by c.email ASC;

-- top 10 artist with the most rock tracks --
select ar.name as artist_name,
COUNT(t.track_id) AS rock_track_count
FROM artist ar
join album al
on ar.artist_id=al.artist_id
join track t
on al.album_id = t.album_id
join genre g 
on t.genre_id=g.genre_id
where g.name = 'Rock'
group by ar.artist_id,ar.name
order by rock_track_count DESC
LIMIT 10;

-- track longer than avg song length -- 
select name,milliseconds
from track
where milliseconds > (SELECT AVG(milliseconds)FROM track)
order by milliseconds DESC;

-- Amount spent by each customer on each artist
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    ar.name AS artist_name,
    SUM(il.unit_price * il.quantity) AS total_spent
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
JOIN invoiceline il
    ON i.invoice_id = il.invoice_id
JOIN track t
    ON il.track_id = t.track_id
JOIN album al
    ON t.album_id = al.album_id
JOIN artist ar
    ON al.artist_id = ar.artist_id
GROUP BY customer_name, artist_name
ORDER BY total_spent DESC;

--  Most popular genre for each country

WITH genre_sales AS (
    SELECT 
        i.billing_country AS country, 
        g.name AS genre, 
        COUNT(il.invoice_line_id) AS purchases
    FROM invoice i
    JOIN invoiceline il 
        ON i.invoice_id = il.invoice_id
    JOIN track t 
        ON il.track_id = t.track_id
    JOIN genre g 
        ON t.genre_id = g.genre_id
    GROUP BY country, genre
),
ranked_genres AS (
    SELECT *, 
        RANK() OVER (PARTITION BY country ORDER BY purchases DESC) AS rnk
    FROM genre_sales
)
SELECT country, genre, purchases
FROM ranked_genres
WHERE rnk = 1;

--  Customer who spent the most per country
WITH customer_spending AS (
    SELECT
        i.billing_country AS country,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY 
        i.billing_country,
        c.customer_id,
        c.first_name,
        c.last_name
),
ranked_customers AS (
    SELECT *,
        RANK() OVER (PARTITION BY country ORDER BY total_spent DESC) AS rnk
    FROM customer_spending
)
SELECT
    country,
    customer_id,
    first_name,
    last_name,
    total_spent
FROM ranked_customers
WHERE rnk = 1
ORDER BY country;
