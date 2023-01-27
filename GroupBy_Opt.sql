USE sakila;

# 1. In the table actor, what last names are not repeated?

SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(first_name) = 1;

# SELECT last_name FROM actor WHERE COUNT(last_name)=1 GROUP BY last_name;

# 2. Which last names appear more than once?

SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(first_name) > 1;

# 3. Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id "Staff ID" , COUNT(rental_id) "Number of total rentals" FROM rental GROUP BY staff_id;

# 4. Using the film table, find out how many films there are of each rating.

SELECT rating, COUNT(rating) FROM film GROUP BY rating;

# 5. What is the mean length of the film for each rating type.

SELECT rating, ROUND(AVG(length),2) FROM film GROUP BY rating;

# 6. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating FROM film GROUP BY rating HAVING AVG(length) >120;

