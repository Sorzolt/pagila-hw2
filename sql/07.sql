SELECT DISTINCT film.title
FROM film
JOIN inventory USING (film_id)
WHERE film.film_id NOT IN (
    SELECT DISTINCT film.film_id
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    WHERE country.country = 'United States'
)
ORDER BY film.title;
