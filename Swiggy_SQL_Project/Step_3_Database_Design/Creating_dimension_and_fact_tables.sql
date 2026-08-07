-- Creating Star Schema
-- Creating Dimension Tables
-- Date Table
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    year INT,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    week INT
);

-- Location Table
CREATE TABLE dim_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    state VARCHAR(50),
    city VARCHAR(50),
    location VARCHAR(150)
);

-- Restaurant Table
CREATE TABLE dim_restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(200)
);

-- Category Table
CREATE TABLE dim_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(200)
);

-- Dish Table
CREATE TABLE dim_dish (
    dish_id INT AUTO_INCREMENT PRIMARY KEY,
    dish_name VARCHAR(200)
);

-- Creation Of Fact Table
CREATE TABLE fact_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,

    date_id INT,
    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,

    price DECIMAL(10,2),
    rating DECIMAL(4,2),
    rating_count INT,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);
