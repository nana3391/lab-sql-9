USE sakila;

-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT film_actor.actor_id,count(film_actor.film_id) as film_count
from film_actor
join film
on film.film_id=film_actor.film_id
group by film_actor.actor_id;

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

