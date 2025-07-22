# 1978. Employees Whose Manager Left the Company

## 🔍 Problem Description

**Table: Employees**

| Column Name | Type     |
|-------------|----------|
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |

- `employee_id` is the primary key.
- Each row contains information about an employee, including their manager and salary.
- If `manager_id` is NULL, it means the employee has no manager.
- If a manager leaves the company, their record is deleted, but their `manager_id` still exists in the subordinates' records.

---

## 🧠 Objective

Find the IDs of all employees:
- whose **salary is less than $30,000**, **and**
- whose **manager has left the company** (i.e., `manager_id` is not found in the `employee_id` list).

Return the result ordered by `employee_id`.

---

## ✅ Example

**Input:**

**Employees Table:**

| employee_id | name      | manager_id | salary |
|-------------|-----------|------------|--------|
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |

---

**Output:**

| employee_id |
|-------------|
| 11          |

---

## 💡 Explanation

- Employees with salary < 30,000: **Kalel (1)** and **Joziah (11)**.
- Kalel’s manager is employee 11 — still exists in the company ✅
- Joziah’s manager is employee 6 — **does not exist in the table**, so this manager left ❌
- Therefore, only **employee 11 (Joziah)** meets both criteria.

---

## 🧾 SQL Solution

```sql
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
    SELECT employee_id FROM Employees
  )
ORDER BY employee_id;
