-- 1
SELECT title, description FROM film WHERE description LIKE '%drama%';


-- 2
SELECT DISTINCT first_name, last_name FROM actor ORDER BY first_name;


-- 3
SELECT first_name, last_name, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country IN ('Russian Federation');


-- 4

SELECT film.title, category.name AS genre FROM film 
JOIN film_actor ON film.film_id = film_actor.film_id 
JOIN actor ON film_actor.actor_id = actor.actor_id 
JOIN film_category ON film.film_id = film_category.film_id 
JOIN category ON film_category.category_id = category.category_id 
WHERE actor.first_name = 'PENELOPE' AND actor.last_name = 'GUINESS';


-- 5

SELECT category.name AS genre, SUM(payment.amount) AS revenue 
FROM category 
JOIN film_category ON category.category_id = film_category.category_id 
JOIN inventory ON film_category.film_id = inventory.film_id 
JOIN rental ON inventory.inventory_id = rental.inventory_id 
JOIN payment ON rental.rental_id = payment.rental_id 
WHERE
	MONTH(payment.payment_date) = '05' AND
    YEAR(payment.payment_date) = '2005'
GROUP BY category.name 
ORDER BY revenue DESC 
LIMIT 10;


-- 6
SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS num_rentals 
FROM customer 
JOIN rental ON customer.customer_id = rental.customer_id 
JOIN inventory ON rental.inventory_id = inventory.inventory_id 
JOIN film ON inventory.film_id = film.film_id 
JOIN film_actor ON film.film_id = film_actor.film_id 
JOIN actor ON film_actor.actor_id = actor.actor_id 
WHERE actor.first_name = 'PENELOPE' AND actor.last_name = 'GUINESS' 
GROUP BY customer.customer_id 
ORDER BY num_rentals DESC 
LIMIT 5 OFFSET 9;


-- 7
SELECT 
	city.city,
    country.country,
    SUM(payment.amount) AS revenue
FROM
	store
    JOIN address ON store.address_id = address.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON city.country_id = country.country_id
    JOIN customer ON store.store_id = customer.store_id
    JOIN payment ON customer.customer_id = payment.customer_id
WHERE
	payment_date <= DATE_ADD((SELECT MIN(payment.payment_date) FROM payment), INTERVAL 1 WEEK)
GROUP BY 
	store.store_id;


-- 8
SELECT
	film.title, 
    actor.first_name, 
    actor.last_name
FROM 
	film
	JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE
	film.film_id = (
		SELECT inventory.film_id
		FROM inventory
		JOIN rental ON inventory.inventory_id = rental.inventory_id
		JOIN payment ON rental.rental_id = payment.rental_id
		GROUP BY inventory.film_id
		ORDER BY SUM(payment.amount) DESC
		LIMIT 1
	);
	

-- 9
SELECT 
    c.first_name AS customer_first_name, 
    c.last_name AS customer_last_name,
    a.first_name AS actor_first_name,
    a.last_name AS actor_last_name
FROM 
    customer c
    LEFT JOIN actor a ON c.last_name = a.last_name
ORDER BY 
    c.last_name, c.first_name;


-- 10
SELECT 
    c.first_name AS customer_first_name, 
    c.last_name AS customer_last_name,
    a.first_name AS actor_first_name,
    a.last_name AS actor_last_name
FROM 
    actor a
    RIGHT JOIN customer c ON c.last_name = a.last_name
ORDER BY 
    a.last_name, a.first_name;


-- 11
SELECT 
    (SELECT MAX(length) FROM film) AS max_length, 
    (SELECT COUNT(*) FROM film WHERE length = max_length) AS count_max_length, 
    (SELECT MIN(length) FROM film) AS min_length, 
    (SELECT COUNT(*) FROM film WHERE length = min_length) AS count_min_length,
    
    (SELECT MAX(actor_count) FROM 
		(SELECT film_id, COUNT(*) AS actor_count 
		FROM film_actor 
		GROUP BY film_id) AS actor_counts)
	AS max_actors,
    
    (SELECT COUNT(*) FROM 
		(SELECT film_id, COUNT(*) AS actor_count 
		FROM film_actor 
		GROUP BY film_id) AS actor_counts
	WHERE actor_count = max_actors)
	AS max_actors_count,
    
    (SELECT MIN(actor_count) FROM 
		(SELECT film_id, COUNT(*) AS actor_count 
		FROM film_actor 
		GROUP BY film_id) AS actor_counts)
	AS min_actors,
    
    (SELECT COUNT(*) FROM 
		(SELECT film_id, COUNT(*) AS actor_count 
		FROM film_actor 
		GROUP BY film_id) AS actor_counts
		WHERE actor_count = min_actors)
	AS min_actors_count

