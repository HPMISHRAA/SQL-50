# Day 25 - Classes With at Least 5 Students

**LeetCode Problem:** [596. Classes With at Least 5 Students](https://leetcode.com/problems/classes-with-at-least-5-students)

---

## 🧾 Table: Courses

| Column Name | Type    |
|-------------|---------|
| student     | varchar |
| class       | varchar |

- `(student, class)` is the primary key.
- Each row indicates the name of a student and the class they are enrolled in.

---

## 📌 Problem Statement

Write an SQL query to **find all classes** that have **at least five students** enrolled.

Return the result table in **any order**.

---

## 💡 Example

### 👇 Input:

**Courses table:**

| student | class    |
|---------|----------|
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |

---

### 📤 Output:

| class |
|--------|
| Math   |

---

## 🧠 Explanation

- **Math** has **6 students** → ✅ included
- **English**, **Biology**, and **Computer** each have **1 student** → ❌ not included

The query should group rows by class and use `HAVING COUNT(*) >= 5` to filter only those with 5 or more students.

---

## ✅ SQL Query

```sql
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;
