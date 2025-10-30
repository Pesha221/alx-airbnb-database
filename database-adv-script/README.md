# Airbnb Database Subqueries

## 📘 Description
This directory demonstrates the use of **correlated** and **non-correlated subqueries** in SQL for the Airbnb database.

## 🧠 Concepts Covered
- **Non-correlated subquery**: A subquery that runs independently of the outer query.
- **Correlated subquery**: A subquery that references columns from the outer query.

## 🧩 Files
- `subqueries.sql` — SQL script with both types of subqueries.
- `README.md` — Documentation of this task.

## 🧪 Example Queries

### 1️⃣ Non-Correlated Subquery
Retrieve all properties where the **average rating** is greater than 4.0:
```sql
SELECT p.id, p.title, p.location
FROM properties p
WHERE p.id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

