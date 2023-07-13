-- find first & last name of all actors in film alice fantasia

select first_name, last_name
from actor
join film_actor
on actor.actor_id = film_actor.actor_id 
join film
where film.title = 'Alice Fantasia'

-- find the name of all the films in the category: animation

select title
from film 
join film_category fc 
on film.film_id = film_category.film_id 
where film_category.category_id 

-- Find all customers who live in Clarksville

select first_name, last_name, city
from city
join address
on city.city_id = address.city_id
join customer
on customer.address_id = address.address_id 
where city = 'Clarksville';

-- How many movies has Tamara Nguyen rented?

select concat(first_name, last_name) as full_name, count(rental_id) as rentals
from customer
join rental
on rental.customer_id = customer.customer_id 
where first_name = 'Tamara' and last_name = 'Nguyen'
group by 1;

-- without using concat

select first_name ,last_name, count(rental_id) as rentals
from customer
join rental
on rental.customer_id = customer.customer_id 
where first_name = 'Tamara' and last_name = 'Nguyen'
group by first_name, last_name

-- How many movies has Nick Wahlberg starred in?

select count(actor.actor_id), concat(first_name, ' ', last_name) as full_name
from actor
join film_actor
on actor.actor_id = film_actor.actor_id 
where first_name = 'Nick' and last_name = 'Wahlberg'
group by full_name;

select title
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
join film
on film.film_id = film_actor.film_id 
where first_name = 'Nick' and last_name = 'Wahlberg';

-- What languages are movies Judy Gray renting?

select concat(first_name, ' ', last_name) as full_name, title, "language", inventory.inventory_id 
from customer
join rental
on customer.customer_id = rental.customer_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film
on inventory.film_id = film.film_id 
join "language"
on film.language_id = "language".language_id 
where first_name = 'Judy' and last_name = 'Gray';

-- Find all staff that lives in Canada

select first_name, last_name, address, city, country
from country
join city
on city.country_id = country.country_id
join address
on address.city_id = city.city_id
join staff
on staff.address_id = address.address_id 
where country = 'Canada';














