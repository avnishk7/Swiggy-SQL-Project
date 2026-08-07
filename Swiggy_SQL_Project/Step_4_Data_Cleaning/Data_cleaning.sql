-- Data Cleaning And Validation

-- Checking null values
SELECT * FROM swiggy_data
WHERE state IS NULL
OR 
city IS NULL 
OR
order_date IS NULL
OR
restaurant_name IS NULL
OR
location IS NULL
OR
category IS NULL
OR
dish_name IS NULL
OR
price IS NULL
OR
rating IS NULL
OR rating_count IS NULL;

-- Blank Or Empty Strings
SELECT * FROM swiggy_data
WHERE state ='' OR city ='' 
OR restaurant_name ='' OR location =''
OR category ='' OR dish_name = '';

-- Duplicate Data Detection
SELECT state,city,order_date,restaurant_name,location,category,
dish_name,price,rating,rating_count,count(*) as Count
FROM swiggy_data
GROUP BY state,city,order_date,restaurant_name,location,category,
dish_name,price,rating,rating_count
HAVING count(*) > 1;

-- Removing Duplicates
CREATE TABLE swiggy_data_new AS
SELECT DISTINCT *
FROM swiggy_data;