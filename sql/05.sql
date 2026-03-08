SELECT last_name, first_name
FROM actor
WHERE (first_name, last_name) NOT IN (
    SELECT first_name, last_name
    FROM customer
)
ORDER BY last_name, first_name;
