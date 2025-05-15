-- Initial query to retrieve all bookings with user, property, and payment details
SELECT *
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';

-- Analyze performance of the above query
EXPLAIN
SELECT *
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';

-- Optional: Refactored query (if you want to demonstrate optimization)
-- For example: remove unnecessary columns instead of SELECT *, or filter earlier
EXPLAIN
SELECT b.booking_id, b.start_date, b.end_date, u.first_name, u.last_name,
       p.name AS property_name, p.location, pay.amount, pay.status
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';

