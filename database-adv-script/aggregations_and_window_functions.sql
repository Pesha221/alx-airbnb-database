-- Airbnb Database: Aggregations & Window Functions


-- Aggregation Query:
-- Find the total number of bookings made by each user
-- --------------------------------------------------------------
-- We use COUNT() to count bookings per user and GROUP BY user_id.

SELECT 
    u.id AS user_id,
    u.username,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.username
ORDER BY total_bookings DESC;


-- Window Function Query:
-- Rank properties based on the total number of bookings
-- --------------------------------------------------------------
-- We use COUNT() to count bookings and RANK() OVER() to assign ranks.

SELECT 
    p.id AS property_id,
    p.title AS property_title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY booking_rank ASC;
