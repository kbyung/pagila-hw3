/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
SELECT c.customer_id, c.first_name, c.last_name   
FROM customer c
LEFT JOIN LATERAL (
  SELECT rental_id, rental_date, inventory_id
  FROM rental
  WHERE customer_id = c.customer_id
  ORDER BY rental_date DESC
  LIMIT 5 
) r ON true
INNER JOIN inventory ON r.inventory_id = inventory.inventory_id 
INNER JOIN film USING (film_id)
INNER JOIN film_category USING (film_id)
INNER JOIN category USING (category_id)
WHERE category.name = 'Action'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT r.rental_id) >= 4;
