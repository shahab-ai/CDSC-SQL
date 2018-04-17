select user_id,
	date,
	amount,
	sum(amount) over (partition by user_id order by date) as total
from (
	select user_id, 
		date, 
		sum(transaction_amount) as amount
	from query_four_march
	group by user_id, date
	union all
	select user_id, 
		date, 
		sum(transaction_amount) as amount
	from query_four_april
	group by user_id, date
	) tmp
order by user_id, date