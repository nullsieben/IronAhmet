USE sakila;
SELECT first_name, last_name FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor
					WHERE film_id = 1);
                    
SELECT first_name, last_name FROM actor
WHERE actor_id in (SELECT actor_id FROM film_actor
					WHERE film_id = (SELECT film_id FROM film
									WHERE title = "Academy Dinosaur"));

# 1) List all films whose length is longer than the average of all the films.
SELECT title FROM film
WHERE length > (SELECT avg(length) FROM film);

# 2) How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT count(inventory_ID) from inventory
WHERE film_ID = (SELECT film_ID from film
				WHERE title = "Hunchback Impossible");

# 3) Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name from actor
WHERE actor_ID in (SELECT actor_ID from film_actor
					WHERE film_ID = (SELECT film_ID from film
					WHERE title = "Alone Trip"));
                    
# 4) Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title from film
WHERE film_ID in (SELECT film_ID from film_category
					WHERE category_ID in (SELECT category_ID from category
					WHERE name = "Family"));

# 5) Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name, last_name, email from customer
WHERE address_ID in (SELECT address_ID from address
					WHERE city_ID in (SELECT city_ID from city
					WHERE country_ID in (SELECT country_ID from country
                    WHERE country = "Canada")));

# 6) Optional: Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

SELECT title FROM film 
WHERE film_id IN (SELECT film_id FROM film_actor 
				  WHERE actor_id = (SELECT actor_id from film_actor 
                  GROUP BY actor_id ORDER BY count(film_id) DESC LIMIT 1));

