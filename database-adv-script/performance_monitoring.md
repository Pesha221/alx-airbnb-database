# Database Performance Monitoring and Refinement Report

## Objective
Continuously monitor and refine the performance of the `alx-airbnb-database` system by analyzing query execution plans, identifying bottlenecks, and making schema or indexing improvements.

---

## Step 1: Monitoring Query Performance

### Tools Used
- **EXPLAIN / EXPLAIN ANALYZE** — To understand query execution paths.
- **SHOW PROFILE** (MySQL) — To measure CPU, I/O, and latency at each query stage.
- **Query Logs** — To identify the most frequently executed queries.

### Sample Queries Monitored

```sql
-- 1️⃣ Fetch all active bookings for a specific property
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE property_id = 1023 AND status = 'confirmed';

-- 2️⃣ Calculate total revenue per host
EXPLAIN ANALYZE
SELECT host_id, SUM(total_amount) AS total_revenue
FROM Booking
GROUP BY host_id;

-- 3️⃣ Find top 10 most booked properties
EXPLAIN ANALYZE
SELECT property_id, COUNT(*) AS booking_count
FROM Booking
GROUP BY property_id
ORDER BY booking_count DESC
LIMIT 10;
