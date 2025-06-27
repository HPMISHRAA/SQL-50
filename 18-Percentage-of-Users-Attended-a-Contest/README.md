# Day 19 - Percentage of Users Registered in Each Contest

**LeetCode Problem:** [1211. Percentage of Users Attended a Contest](https://leetcode.com/problems/percentage-of-users-attended-a-contest)  
**Difficulty:** Easy

---

## 📘 Table: Users

| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| user_name   | varchar |

- `user_id` is the primary key.
- Each row contains the name and ID of a user.

---

## 📘 Table: Register

| Column Name | Type    |
|-------------|---------|
| contest_id  | int     |
| user_id     | int     |

- `(contest_id, user_id)` is the primary key.
- Each row indicates that a user registered for a contest.

---

## ❓ Problem Statement

Write a SQL query to **find the percentage of users registered in each contest**.  
- Round the percentage to **2 decimal places**.
- Return the result **ordered by percentage in descending order**, and in case of a tie, by `contest_id` in ascending order.

---

## 🧠 Key Concepts

- `COUNT(DISTINCT ...)`: Count unique users per contest.
- Subquery: Get total user count from the `Users` table.
- `ROUND(..., 2)`: Round result to two decimal places.
- `ORDER BY`: Sort by percentage DESC and contest_id ASC.

---

## 💡 Example

**Input:**

**Users Table**

| user_id | user_name |
|---------|-----------|
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |

**Register Table**

| contest_id | user_id |
|------------|---------|
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |

---

**Output:**

| contest_id | percentage |
|------------|------------|
| 208        | 100.00     |
| 209        | 100.00     |
| 210        | 100.00     |
| 215        | 66.67      |
| 207        | 33.33      |

---

## 🧮 SQL Query

```sql
SELECT 
  contest_id,
  ROUND(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
