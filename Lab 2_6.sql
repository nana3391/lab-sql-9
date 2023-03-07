USE SAKILA;
-- 1.In the table actor, which are the actors whose last names are not repeated?

SELECT distinct(last_name)
FROM actor; 

-- 2.


-- 3.Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT( rental_id), staff_id
FROM rental
GROUP by staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(title)
FROM film
GROUP by release_year;

-- 5.Using the film table, find out for each rating how many films were there.
SELECT COUNT(title), rating
FROM film
GROUP by rating;



-- 6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT avg(length), rating
FROM film
GROUP by rating;


-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating 
FROM film
GROUP by rating
HAVING avg(length)> 120;


-- 8 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT length, title 
FROM film
ORDER by length desc;

-- or this way with the rank formel
SELECT title, length, RANK() OVER(ORDER BY length DESC) as 'Rank'
FROM film;












