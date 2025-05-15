# Query Optimization Report

## Objective

Refactor a complex SQL query involving bookings, user details, property details, and payment details to improve performance.

---

## Initial Query

```sql
SELECT *
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id
LEFT JOIN payment p2 ON p2.booking_id = b.booking_id;
```

## Initial Performance Analysis (`EXPLAIN ANALYZE`)

* **Execution Time:** 0.285 ms
* **Observations:**

  * Sequential scans (`Seq Scan`) on all tables
  * Joins used: `Hash Right Join`, `Hash Left Join`
  * Planning Time: 5.209 ms
  * Total rows involved: small (4–6 rows)
* **Conclusion:** The query performs well due to a small dataset. However, performance may degrade as the dataset grows.

---

## Optimization Strategy

### 1. Create Indexes on High-Usage Columns

```sql
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON payment(booking_id);
```

### 2. Refactor the Query to Use Specific Columns

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.email,
    p.name AS property_name,
    pay.amount
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id;
```

---

## Post-Optimization Expectations

* Use of `Index Scan` or `Index Only Scan` instead of `Seq Scan` (on large datasets)
* Reduced memory usage and faster execution

---

## Conclusion

The original query executed quickly due to a small dataset, but was not optimized for scalability. Indexes were added to frequently joined columns, and the query was refactored to reduce unnecessary column selection. These changes prepare the system for larger datasets with improved performance.

