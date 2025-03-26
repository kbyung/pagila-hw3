/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
SELECT f2_film.title
FROM film_actor ac1
JOIN film_actor ac2 ON ac1.actor_id = ac2.actor_id
JOIN film f1_film ON ac1.film_id = f1_film.film_id
JOIN film f2_film ON ac2.film_id = f2_film.film_id
WHERE f1_film.title = 'AMERICAN CIRCUS'
ORDER BY f2_film.title ASC;
