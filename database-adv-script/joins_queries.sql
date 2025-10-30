-- ==============================================
-- Airbnb Database Advanced SQL Joins

-- Description: Demonstration of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN
-- ==============================================

-- INNER JOIN: Retrieve all bookings with the users who made them
-- --------------------------------------------------------------
-- Only returns bookings that have a corresponding user record.
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.username,
    users.email,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out,
    bookings.status
FROM bookings
INNER JOIN users
    ON bookings.user_id = users.id;


-- LEFT JOIN: Retrieve all properties and their reviews (including properties without reviews)
-- --------------------------------------------------------------
-- Returns all properties, and reviews where they exist.
SELECT
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews
    ON properties.id = reviews.property_id;


-- FULL OUTER JOIN: Retrieve all users and bookings (even if a user has no booking OR a booking has no user)
-- --------------------------------------------------------------
-- If you're using MySQL, you can simulate it with a UNION of LEFT and RIGHT joins.

-- Option 1: For PostgreSQL or SQL Server (supports FULL OUTER JOIN)
SELECT
    users.id AS user_id,
    users.username,
    users.email,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out,
    bookings.status
FROM users
FULL OUTER JOIN bookings
    ON users.id = bookings.user_id;

-- Option 2: For MySQL (simulate FULL OUTER JOIN using UNION)

-- SELECT
--     users.id AS user_id,
--     users.username,
--     users.email,
--     bookings.id AS booking_id,
--     bookings.property_id,
--     bookings.check_in,
--     bookings.check_out,
--     bookings.status
-- FROM users
-- LEFT JOIN bookings
--     ON users.id = bookings.user_id
-- UNION
-- SELECT
--     users.id AS user_id,
--     users.username,
--     users.email,
--     bookings.id AS booking_id,
--     bookings.property_id,
--     bookings.check_in,
--     bookings.check_out,
--     bookings.status
-- FROM users
-- RIGHT JOIN bookings
--     ON users.id = bookings.user_id;
