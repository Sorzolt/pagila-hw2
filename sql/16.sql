WITH film_revenue AS (
    SELECT
        film.title,
        COALESCE(SUM(payment.amount), 0.00) AS revenue
    FROM film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    GROUP BY film.film_id, film.title
)
SELECT
    RANK() OVER (ORDER BY revenue DESC) AS rank,
    title,
    revenue
FROM film_revenue
ORDER BY rank, title;
