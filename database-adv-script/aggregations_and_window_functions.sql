select u.user_id , u.first_name, u.last_name,
COUNT(b.booking_id) as total_booking
from "User" u 
left join booking b on b.user_id = u.user_id
group by u.user_id, u.first_name, u.last_name
order by total_booking desc

select p.property_id, p."name",
COUNT(b.booking_id) as total_booking,
RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
from property p 
left join booking b on b.property_id = p.property_id
group by p.property_id, p."name"
order by booking_rank 
