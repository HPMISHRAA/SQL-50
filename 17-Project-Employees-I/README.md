# Day 17 - Average Experience of Employees in a Project

**LeetCode Problem:** [1075. Project Employees I](https://leetcode.com/problems/project-employees-i)

---

## 🧾 Table: Project

| Column Name  | Type |
|--------------|------|
| project_id   | int  |
| employee_id  | int  |

- `(project_id, employee_id)` is the primary key.
- `employee_id` is a foreign key referencing the Employee table.

---

## 🧾 Table: Employee

| Column Name      | Type    |
|------------------|---------|
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |

- `employee_id` is the primary key.
- `experience_years` is guaranteed to be non-null.

---

## 📌 Problem Statement

Write an SQL query to return the **average experience years** of all the employees **for each project**, **rounded to 2 decimal places**.

Return the result table in any order.

---

## 💡 Example:

### 👇 Input:

**Project table:**

| project_id | employee_id |
|------------|-------------|
| 1          | 1           |
| 1          | 2           |
| 1          | 3           |
| 2          | 1           |
| 2          | 4           |

**Employee table:**

| employee_id | name   | experience_years |
|-------------|--------|------------------|
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |

---

### 📤 Output:

| project_id | average_years |
|------------|----------------|
| 1          | 2.00           |
| 2          | 2.50           |

---

## 🧠 Explanation

- Project `1` has employees with experience years `3, 2, 1` → Avg = `(3+2+1)/3 = 2.00`
- Project `2` has employees with experience years `3, 2` → Avg = `(3+2)/2 = 2.50`

---

## 🧮 SQL Solution

```sql
SELECT 
  p.project_id,
  ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
  ON p.employee_id = e.employee_id
GROUP BY p.project_id;
