select user_id , date, r
from(
	select user_id,
		date,
		(rank() over (partition by user_id order by date asc)) as r
	from query_three
	) user_rank
where user_rank.r = 10
