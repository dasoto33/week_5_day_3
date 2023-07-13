-- Subqueries

--outer query
--where primary in (
--subquery
--)

-- Find all payments that are larger than average

select avg(amount)
from payment;

select *
from payment 
where amount > 4.20;

select count(payment_id)
from payment
where amount >(
	select avg(amount)
	from payment
);

-- Find all films in English using subquery

select *
from "language"
where name = 'English';

select title, language_id 
from film
where language_id = 1;

select title 
from film
where language_id in (
	select language_id 
	from "language"
	where name = 'English'
);

-- Find all films with an actor with last name Allen

SELECT title
FROM film
WHERE film_id IN (
 SELECT film_id
 FROM film_actor
 WHERE actor_id IN ( 
  SELECT actor_id
  FROM actor
  WHERE last_name = 'Allen'));

-- Find all payments above staff member 1's avg payment amount

select amount
from payment
where amount > (
	select avg(amount) 
	from payment 
	where staff_id = 1
);


