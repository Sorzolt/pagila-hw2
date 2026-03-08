SELECT
    EXTRACT(YEAR FROM rental_date) AS "Year",
    EXTRACT(MONTH FROM rental_date) AS "Month",
    COUNT(*) AS "Total Rentals"
FROM rental
GROUP BY ROLLUP (
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
)
ORDER BY
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date);
