select user_id, 
	(max(unix_timestamp) - max(previous_timestamp)) as delta
from (select user_id, unix_timestamp,
		lag(unix_timestamp, 1) 
		over (partition by user_id 
			order by unix_timestamp) as previous_timestamp
	  from query_one) as prev_time_table
group by user_id
having (max(unix_timestamp) - max(previous_timestamp)) is not null
order by user_id