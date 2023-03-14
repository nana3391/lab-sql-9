USE sakila;USE sakila;
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT 
 title,
 COUNT(f.film_id) AS copies
 FROM inventory AS i
 JOIN film AS f ON (i.film_id=f.film_id)
 WHERE f.title='Hunchback Impossible'
 GROUP BY title;
 

-- 2. List all films whose length is longer than the average of all the films.
-- 
SELECT title,description,rating,length FROM film
WHERE length> avg(length);


-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
 SELECT first_name,last_name
 FROM actor
 WHERE actor_id IN(
 SELECT actor_id
 FROM film
 LEFT JOIN
 film_actor ON (film.film_id=film_actor.film_id)
 WHERE film.title='Alone Trip');
 
-- 4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title
FROM film
LEFT JOIN film_category ON (film.film_id=film_category.film_id)
LEFT JOIN category ON (film_category.category_id=category.category_id)
WHERE category.name='Family';


-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT
first_name,
last_name,
email
FROM customer
LEFT JOIN address ON (customer.address_id=address.address_id)
LEFT JOIN city ON (address.city_id=city.city_id)
LEFT JOIN country ON (city.country_id=country.country_id)
WHERE country='Canada';

-- 6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

SELECT 
actor.first_name AS first_name,
actor.last_name AS last_name,
a.film_count
FROM actor
LEFT JOIN(
SELECT
COUNT(film_id) AS film_count,
actor_id
FROM film_actor
GROUP BY actor_id)AS a ON (actor.actor_id=a.actor_id)
ORDER BY film_count DESC;





-- 7.Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments



-- 8. Customers who spent more than the average payments.
SELECT 
customer.first_name,
customer.last_name,
a.total_spend
FROM customer
LEFT JOIN(
SELECT 
payment.customer_id,
SUM(payment.amount) AS total_spend
FROM payment
LEFT JOIN customer ON (payment.customer_id=customer.customer_id)
GROUP BY 1) AS a ON(customer.customer_id=a.customer_id)
ORDER BY a.total_spend DESC
LIMIT 1;
