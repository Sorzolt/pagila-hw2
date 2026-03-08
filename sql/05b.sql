SELECT actor.last_name, actor.first_name
FROM actor
LEFT JOIN customer
  ON actor.first_name = customer.first_name
 AND actor.last_name = customer.last_name
WHERE customer.customer_id IS NULL
ORDER BY actor.last_name, actor.first_name;
