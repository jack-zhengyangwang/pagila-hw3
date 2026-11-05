/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. and have also appeared in at least one movie in the "Horror" category.
 */

SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film_category fc ON fc.film_id = fa.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name IN ('Children', 'Horror')
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(DISTINCT c.name) = 1
ORDER BY a.last_name, a.first_name;
