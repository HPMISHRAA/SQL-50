# Day 7 - Not Boring Movies

**LeetCode Problem:** [620. Not Boring Movies](https://leetcode.com/problems/not-boring-movies/)

---

## 🗂️ Table: Cinema

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| movie       | varchar |
| description | varchar |
| rating      | float   |

- `id` is the primary key.
- Each row contains the name of a movie, its description, and a rating.
- `rating` is a float value (2 decimal places) between 0 and 10.

---

## 🧾 Problem Statement

Write a SQL query to **report all movies** that:

- Have an **odd-numbered `id`**
- Have a `description` **not equal to** `"boring"`

Return the result **ordered by `rating` in descending order**.

---

## 📥 Example Input

**Cinema Table:**

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

---

## 📤 Example Output

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

---

## ✅ Explanation

- **Valid Odd IDs:** 1, 3, 5
- **Filtered Out:** ID 3 (description is `"boring"`)
- **Remaining:** Movies with ID 1 and 5
- **Sorted by Rating (desc):** 9.1, 8.9

---

## 🔍 Key Concepts Used

- `WHERE` clause for filtering odd IDs and excluding boring movies
- `MOD()` or `%` to check for odd-numbered IDs
- `ORDER BY` to sort by `rating DESC`

---

## 💡 SQL Solution

```sql
SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1 AND description != 'boring'
ORDER BY rating DESC;
