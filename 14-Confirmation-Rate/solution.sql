# Write your MySQL query statement below
select si.user_id,round(avg(if(co.action='confirmed',1,0)),2) as confirmation_rate
from signups si 
left join confirmations co
on si.user_id = co.user_id
group by si.user_id