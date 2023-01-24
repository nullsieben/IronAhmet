# SORULAR
# 2: sayilar beklenenden farkli, gross revenue/business
# 7: anlamadim

USE sakila;

# 1. Write a query to display for each store its store ID, city, and country.

#Expected output:
# 1	Lethbridge	Canada
# 2	Woodridge	Australia

SELECT s.store_id "Store ID", ci.city "City", co.country "Country"
FROM store s 
LEFT JOIN address a 
USING (address_id) 
LEFT JOIN city ci 
USING (city_id)
LEFT JOIN country co
USING (country_id);

# 2. Write a query to display how much business, in dollars, each store brought in.

# Expected output:
# 1	33489.47
# 2	33927.04

SELECT s.store_id "Store", SUM(amount) "Revenue"
FROM store s
LEFT JOIN customer c
USING (store_id)
LEFT JOIN rental r
USING (customer_id)
LEFT JOIN payment p
USING (customer_id) GROUP BY s.store_id;

# 3. What is the average running time(length) of films by category?

# film-film_category-category

SELECT c.name "Category", ROUND(AVG(f.length),2) "Avarage of length"
FROM film f 
LEFT JOIN film_category fc
USING (film_id)
LEFT JOIN category c
USING (category_id) GROUP BY category_id ORDER BY c.name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

SELECT c.name "Category", ROUND(AVG(f.length),2) "Avarage of length"
FROM film f 
LEFT JOIN film_category fc
USING (film_id)
LEFT JOIN category c
USING (category_id) GROUP BY category_id ORDER BY ROUND(AVG(f.length),2) DESC LIMIT 5;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.

SELECT f.title "Film" #COUNT(r.rental_id) "Number of rentals"
FROM film f 
INNER JOIN inventory i
USING (film_id)
INNER JOIN rental r
USING (inventory_id) GROUP BY f.film_id ORDER BY COUNT(r.rental_id) DESC LIMIT 5;

# 6. List the top five genres in gross revenue in descending order.

# category-film_category-film-inventory-rental-payment

SElECT c.name "Category", SUM(p.amount) "Gross revenue"
FROM category c
INNER JOIN film_category fc 
USING (category_id)
INNER JOIN film f 
USING (film_id)
INNER JOIN inventory i
USING (film_id)
INNER JOIN rental r 
USING (inventory_id)
INNER JOIN payment p
USING (rental_id) GROUP BY c.name ORDER BY SUM(p.amount) DESC LIMIT 5;

# 7. Is "Academy Dinosaur" available for rent from Store 1?


