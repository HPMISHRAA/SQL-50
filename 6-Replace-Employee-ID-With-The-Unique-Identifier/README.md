 Day 6 - Employees Unique ID

LeetCode Problem: [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)

---

 Table: Employees

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

- `id` is the primary key.
- Each row represents an employee and their name.

---

 Table: EmployeeUNI

| Column Name | Type |
|-------------|------|
| id          | int  |
| unique_id   | int  |

- `(id, unique_id)` is the primary key.
- Each row links an employee ID to their unique ID (if assigned).

---

 Problem Statement

Write a SQL query to **show the unique ID of each employee.  
If an employee does not have a unique ID, show NULL instead.

Return the result table in any order.

---

 Example:

Input:

Employees table:

| id | name     |
|----|----------|
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |

EmployeeUNI table:

| id | unique_id |
|----|-----------|
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |

---

Output:

| unique_id | name     |
|-----------|----------|
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |

---

 Explanation

- Employees Alice and Bob don't have a unique ID → result shows `null`.
- Others have corresponding `unique_id` values as per the `EmployeeUNI` table.
- This problem uses a LEFT JOIN to ensure all employees are included, even those missing from the `EmployeeUNI` table.
