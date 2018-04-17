with last_user as
	(select
	 	max(created_at) last_user_ts, 
	 	country
	 from query_six
	 group by country),
	first_user as
	(select
		min(created_at) first_user_ts, 
		country
	from query_six
	group by country)

select user_id , created_at, cty as country
from
(select q.user_id, q.created_at, q.country as cty
from query_six q
join last_user l
on q.created_at = l.last_user_ts and q.country = l.country
union all
select q.user_id, q.created_at, q.country as cty
from query_six q
join first_user f
on q.created_at = f.first_user_ts and q.country = f.country
) tmp
order by country, created_at desc