# Day 28 - Biggest Single Number

**LeetCode Problem:** [619. Biggest Single Number](https://leetcode.com/problems/biggest-single-number)

---

## 🧾 Table: MyNumbers

| Column Name | Type |
|-------------|------|
| num         | int  |

- This table **may contain duplicates**.
- Each row of this table contains an integer.

---

## 📌 Problem Statement

A **single number** is defined as a number that appears **only once** in the `MyNumbers` table.

Write an SQL query to:

- Find the **largest single number**.
- If there are **no single numbers**, return `null`.

---

## 💡 Example 1:

**Input:**

MyNumbers table:

| num |
|-----|
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |

**Output:**

| num |
|-----|
| 6   |

**Explanation:**

- Single numbers are: `1, 4, 5, 6`
- Largest among them is `6`

---

## 💡 Example 2:

**Input:**

MyNumbers table:

| num |
|-----|
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |

**Output:**

| num  |
|------|
| null |

**Explanation:**

- All numbers are repeated.
- So, there is **no single number**.

---

## 🧠 SQL Solution

```sql
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS SingleNumbers;
