-- partitioning.sql

-- Step 1: Create the main Booking table with partitioning
DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20)
)
PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE booking_2022 PARTITION OF Booking
FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_future PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

-- Step 3: Optional indexes for faster lookups
CREATE INDEX idx_booking_start_date_2022 ON booking_2022 (start_date);
CREATE INDEX idx_booking_start_date_2023 ON booking_2023 (start_date);
CREATE INDEX idx_booking_start_date_2024 ON booking_2024 (start_date);
CREATE INDEX idx_booking_start_date_future ON booking_future (start_date);

-- Step 4: Test queries
-- Example 1: Fetch bookings in a specific date range
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Example 2: Fetch bookings for multiple years
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2022-01-01' AND '2024-12-31';
