 📊 SQL Query: Employees with Bonus Less Than 1000

🧾 Problem Statement

Write a SQL query to report the name and bonus amount of each employee with a bonus less than 1000.  
Include employees who do **not have a bonus entry in the `Bonus` table as well (i.e., their bonus is `NULL`).

---

 🧮 Tables

 🧑‍💼 Employee

| Column Name | Type    | Description                      |
|-------------|---------|----------------------------------|
| empId       | int     | Unique ID of the employee        |
| name        | varchar | Name of the employee             |
| supervisor  | int     | empId of the employee's manager  |
| salary      | int     | Salary of the employee           |

---

 💰 Bonus

| Column Name | Type | Description                           |
|-------------|------|---------------------------------------|
| empId       | int  | Foreign key referencing Employee.empId |
| bonus       | int  | Bonus amount of the employee          |

---

 🧾 Example Input

 Employee

| empId | name   | supervisor | salary |
|-------|--------|------------|--------|
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

 Bonus

| empId | bonus |
|-------|-------|
| 2     | 500   |
| 4     | 2000  |

---

 ✅ Expected Output

| name  | bonus |
|-------|-------|
| Brad  | null  |
| John  | null  |
| Dan   | 500   |

---

 🧠 Explanation

- `Dan` has a bonus of `500` which is less than 1000 → included.
- `Brad` and `John` don’t have a bonus record → considered as `NULL` → included.
- `Thomas` has a bonus of `2000` → excluded.

---

 🧾 SQL Query

```sql
SELECT Employee.name, Bonus.bonus
FROM Employee
LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL;
