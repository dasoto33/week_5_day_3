-- Week 5 - Wednesday Questions:

--1. List all customers who live in Texas (use JOINs)
select concat(first_name, ' ', last_name) as full_name, address, district
from customer c
join address a
on a.address_id = c.address_id
where district = 'Texas';

-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still


--2. Get all payments above $6.99 with the Customer's Full Name

select concat(first_name, ' ', last_name) as full_name, amount
from payment p
join customer c 
on c.customer_id = p.customer_id 
where amount > 6.99;

-- Answer: 1,406 total payments above $6.99, too many names to list 


--3. Show all customers names who have made payments over $175(use subqueries)

select c.customer_id, concat(first_name, ' ', last_name) as full_name, sum(amount) as total_paid
from payment p
join customer c
on c.customer_id = p.customer_id 
group by c.customer_id;


-- Answer: 6 customers (Eleanor Hunt, Karl Seal, Marion Snyder, Rhonda Kennedy, Clara Shaw, and Tommy Collazo)  
--		It technically says there are no customers that have made payments over 175. Tried to see what customers have paid
--		over $175 TOTAL instead, but could not exclude everything < 175.


--4. List all customers that live in Nepal (use the city table)

select concat(first_name, ' ', last_name) as full_name, city, country,  c.country_id
from city c
join country cy
on cy.country_id = c.country_id
join address a 
on a.city_id = c.city_id 
join customer cm 
on cm.address_id = a.address_id 
where country = 'Nepal'

-- Answer: Kevin Schuler is the only customer who lives in Nepal.


--5. Which staff member had the most transactions?

select concat(first_name, ' ', last_name) as full_name, count(rental_id)
from staff s
join rental r 
on r.staff_id = s.staff_id
group by full_name


-- Answer: Mike Hillyer (8,040 transactions)


--6. How many movies of each rating are there?

select rating, count(rating) as movies_per_rating
from film
group by rating; 

-- Answer: PG = 194, R = 195, NC-17 = 210, PG-13 = 223, G = 178


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select c.customer_id, concat(first_name, ' ', last_name) as full_name, amount
from payment p 
join customer c 
on c.customer_id = p.customer_id
where amount in (
	select amount
	from payment p
	where amount > 6.99
	group by amount
	having count(*) = 1);


-- Answer: Customer 60 (Mildred Bailey) and Customer 75 (Tammy Sanders). Originally only used subquery 
--  but got curious and used join as well to add the full names.


--8. How many free rentals did our stores give away?

select count(r.rental_id) as free_rentals, amount
from rental r
join payment p
on p.rental_id = r.rental_id
where amount = 0
group by amount;

-- Answer: 24 free rentals



