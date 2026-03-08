SELECT
    EXTRACT(YEAR FROM rental.rental_date) AS "Year",
    EXTRACT(MONTH FROM rental.rental_date) AS "Month",
    SUM(payment.amount) AS "Total Revenue"
FROM rental
JOIN payment USING (rental_id)
GROUP BY ROLLUP (
    EXTRACT(YEAR FROM rental.rental_date),
    EXTRACT(MONTH FROM rental.rental_date)
)
ORDER BY
    EXTRACT(YEAR FROM rental.rental_date),
    EXTRACT(MONTH FROM rental.rental_date);
