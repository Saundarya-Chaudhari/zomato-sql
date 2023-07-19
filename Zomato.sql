show databases;
use zomato;
select * from zomatodb;

# Retrieve the list of all restaurants in the database.
select restaurant_name from zomatodb;

#Find the details of a specific restaurant by its name.
select * from zomatodb where restaurant_name = 'NIU by Vikings';

#Display the average rating for each restaurant.
SELECT restaurant_name, AVG(aggregate_rating) AS average_rating
FROM zomatodb GROUP BY restaurant_name;

#List the top 5 restaurants with the highest average rating 
SELECT restaurant_name, AVG(aggregate_rating) AS average_rating
FROM zomatodb
GROUP BY restaurant_name
ORDER BY average_rating DESC
LIMIT 10;

#Display the restaurants that offer Filipino cuisine.
select restaurant_name,cuisines from zomatodb where cuisines in ('Filipino');

#Show the restaurants located in a Makati city.
select restaurant_name from zomatodb where city in ('Filipino');

#create a virtual table  with col names : restaurant_name, city, cuisines, avg cost is less than 2000 and excellent rating. 
CREATE VIEW restaurant_details AS
SELECT restaurant_name, city, cuisines, avg_cost_for_two, rating_text
FROM zomatodb
WHERE rating_text = 'Excellent' AND avg_cost_for_two < 2000;

# Calculate the total number of restaurants in the database.
select COUNT(restaurant_name) from zomatodb;

# calculate the number of restaurants in each city.
SELECT city, COUNT(*) AS restaurant_count
FROM zomatodb
GROUP BY city;

# Find the highest and lowest rated restaurants.
SELECT restaurant_name, aggregate_rating
FROM zomatodb
WHERE aggregate_rating = (
  SELECT MAX(aggregate_rating) 
  FROM zomatodb
)
OR aggregate_rating = (
  SELECT MIN(aggregate_rating) 
  FROM zomatodb
);

#Identify the top 5 most popular cuisines among all the restaurants.
SELECT cuisines, COUNT(*) AS cuisine_count
FROM zomatodb
GROUP BY cuisines
ORDER BY cuisine_count DESC
LIMIT 5;

ALTER TABLE zomatodb
DROP COLUMN prince_range
;

INSERT INTO zomatodb (restaurant_id, restaurant_name, country_code, city, address, locality, cuisines, avg_cost_for_two, 
currency, aggregate_rating, rating_color, rating_text, votes)
VALUES (234567,'New Restaurant', 123, 'Mumbai', 'Vasai', 'West', 'Indian', 3450, 'Botswana Pula(P)', 4.5, 'Dark Green', 'Excellent', 440);

