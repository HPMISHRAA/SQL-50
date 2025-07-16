# 180. Consecutive Numbers

## 📘 Problem Description

**Table: Logs**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| num         | varchar |

- `id` is the primary key and auto-incremented.
- This table contains logs of numbers entered over time.
- You need to find numbers that appear **at least three times consecutively**.

---

## 🧠 Objective

Write an SQL query to report **all numbers** that appear **three or more times consecutively** in the `Logs` table.

Return the result table with the column name `ConsecutiveNums`.

---

## ✅ Example

### Input

**Logs Table:**

| id | num |
|----|-----|
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |

### Output

| ConsecutiveNums |
|-----------------|
| 1               |

---

## 💡 Explanation

- Number `1` appears **three times in a row** (id = 1, 2, 3).
- So, it is included in the result.
- Other numbers do not appear **three times consecutively**, so they are excluded.

---

## 🧾 SQL Solution

```sql
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num;
