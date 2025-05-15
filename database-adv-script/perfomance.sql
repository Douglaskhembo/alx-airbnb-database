select *
from booking b 
left join "User" u on u.user_id = b.user_id
left join property p on p.property_id = b.property_id
left join payment p2 on p2.booking_id = b.booking_id
