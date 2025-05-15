SELECT *
FROM property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


select *
from "User" u 
where(
	select COUNT(*)
	from booking b
	where b.user_id = u.user_id 
) > 3
