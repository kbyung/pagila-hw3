/*
 * Compute the country with the most customers in it. 
 */
SELECT country
FROM customer
INNER JOIN address USING (address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 1;
