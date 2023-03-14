USE sakila;
-- 1. Drop column picture from staff.
ALTER TABLE staff
  DROP COLUMN picture;



-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.





insert into staff(  staff_id,first_name, last_name, address_id, email, store_id, active, username, password, last_update )
values(3, 'Tammy', 'Sanders', 79,'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy', 1234, now());

Select * 
From staff
Where first_name = 'Tammy';
							


-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

-- insert into rental( rental_id, rental_date, inventory_id, customer_id, return_date, satff_id, last_update )
-- values(, '', 'Sanders', 79,'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy', 1234, now());


Select staff_id from sakila.staff
Where first_name =  'Mike' and last_name = 'Hillyer';

