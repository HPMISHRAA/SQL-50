# Day 28 - The Number of Employees Which Report to Each Employee

**LeetCode Problem:** [1731. The Number of Employees Which Report to Each Employee](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee)

---

## 🧾 Table: Employees

| Column Name  | Type    |
|--------------|---------|
| employee_id  | int     |
| name         | varchar |
| reports_to   | int     |
| age          | int     |

- `employee_id` is the primary key.
- `reports_to` is the ID of the employee’s manager.
- Some employees do not report to anyone (`reports_to` is null).

---

## 📌 Problem Statement

We define a **manager** as an employee who has **at least one other employee reporting to them**.

Write an SQL query to:
- Find the `employee_id` and `name` of all **managers**
- The number of employees who report directly to them (`reports_count`)
- The average age of those reports, rounded to the nearest integer (`average_age`)

Return the result table ordered by `employee_id`.

---

## 💡 Example:

### 👇 Input:

**Employees table:**

| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |

### 📤 Output:

| employee_id | name  | reports_count | average_age |
|-------------|-------|----------------|--------------|
| 9           | Hercy | 2              | 39           |

---

## 🧠 Explanation:

- Hercy has two direct reports: Alice (41) and Bob (36)
- Their average age is (41 + 36) / 2 = 38.5 → rounded to **39**

---

## ✅ SQL Solution

```sql
SELECT 
  e1.employee_id,
  e1.name,
  COUNT(e.employee_id) AS reports_count,
  ROUND(AVG(e.age)) AS average_age
FROM Employees e
JOIN Employees e1 
  ON e.reports_to = e1.employee_id
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id;
