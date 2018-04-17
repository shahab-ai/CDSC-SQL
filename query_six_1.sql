with user_per_country as (
select country , count(*) user_count
from query_six
group by country)

select * 
from user_per_country
where user_count = (select max(user_count) from user_per_country)
	or user_count = (select min(user_count) from user_per_country)
order by user_count desc
