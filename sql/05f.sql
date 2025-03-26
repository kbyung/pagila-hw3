/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT f1.title
FROM film_category fc1
JOIN film_category fc2 ON fc1.category_id = fc2.category_id
JOIN film f1 ON fc1.film_id = f1.film_id
JOIN film f2 ON fc2.film_id = f2.film_id
WHERE f2.title = 'AMERICAN CIRCUS' 
GROUP BY f1.title
HAVING COUNT(fc1.category_id) >= 2

INTERSECT

SELECT f1.title
FROM film_actor ac1
JOIN film_actor ac2 ON ac1.actor_id = ac2.actor_id
JOIN film f1 ON ac1.film_id = f1.film_id
JOIN film f2 ON ac2.film_id = f2.film_id
WHERE f2.title = 'AMERICAN CIRCUS'

ORDER BY title;
