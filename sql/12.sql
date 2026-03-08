SELECT bts.title
FROM (
    SELECT title
    FROM film
    WHERE film_id IN (
        SELECT film_id
        FROM film,
             unnest(special_features) AS special_feature
        WHERE special_feature = 'Behind the Scenes'
    )
) AS bts
JOIN (
    SELECT title
    FROM film
    WHERE film_id IN (
        SELECT film_id
        FROM film,
             unnest(special_features) AS special_feature
        WHERE special_feature = 'Trailers'
    )
) AS tr
ON bts.title = tr.title
ORDER BY bts.title;
