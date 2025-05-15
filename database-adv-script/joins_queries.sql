-- Retrieve all bookings along with the user details (only where user exists)
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM booking b
INNER JOIN "User" u ON u.user_id = b.user_id;

-- Retrieve all properties and their reviews (if any)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM property p
LEFT JOIN review r ON r.property_id = p.property_id;


-- Retrieve all users and bookings, even if not linked to each other
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM "User" u
FULL OUTER JOIN booking b ON b.user_id = u.user_id;


