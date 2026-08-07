-- Intermediate SQL Queries.
-- Q1.Find the highest-priced dish.
-- Using a sub query
SELECT di.dish_name,f.price
FROM fact_orders as f
JOIN dim_dish as di
ON f.dish_id = di.dish_id
WHERE f.price = (
	SELECT MAX(price)
    FROM fact_orders
    );

-- Using order by for just 1 order
SELECT di.dish_name,f.price
FROM fact_orders f
JOIN dim_dish di
ON f.dish_id = di.dish_id
ORDER BY f.price DESC
LIMIT 1;

-- Q2.Find the lowest-priced dish.
SELECT di.dish_name,f.price
FROM fact_orders as f
JOIN dim_dish as di
ON f.dish_id = di.dish_id
WHERE f.price = (
	SELECT MIN(price)
    FROM fact_orders
    );

-- Q3.Find the number of orders placed in each state.
SELECT l.state,count(f.order_id) as total_orders_in_each_state
FROM fact_orders as f
JOIN dim_location as l
ON f.location_id = l.location_id
GROUP BY l.state
ORDER BY total_orders_in_each_state DESC;

-- Q4.Find the top 10 restaurants with the highest average rating.
SELECT r.restaurant_name,ROUND(AVG(f.rating),2) as highest_average_rating
FROM fact_orders as f
JOIN dim_restaurant as r
ON f.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY highest_average_rating DESC
LIMIT 10;

-- Q5.Find the top 10 most expensive dishes.
SELECT di.dish_name,f.price as most_expensive_dishes
FROM fact_orders as f
JOIN dim_dish as di
ON di.dish_id = f.dish_id
ORDER BY most_expensive_dishes DESC
LIMIT 10;

-- Q6.Find the average price of dishes in each category.
SELECT c.category_name,ROUND(AVG(f.price),2) as average_price_of_dish
FROM fact_orders as f
JOIN dim_category as c
ON c.category_id = f.category_id
GROUP BY c.category_name
ORDER BY average_price_of_dish DESC;

-- Q7.Find the average rating for each category.
SELECT c.category_name,ROUND(AVG(f.rating),2) as average_rating_of_category
FROM fact_orders as f
JOIN dim_category as c
ON c.category_id = f.category_id
GROUP BY c.category_name
ORDER BY average_rating_of_category DESC;

-- Q8.Find the total number of orders placed each month.
SELECT d.month,d.month_name,count(f.order_id) as orders_placed_month_wise
FROM fact_orders as f
JOIN dim_date as d
ON d.date_id = f.date_id
GROUP BY d.month,d.month_name
ORDER BY d.month;

-- Q9.Find the total number of orders placed each quarter.
SELECT d.quarter,count(f.order_id) as orders_placed_quarter_wise
FROM fact_orders as f
JOIN dim_date as d
ON d.date_id = f.date_id
GROUP BY d.quarter
ORDER BY d.quarter;

-- Q10.Find the city having the maximum number of restaurants.
-- A cte is used then a subquery used.
WITH city_restaurants AS (
    SELECT
        l.city,
        COUNT(DISTINCT f.restaurant_id) AS total_restaurants
    FROM fact_orders f
    JOIN dim_location l
    ON f.location_id = l.location_id
    GROUP BY l.city
)
SELECT *
FROM city_restaurants
WHERE total_restaurants = (
    SELECT MAX(total_restaurants)
    FROM city_restaurants
);