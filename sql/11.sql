SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE film_id IN (
    SELECT film_id
    FROM film,
         unnest(special_features) AS special_feature
    WHERE special_feature = 'Behind the Scenes'
)
ORDER BY "Actor Name";
