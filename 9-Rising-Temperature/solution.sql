# Write your MySQL query statement below
select we.id
from weather we
join weather we1
on
DATEdIFF(we.recordDate,we1.recordDate)=1
and we.temperature>we1.temperature;