use sakila;
-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor;
SELECT * FROM actor where first_name ='SCARLETT';

-- 2.How many films (movies) are available for rent and how many films have been rented?
SELECT count(inventory_id) FROM inventory;

SELECT count(*) FROM rental;


-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length) as max_duration, min(length) as min_duration
FROM film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT avg(length) 
FROM film; 


-- 5.How many distinct (different) actors' last names are there?


SELECT count(distinct last_name)  FROM actor;

-- 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF (max(last_update),min(rental_date))
FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * ,MONTH(rental_date) as "month" , WEEKDAY(rental_date) as "weekday"
FROM rental
limit 20;

-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, WEEK(rental_date)as 'weekend', WEEK(rental_date)as 'workday'
FROM rental;


-- 9. Get release years.
SELECT count(release_year) 
FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title
FROM film
WHERE title like "%ARMAGEDDON%";

-- 11.Get all films which title ends with APOLLO
SELECT title
FROM film
WHERE title like "APOLLO";

-- 12. Get 10 the longest films.
SELECT length 
FROM films
Order by length desc
limit 10; 


-- 13. How many films include Behind the Scenes content?
SELECT COUNT(special_features) as "behind the scenes"
FROM film
WHERE special_features like "%Behind the Scenes%";








