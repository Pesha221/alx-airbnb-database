# Airbnb Database – Aggregations and Window Functions

## Description
This task demonstrates how to use **aggregation** and **window functions** in SQL to analyze booking data in the Airbnb database.

##  Files
- `aggregations_and_window_functions.sql` — SQL queries using COUNT(), GROUP BY, and RANK().
- `README.md` — Documentation explaining each query.

## Concepts
- **Aggregation**: Summarizing data using functions like COUNT, SUM, AVG.
- **GROUP BY**: Grouping results by columns.
- **Window Functions**: Performing ranking and analytical operations across query results.

---

### Total Number of Bookings per User
```sql
SELECT 
    u.id AS user_id,
    u.username,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.username
ORDER BY total_bookings DESC;
