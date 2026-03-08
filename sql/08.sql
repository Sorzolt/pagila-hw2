SELECT title
FROM film
WHERE rating = 'G'
  AND film_id IN (
    SELECT film_id
    FROM film,
         unnest(special_features) AS special_feature
    WHERE special_feature = 'Trailers'
  )
ORDER BY title;
