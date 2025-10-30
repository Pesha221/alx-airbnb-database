-- Airbnb Database: Query Performance Optimization


--  Objective:
-- Retrieve all bookings with related user, property, and payment details.

-- ==============================================
-- INITIAL (NON-OPTIMIZED) QUERY
-- ==============================================

EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;

-- ==============================================
--  OPTIMIZED QUERY
-- ==============================================

-- Before running, make sure you have indexes on key columns:
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);
-- CREATE INDEX idx_bookings_created_at ON bookings(created_at);

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.payment_method
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND b.total_price > 1000
ORDER BY b.created_at DESC
LIMIT 100;

-- Improvements:
-- - Added AND condition for more selective filtering.
-- - Limited to essential columns and rows.
-- - ORDER BY optimized using indexed column.
-- - JOINs rely on indexed foreign keys.
-- - EXPLAIN ANALYZE used to evaluate performance gain.
