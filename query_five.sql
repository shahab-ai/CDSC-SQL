with rowed_transactions as (
	select u.user_id, 
		u.sign_up_date, 
		t.transaction_amount,
		(row_number() over (order by t.transaction_amount)) as row
	from query_five_transactions t
	join query_five_users u
	on u.user_id = t.user_id 
		and u.sign_up_date = t.transaction_date::date)


select round(avg(t.transaction_amount),2) as average, 
	(select transaction_amount
	from rowed_transactions
	where row = (select count(*)/2 + 1 from rowed_transactions)) as median
from query_five_transactions t
join query_five_users u
on u.user_id = t.user_id and u.sign_up_date = t.transaction_date::date