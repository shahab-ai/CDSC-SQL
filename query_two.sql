select
	100*sum(case when w.user_id is null then 1 else 0 end)/count(*) as Mobile_only, 
	100*sum(case when m.user_id is null then 1 else 0 end)/count(*) as Web_only,
	100*sum(case when w.user_id is not null and 
		m.user_id is not null then 1 else 0 end)/count(*) as Both
from
	(select distinct user_id  from query_two_web) w
	full outer join
	(select distinct user_id from query_two_mobile) m
on w.user_id = m.user_id 
