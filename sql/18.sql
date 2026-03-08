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
),
totaled_films AS (
    SELECT
        rank,
        title,
        revenue,
        SUM(revenue) OVER (ORDER BY rank) AS "total revenue",
        SUM(revenue) OVER () AS grand_total
    FROM ranked_films
)
SELECT
    rank,
    title,
    revenue,
    "total revenue",
    CASE
        WHEN "total revenue" = grand_total THEN '100.00'
        ELSE TO_CHAR(100 * "total revenue" / grand_total, 'FM00.00')
    END AS "percent revenue"
FROM totaled_films
ORDER BY rank, title;
