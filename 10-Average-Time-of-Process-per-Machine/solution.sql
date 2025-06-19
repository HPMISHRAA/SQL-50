# Write your MySQL query statement below
select a.machine_id,
Round(AVG(b.timestamp - a.timestamp),3) AS processing_time
from activity a
join activity b
ON a.machine_id = b.machine_id
and a.process_id = b.process_id
and a.activity_type = 'start'
and b.activity_type = 'end'
group by
a.machine_id
order by
a.machine_id;