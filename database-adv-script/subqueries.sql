select *
from property p 
where property_id IN(
	select property_id
	from review r 
	where rating > 4.0
)

select *
from "User" u 
where(
	select COUNT(*)
	from booking b
	where b.user_id = u.user_id 
) > 3
