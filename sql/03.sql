SELECT DISTINCT customer.customer_id
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE film.film_id IN (
    SELECT film.film_id
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film.film_id
    ORDER BY SUM(payment.amount) DESC
    LIMIT 5
)
ORDER BY customer.customer_id;
