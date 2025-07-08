# Day 25 - Classes With at Least 5 Students

**LeetCode Problem:** [596. Classes With at Least 5 Students](https://leetcode.com/problems/classes-with-at-least-5-students)

---

## 🧾 Table: Courses

| Column Name | Type    |
|-------------|---------|
| student     | varchar |
| class       | varchar |

- `(student, class)` is the primary key.
- Each row in the table indicates a student enrolled in a class.

---

## 📌 Problem Statement

Write a SQL query to **find all the classes** that have **at least five students**.

Return the result table in any order.

---

## 💡 Example

### 👇 Input

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

### 📤 Output

| class |
|-------|
| Math  |

---

## 🧠 Explanation

- **Math** has 6 students → ✅ Include
- **English, Biology, Computer** each have only 1 student → ❌ Exclude

---

## 🧮 SQL Query

```sql
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
