select user_id, sum(transaction_amount)
from (
	select * from query_four_march
	union all
	select * from query_four_april) as tmp
group by user_id
order by user_id;