CREATE DATABASE ecommerce_analytics;

SELECT COUNT(*) 
FROM indian_ecommerce_pricing_revenue_growth_36_months;

RENAME TABLE indian_ecommerce_pricing_revenue_growth_36_months
TO ecommerce_pricing_revenue;

SHOW TABLES;

SELECT COUNT(*) FROM ecommerce_pricing_revenue;


DESCRIBE ecommerce_pricing_revenue;


SELECT 
    MIN(order_date) AS min_date,
    MAX(order_date) AS max_date
FROM ecommerce_pricing_revenue;

-- What is the total revenue and order volume by year?

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY order_year
ORDER BY order_year;

-- order_date shows NULL date formate is in text 


SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_pricing_revenue
SET order_date = STR_TO_DATE(order_date, '%m/%d/%Y')
WHERE order_date IS NOT NULL;

ALTER TABLE ecommerce_pricing_revenue
MODIFY order_date DATE;

DESCRIBE ecommerce_pricing_revenue;


SELECT 
    MIN(order_date) AS min_date,
    MAX(order_date) AS max_date
FROM ecommerce_pricing_revenue;


-- What is the total revenue and order volume by year?

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY order_year
ORDER BY order_year;



-- Q1. How many total orders and total revenue does the business have?

SELECT COUNT( DISTINCT order_id) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_pricing_revenue;

-- Q2. What is the total revenue by year?

SELECT  YEAR(order_date) AS order_year,
Round(SUM(revenue),2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY order_year
ORDER BY order_year;

-- Q3. Which product categories generate the highest and lowest revenue, and what does this indicate about the business mix?

SELECT category,
ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY category
ORDER BY category DESC;


-- Q4. What is the average revenue per order (ARPO), and how does it differ across product categories?

SELECT category, ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS average_revenue_per_order
FROM ecommerce_pricing_revenue
GROUP BY category
ORDER BY average_revenue_per_order;

-- Q5. How many orders come from each zone?

SELECT zone, COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_pricing_revenue
GROUP BY zone
ORDER BY total_orders DESC;

-- Q6. What is the average revenue per order?

SELECT ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS average_revenue_per_order
FROM ecommerce_pricing_revenue;

-- Q7. Compare revenue between Mass and Premium brands?

SELECT brand_type, COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY brand_type;

-- Q8. Which states contribute the most revenue?

SELECT state, ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY state
ORDER BY total_revenue DESC;


-- Q9. Do sales events increase revenue compared to non-event periods?

SELECT sales_event, ROUND(SUM(revenue),2) AS total_revenue, COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_pricing_revenue
GROUP BY sales_event
ORDER BY total_revenue DESC;

-- Q10. How does customer age group impact revenue?

SELECT 
CASE
		WHEN customer_age  < 25 THEN 'Under 25'
		WHEN customer_age BETWEEN 25 AND 40 THEN '25-40'
        WHEN customer_age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
        END AS age_group,
		ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY age_group
ORDER BY total_revenue DESC;



-- Q11. What is the impact of discounts on revenue and units sold?

SELECT
    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent BETWEEN 1 AND 10 THEN 'Low Discount (1–10%)'
        WHEN discount_percent BETWEEN 11 AND 30 THEN 'Medium Discount (11–30%)'
        ELSE 'High Discount (>30%)'
    END AS discount_bucket,
    
    ROUND(AVG(units_sold), 2) AS avg_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY discount_bucket
ORDER BY avg_units_sold DESC;

-- Q12. What percentage of total revenue does each category contribute?

SELECT 
    category,
    ROUND(SUM(revenue), 2) AS category_revenue,
    ROUND(
        SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (), 
        2
    ) AS revenue_share_pct
FROM ecommerce_pricing_revenue
GROUP BY category
ORDER BY category_revenue DESC;


-- Q13. What is the Month-over-Month (MoM) revenue growth?

SELECT
    order_date,
    ROUND(SUM(revenue), 2 ) AS monthly_revenue,
    LAG (SUM(revenue)) OVER (ORDER BY order_date) AS prev_month_revenue,
    ROUND(
        (SUM(revenue) - LAG(SUM(revenue)) OVER (ORDER BY order_date))
        * 100.0 / LAG(SUM(revenue)) OVER (ORDER BY order_date),
        2
    ) AS mom_growth_pct
FROM ecommerce_pricing_revenue
GROUP BY order_date
ORDER BY order_date;


-- Q14. Rank states by revenue within each zone

SELECT
    zone,
    state,
    ROUND(SUM(revenue), 2) AS state_revenue,
    RANK() OVER (PARTITION BY zone ORDER BY SUM(revenue) DESC) AS zone_rank
FROM ecommerce_pricing_revenue
GROUP BY zone, state
ORDER BY zone_rank ASC;


-- Q15. How do competition intensity and inventory pressure affect discounting?

SELECT
    competition_intensity,
    inventory_pressure,
    ROUND(AVG(discount_percent), 2) AS avg_discount,
    ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY competition_intensity, inventory_pressure
ORDER BY total_revenue DESC;


-- Q16. Which categories are most price-sensitive?

SELECT
    category,
    CASE
        WHEN discount_percent < 10 THEN 'Low Discount (0–10%)'
        WHEN discount_percent BETWEEN 10 AND 30 THEN 'Medium Discount (11–30%)'
        ELSE 'High Discount (>30%)'
    END AS discount_bucket,
    ROUND(AVG(units_sold), 2) AS avg_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_pricing_revenue
GROUP BY category, discount_bucket
ORDER BY category, avg_units_sold DESC;







    
        



