-- Basic Sql Queries
-- Reading the data from all tables

SELECT * FROM dim_category;
SELECT * FROM dim_date;
SELECT * FROM dim_dish;
SELECT * FROM dim_location;
SELECT * FROM dim_restaurant;
SELECT * FROM fact_orders;

-- Q1.Find the total number of orders.
SELECT COUNT(*) AS TOTAL_ORDERS
FROM fact_orders;

-- Q2.Find the total number of restaurants.
SELECT COUNT(*) AS TOTAL_RESTAURANTS
FROM dim_restaurant;

-- Q3.Find the total number of dishes.
SELECT COUNT(*) AS TOTAL_DISHES
FROM dim_dish;

-- Q4.Find the average price of all dishes ordered round to two decimal.
SELECT ROUND(AVG(price),2) as Average_price
FROM fact_orders;

-- Q5.Find total revenue.
SELECT SUM(price) AS REVENUE
FROM fact_orders;

-- Q6.Display all distinct categories.
SELECT DISTINCT category_name
FROM dim_category;

-- Q7.Display all distinct restaurant.
SELECT DISTINCT restaurant_name
FROM dim_restaurant;

-- Q8.Find the total number of restaurants in each city.
SELECT l.city,COUNT(DISTINCT f.restaurant_id) AS total_restaurants
FROM fact_orders as f
JOIN dim_location as l
ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY total_restaurants DESC;