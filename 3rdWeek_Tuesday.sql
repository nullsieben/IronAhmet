# SORULAR
# 7 AYNI SAYIDA AKTÖRÜ OLANLARIN SIRASI FARKLI

USE sakila;

# 1.Which actor has appeared in the most films?
# Hint:  group by actor_id

# Expected output:
# GINA DEGENERES	42

SELECT a.first_name as "First name" , a.last_name as "Last Name", count(f.film_id) as "Number of films"
FROM actor a 
INNER JOIN film_actor f
USING (actor_id) GROUP BY actor_id ORDER BY count(f.film_id) DESC LIMIT 1;

# 2. Most active customer (the customer that has rented the most number of films)

# Expected output:
# ELEANOR HUNT	46

SELECT c.first_name as "First name", c.last_name as "Last name", count(r.rental_id) "Number of rentals"
FROM customer c 
INNER JOIN rental r 
USING (customer_id) GROUP BY customer_id ORDER BY count(r.rental_id) DESC LIMIT 1;

# 3. List number of films per category.

SELECT c.name as "Category", count(category_id) as "Number of film"
FROM category c 
INNER JOIN film_category f
USING (category_id) GROUP BY category_id;

# 4. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name as "First name", s.last_name as "Last name", a.address as "Address"
FROM staff s
INNER JOIN address a
USING (address_id);

# 5. get films titles where the film language is either English or italian, 
# and whose titles starts with letter "M" , sorted by title descending.

# Expected output: 71 rows including
# title,name
# "MYSTIC TRUMAN",English
# "MUSSOLINI SPOILERS",English
# "MUSKETEERS WAIT",English
# "MUSIC BOONDOCK",English
# "MUSCLE BRIGHT",English
# "MURDER ANTITRUST",English
# "MUPPET MILE",English
# "MUMMY CREATURES",English
# "MULHOLLAND BEAST",English

SELECT f.title, l.name
FROM film f 
INNER JOIN language l
USING (language_id) WHERE f.title LIKE "M%" AND l.name = "English" OR "Italian" ORDER BY f.title DESC;

# 6. Display the total amount rung up by each staff member in August of 2005.

# Expected output:
# Jon Stephens	12218.48
# Mike Hillyer	11853.65

SELECT s.first_name "First name", s.last_name "Last name", sum(p.amount) "Total amount"
FROM staff s 
INNER JOIN payment p 
USING (staff_id) WHERE payment_date LIKE "2005-08%" GROUP BY staff_id;

# 7. List each film and the number of actors who are listed for that film.

# Expected output: Top 10 out of 997 rows
# LAMBS CINCINATTI		15
# CHITTY LOCK			13
# CRAZY HOME			13

SELECT f.title "Title", count(a.actor_id) "Number of actors"
FROM film f 
INNER JOIN film_actor a
USING (film_id) GROUP BY film_id ORDER BY count(a.actor_id) DESC LIMIT 10;

# 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
# List the customers alphabetically by last name.

SELECT c.first_name "First Name", c.last_name "Last name", sum(p.amount) "Total payment"
FROM customer c 
INNER JOIN payment p 
USING (customer_id) GROUP BY customer_id ORDER BY last_name;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
# Expect output: no actor found.

SELECT concat(a.first_name," ",a.last_name) "Name", f.film_id "Film ID"
FROM actor a
LEFT JOIN film_actor f
USING (actor_id) WHERE f.film_id IS NULL;

# 10. get the addresses that have NO customers, and ends with the letter "e"
# address
# "47 MySakila Drive"
# "23 Workhaven Lane"
# "1411 Lillydale Drive"

SELECT a.address "Adress" #c.last_name "Customer"
FROM address a
LEFT JOIN customer c 
USING (address_id) WHERE c.last_name IS NULL AND a.address LIKE "%E";
