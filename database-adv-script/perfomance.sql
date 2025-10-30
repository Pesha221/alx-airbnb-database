-- Airbnb Database: Query Performance Optimization


--  Objective:
-- Retrieve all bookings along with related user, property, and payment details.
-- Then analyze and optimize the query for better performance.

-- ==============================================
-- INITIAL QUERY (UNOPTIMIZED)
-- ==============================================

EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- ❌ Issues:
-- - Multiple full table scans if indexes are missing.
-- - Possible over-fetching of columns.
-- - LEFT JOIN on payments may create unnecessary row lookups.

-- ==============================================
-- OPTIMIZED QUERY
-- ==============================================

-- Optimization Techniques:
-- - Ensure indexes exist on:
--     users.user_id, bookings.user_id, bookings.property_id, payments.booking_id
-- - Only select required columns.
-- - Use INNER JOIN where data is mandatory.
-- - Apply filters (e.g., date range or status) to reduce row scans.

EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status IN ('confirmed', 'completed')
ORDER BY b.start_date DESC
LIMIT 50;

--   Benefits:
-- - Reduced columns = smaller result set.
-- - Proper use of JOIN types.
-- - Added filtering and ORDER BY with indexed columns.
-- - Limited results to 50 for faster reads.
