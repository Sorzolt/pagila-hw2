WITH film_revenue AS (
    SELECT
        film.title,
        COALESCE(SUM(payment.amount), 0.00) AS revenue
    FROM film
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    LEFT JOIN payment USING (rental_id)
    GROUP BY film.film_id, film.title
),
ranked_films AS (
    SELECT
        RANK() OVER (ORDER BY revenue DESC) AS rank,
        title,
        revenue
    FROM film_revenue
)
SELECT
    rank,
    title,
    revenue,
    SUM(revenue) OVER (ORDER BY rank) AS "total revenue"
FROM ranked_films
ORDER BY rank, title;
