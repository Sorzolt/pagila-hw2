SELECT special_feature, SUM(profit) AS profit
FROM (
    SELECT film.film_id, SUM(payment.amount) AS profit, film.special_features
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY film.film_id, film.special_features
) AS film_profit,
unnest(film_profit.special_features) AS special_feature
GROUP BY special_feature
ORDER BY special_feature;
