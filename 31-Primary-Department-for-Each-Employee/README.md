# 1789. Primary Department for Each Employee

## 🔍 Problem Description

**Table: Employee**

| Column Name   | Type    |
|---------------|---------|
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |

- (employee_id, department_id) is the primary key.
- primary_flag is an ENUM of type ('Y', 'N'):
  - 'Y' indicates the primary department.
  - 'N' indicates a non-primary department.
- If an employee belongs to **only one department**, the `primary_flag` is `'N'`.

---

## 🧠 Objective

Write an SQL query to report all employees with their **primary department**.

- If an employee is in only one department, return that department.
- Otherwise, return the department with `primary_flag = 'Y'`.

---

## ✅ Example

### Input

**Employee Table:**

| employee_id | department_id | primary_flag |
|-------------|----------------|--------------|
| 1           | 1              | N            |
| 2           | 1              | Y            |
| 2           | 2              | N            |
| 3           | 3              | N            |
| 4           | 2              | N            |
| 4           | 3              | Y            |
| 4           | 4              | N            |

---

### Output

| employee_id | department_id |
|-------------|----------------|
| 1           | 1              |
| 2           | 1              |
| 3           | 3              |
| 4           | 3              |

---

## 💡 Explanation

- Employee 1 has only one department, so it's considered primary.
- Employee 2 has two departments; the one with primary_flag = 'Y' is department 1.
- Employee 3 has only one department, so it's primary.
- Employee 4 has multiple departments, and the primary one is department 3.

---

## 🧾 SQL Solution

```sql
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
       SELECT employee_id
       FROM Employee
       GROUP BY employee_id
       HAVING COUNT(*) = 1
   );
