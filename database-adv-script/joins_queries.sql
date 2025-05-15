select * 
from booking b 
inner join "User" u on u.user_id = b.user_id

select * 
from property p 
left join review r on r.property_id = p.property_id

select *
from "User" u
full outer join booking b on b.user_id = u.user_id
