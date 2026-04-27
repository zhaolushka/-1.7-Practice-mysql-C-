SELECT
    cat.name,
    COUNT(*) AS film_count,
    ROUND(AVG(f.length), 1) AS avg_min
FROM film f
JOIN film_category fc ON
    f.film_id = fc.film_id
JOIN category cat ON
    fc.category_id = cat.category_id
GROUP BY
    cat.name
ORDER BY
    film_count DESC
LIMIT 5;

SELECT
    f.title,
    cat.name AS category_name
FROM film f
JOIN film_category fc ON
    f.film_id = fc.film_id
JOIN category cat ON
    fc.category_id = cat.category_id
ORDER BY
    f.title
LIMIT 20;

SELECT
    first_name,
    last_name,
    email
FROM customer
WHERE email LIKE '%@sakilacustomer.org'
ORDER BY
    last_name;

SELECT
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY
    rating
ORDER BY
    film_count DESC;

SELECT
    a.first_name,
    a.last_name,
    COUNT(*) AS film_count
FROM actor a
JOIN film_actor fa ON
    a.actor_id = fa.actor_id
JOIN film f ON
    fa.film_id = f.film_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY
    film_count DESC
LIMIT 10;

SELECT
    c.first_name,
    c.last_name,
    ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
JOIN payment p ON
    c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(p.amount) > 150
ORDER BY
    total_paid DESC;

SELECT
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON
    c.customer_id = r.customer_id
WHERE
    r.rental_date >= '2005-05-01'
    AND r.rental_date < '2005-06-01'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    rental_count DESC;

SELECT
    f.title,
    f.length
FROM film f
LEFT JOIN inventory i ON
    f.film_id = i.film_id
LEFT JOIN rental r ON
    i.inventory_id = r.inventory_id
WHERE
    f.length > 150
    AND r.rental_id IS NULL;
