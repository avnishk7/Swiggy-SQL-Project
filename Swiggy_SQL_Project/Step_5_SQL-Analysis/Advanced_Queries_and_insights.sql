-- Advanced SQL Queries

-- Q1.Find the top 5 cities with the highest number of orders.
WITH top_five as (
	SELECT di.city,count(f.order_id) as number_of_orders,DENSE_RANK() OVER(ORDER BY count(f.order_id) DESC) as rn
    FROM fact_orders as f
    JOIN dim_location as di
    ON di.location_id = f.location_id
    GROUP BY di.city
)
SELECT city,number_of_orders
FROM top_five
WHERE rn <= 5
ORDER BY number_of_orders DESC;

-- Q2.Find the restaurant having the maximum number of dishes.
SELECT r.restaurant_name,count(DISTINCT f.dish_id) as dish_count
FROM fact_orders as f
JOIN dim_restaurant as r
ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name
ORDER BY dish_count DESC
LIMIT 1;

-- Q3.Restaurants whose average rating is above the overall average.
SELECT r.restaurant_name,ROUND(AVG(f.rating),2) as average_rating
FROM fact_orders as f
JOIN dim_restaurant as r
ON r.restaurant_id = f.restaurant_id
GROUP BY r.restaurant_name
HAVING AVG(f.rating) > (
	SELECT ROUND(AVG(f.rating),2) as overall_average
    FROM fact_orders as f
)
ORDER BY average_rating DESC;

-- Q4.Top 5 restaurants in each city based on average rating.
WITH restaurant_rating AS (
	SELECT l.city,r.restaurant_name,ROUND(AVG(f.rating),2) as avg_rating,
    DENSE_RANK() OVER(partition by l.city order by AVG(f.rating) DESC) AS rn
    FROM fact_orders as f
    JOIN dim_location as l
    ON l.location_id = f.location_id
    JOIN dim_restaurant as r
    ON r.restaurant_id = f.restaurant_id
    GROUP BY l.city,r.restaurant_name
)
SELECT city,restaurant_name,avg_rating
FROM restaurant_rating
WHERE rn <= 5
ORDER BY city,avg_rating DESC;

-- Q5.Rank TOP 50 dishes by price within each category.
WITH top50 as (
	SELECT c.category_name,di.dish_name,f.price,
	DENSE_RANK() OVER(PARTITION BY c.category_name ORDER BY f.price DESC) AS dish_rank
	FROM fact_orders f
	JOIN dim_category c
	ON f.category_id = c.category_id
	JOIN dim_dish di
	ON f.dish_id = di.dish_id
)
SELECT category_name,dish_name,price
FROM top50
WHERE dish_rank <= 50;

-- Q6.Restaurants serving more than 100 unique dishes.
SELECT r.restaurant_name,COUNT(DISTINCT f.dish_id) AS unique_dishes
FROM fact_orders AS f
JOIN dim_restaurant AS r
ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(DISTINCT f.dish_id) > 100
ORDER BY unique_dishes DESC;

-- Q7. Find restaurants available in multiple cities
SELECT r.restaurant_name,COUNT(DISTINCT l.city) AS city_count
FROM fact_orders AS f
JOIN dim_restaurant AS r
ON f.restaurant_id = r.restaurant_id
JOIN dim_location AS l
ON f.location_id = l.location_id
GROUP BY r.restaurant_name
HAVING COUNT(DISTINCT l.city) > 1
ORDER BY city_count DESC;

-- BUSINESS INSIGHTS 
-- Q1.TOP 10  restaurant with the highest revenue?
SELECT r.restaurant_name,ROUND(SUM(f.price),2) AS revenue
FROM fact_orders f
JOIN dim_restaurant r
ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY revenue DESC
LIMIT 10;

-- Q2.Which city generated the highest revenue?
SELECT l.city,ROUND(SUM(f.price),2) AS revenue
FROM fact_orders f
JOIN dim_location l
ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY revenue DESC
LIMIT 1;

-- Q3.Find each restaurant's percentage contribution to total revenue.
SELECT r.restaurant_name,ROUND(SUM(f.price),2) AS revenue,
ROUND(
        (SUM(f.price) /
        (SELECT SUM(price) FROM fact_orders))*100,2
    ) AS revenue_percentage
FROM fact_orders f
JOIN dim_restaurant r
ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY revenue DESC;