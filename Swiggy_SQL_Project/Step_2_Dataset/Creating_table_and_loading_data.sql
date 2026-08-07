-- Creating Database
CREATE DATABASE Swiggy_db;
-- Using Database
use Swiggy_db;

-- Creating table named swiggy_data
drop table if exists swiggy_data;
CREATE TABLE swiggy_data (
    state VARCHAR(50),
    city VARCHAR(50),
    order_date DATE,
    restaurant_name VARCHAR(150),
    location VARCHAR(150),
    category VARCHAR(100),
    dish_name VARCHAR(200),
    price DECIMAL(8,2),
    rating DECIMAL(2,1),
    rating_count INT
);

-- Loading data in swiggy_data table
LOAD DATA LOCAL INFILE 'C:/Users/Avnish/Downloads/Swiggy_Data.csv'
INTO TABLE swiggy_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
state,
city,
@order_date,
restaurant_name,
location,
category,
dish_name,
price,
rating,
rating_count
)
SET order_date = STR_TO_DATE(@order_date,'%d-%m-%Y');
