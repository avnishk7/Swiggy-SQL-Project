-- Inserting data in all tables 
-- Populating dim_date 
INSERT INTO dim_date (order_date, year, day, month, month_name, quarter, week)
SELECT DISTINCT
    order_date,
    YEAR(order_date),
    DAY(order_date),
    MONTH(order_date),
    MONTHNAME(order_date),
    QUARTER(order_date),
    WEEK(order_date)
    FROM swiggy_data
    WHERE order_date IS NOT NULL;
    
-- Populating dim_location
INSERT INTO dim_location (state, city, location)
SELECT DISTINCT state,city,location
FROM swiggy_data;

-- Populating dim_restaurant
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT restaurant_name
FROM swiggy_data;

-- Populating dim_category
INSERT INTO dim_category (category_name)
SELECT DISTINCT category
FROM swiggy_data;
 
-- Populating dim_dish
INSERT INTO dim_dish (dish_name)
SELECT DISTINCT dish_name
FROM swiggy_data;

-- Populating the fact_orders 
-- Disable foreign key checks during the bulk load, then re-enable them
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO fact_orders
(
    date_id,
    location_id,
    restaurant_id,
    category_id,
    dish_id,
    price,
    rating,
    rating_count
)
SELECT
    dd.date_id,
    dl.location_id,
    dr.restaurant_id,
    dc.category_id,
    di.dish_id,
    s.price,
    s.rating,
    s.rating_count
FROM swiggy_data s

INNER JOIN dim_date dd
ON s.order_date = dd.order_date

INNER JOIN dim_location dl
ON s.state = dl.state
AND s.city = dl.city
AND s.location = dl.location

INNER JOIN dim_restaurant dr
ON s.restaurant_name = dr.restaurant_name

INNER JOIN dim_category dc
ON s.category = dc.category_name

INNER JOIN dim_dish di
ON s.dish_name = di.dish_name;

SET FOREIGN_KEY_CHECKS = 1;