# Airbnb Database Index Optimization

## Objective
This document explains how indexes were added to optimize the **Airbnb backend database**, focusing on **User**, **Property**, and **Booking** tables.

---

## Why Use Indexes?
Indexes make database queries faster by allowing the database to locate data without scanning the entire table.  
They are most useful for:
- **WHERE** conditions
- **JOIN** operations
- **ORDER BY** and **GROUP BY** queries

---

## Index Strategy

| Table        | Column(s) Indexed          | Reason for Indexing |
|---------------|---------------------------|----------------------|
| **users**     | `email`                   | Used during login/authentication. |
|               | `username`                | Improves user search performance. |
| **properties**| `location`                | Used for filtering by city or area. |
|               | `price`                   | Used in price range searches. |
|               | `host_id`                 | Used in joins between users (hosts) and properties. |
| **bookings**  | `user_id`                 | Used in queries retrieving user bookings. |
|               | `property_id`             | Used when joining bookings to properties. |
|               | `start_date, end_date`    | Used in range queries and date-based availability checks. |

---

## ⚙️ SQL Commands (from `database_index.sql`)

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_date_range ON bookings(start_date, end_date);
