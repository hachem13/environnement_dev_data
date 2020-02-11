SELECT title, name FROM film
INNER JOIN language LIMIT 10;

SELECT f.title, a.first_name, a.last_name FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'JENNIFER' and a.last_name = 'DAVIS' and f.release_year = 2006;

SELECT first_name, last_name FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory i on i.inventory_id =  r.inventory_id
INNER JOIN film f on f.film_id =  i.film_id
WHERE title = "ALABAMA DEVIL";

SELECT title, city FROM film f
LEFT JOIN inventory i on i.film_id =  f.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
LEFT JOIN customer cu ON cu.customer_id = r.customer_id
LEFT JOIN address a ON a.address_id = cu.address_id
LEFT JOIN city ci ON ci.city_id = a.city_id
WHERE city = "Woodridge";

SELECT title, DATEDIFF(return_date,rental_date ) AS dd FROM film f
LEFT JOIN inventory i on f.film_id =  i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE DATEDIFF(return_date,rental_date ) >= 1 ORDER BY dd ASC LIMIT 10;