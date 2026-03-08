SELECT film.title
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
WHERE rental.customer_id = 1
GROUP BY film.film_id, film.title
HAVING COUNT(*) > 1
ORDER BY film.title;
