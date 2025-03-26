/*
 * Management wants to rank customers by how much money they have spent in order to send coupons to the top 10%.
 *
 * Write a query that computes the total amount that each customer has spent.
 * Include a "percentile" column that contains the customer's percentile spending,
 * and include only customers in at least the 90th percentile.
 * Order the results alphabetically.
 *
 * HINT:
 * I used the `ntile` window function to compute the percentile.
 */
WITH spending AS (
    SELECT
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        SUM(payment.amount) AS total_payment
    FROM customer
    INNER JOIN payment USING (customer_id)
    GROUP BY customer.customer_id
),
ranked AS (
    SELECT *,
           NTILE(100) OVER (ORDER BY total_payment ASC) AS percentile
    FROM spending
)
SELECT customer_id, first_name || ' ' || last_name AS name   ,total_payment, percentile
FROM ranked
WHERE ranked.percentile >= 90
ORDER BY name ASC;
