USE sakila;

-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.category_id, c.name AS category_name, COUNT(f.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY c.category_id;

SELECT film_actor.actor_id,count(film_actor.film_id) as film_count
from film_actor
join film
on film.film_id=film_actor.film_id
group by film_actor.actor_id;
-- 2.
SELECT staff.staff_id, count(staff.staff_id), SUM(payment.amount) AS total_amount
FROM staff
JOIN payment 
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date >= '2005-08-01' AND payment.payment_date <= '2005-08-31'
GROUP BY staff.staff_id;

-- 3.Which actor has appeared in the most films?
SELECT actor_id, COUNT(film_id)
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC 
limit 1;

-- 4. 


SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC
LIMIT 1;

-- 5. 
SELECT first_name, last_name, address_id
FROM staff;

-- 6. 
SELECT film.title AS film_title, COUNT(*) AS actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY film_title;

-- 7.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;

-- 8.
SELECT c.name AS category_name, COUNT(*) AS film_count
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY film_count DESC;

