-- Airbnb Database: Index Optimization Script


-- Create indexes on high-usage columns (those frequently used in WHERE, JOIN, and ORDER BY clauses)
-- to improve performance of queries on Users, Properties, and Bookings tables.

-- ==============================================
-- USERS TABLE INDEXES
-- ==============================================

-- Index on email for fast login and lookups
CREATE INDEX idx_users_email ON users(email);

-- Index on username for search queries
CREATE INDEX idx_users_username ON users(username);

-- ==============================================
-- 2PROPERTIES TABLE INDEXES
-- ==============================================

-- Index on location for quick property searches by city or region
CREATE INDEX idx_properties_location ON properties(location);

-- Index on price to speed up range queries and sorting
CREATE INDEX idx_properties_price ON properties(price);

-- Index on host_id to optimize joins with users (hosts)
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- ==============================================
--  BOOKINGS TABLE INDEXES
-- ==============================================

-- Index on user_id to improve queries filtering bookings by user
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id to optimize joins between bookings and properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Composite index on start_date and end_date for efficient date range searches
CREATE INDEX idx_bookings_date_range ON bookings(start_date, end_date);

-- ==============================================
-- PERFORMANCE TESTING (optional)
-- ==============================================
-- You can run EXPLAIN or ANALYZE before and after creating indexes to measure performance impact.
-- Example:

-- Before:
-- EXPLAIN SELECT * FROM bookings WHERE user_id = 10 AND start_date > '2025-01-01';

-- After:
-- EXPLAIN SELECT * FROM bookings WHERE user_id = 10 AND start_date > '2025-01-01';

--  Measure query performance before and after adding indexes
-- These commands show how the database query plan changes and how fast queries execute.

-- Before adding indexes:
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 10
  AND start_date > '2025-01-01';

-- After adding indexes:
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 10
  AND start_date > '2025-01-01';





