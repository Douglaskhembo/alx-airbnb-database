-- Total number of bookings made by each user
SELECT u.user_id, u.first_name, u.last_name,
       COUNT(b.booking_id) AS total_booking
FROM "User" u
LEFT JOIN booking b ON b.user_id = u.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_booking DESC;

-- Rank properties using RANK()
SELECT p.property_id, p."name",
       COUNT(b.booking_id) AS total_booking,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON b.property_id = p.property_id
GROUP BY p.property_id, p."name"
ORDER BY booking_rank;

-- Rank properties using ROW_NUMBER()
SELECT p.property_id, p."name",
       COUNT(b.booking_id) AS total_booking,
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM property p
LEFT JOIN booking b ON b.property_id = p.property_id
GROUP BY p.property_id, p."name"
ORDER BY row_num;

