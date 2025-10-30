-- ==============================================
-- Airbnb Database Advanced Subqueries
-- 
-- Description: Examples of correlated and non-correlated subqueries


-- Non-Correlated Subquery:
-- Find all properties where the average rating is greater than 4.0
-- --------------------------------------------------------------
-- This subquery calculates the average rating per property,
-- and the outer query retrieves only those with an average > 4.0.

SELECT
    p.id AS property_id,
    p.title,
    p.location,
    p.price_per_night
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.id ASC;


-- Correlated Subquery:
-- Find users who have made more than 3 bookings
-- --------------------------------------------------------------
-- The inner query depends on each user from the outer query.

SELECT
    u.id AS user_id,
    u.username,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3
ORDER BY u.id ASC;
