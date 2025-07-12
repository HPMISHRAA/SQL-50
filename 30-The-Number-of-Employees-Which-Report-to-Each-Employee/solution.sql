SELECT e1.employee_id,e1.name,               
COUNT(e.employee_id) AS reports_count, 
ROUND(AVG(e.age)) AS average_age
FROM Employees e
JOIN Employees e1 ON e.reports_to = e1.employee_id
GROUP BY e1.employee_id,e1.name
ORDER BY e1.employee_id;
