# ⚙️ Airbnb Database Query Optimization Report

##  Objective
Optimize a complex SQL query that retrieves **bookings** with related **user**, **property**, and **payment** details to improve performance.

---

## Initial Query Overview
### Original Query:
```sql
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
