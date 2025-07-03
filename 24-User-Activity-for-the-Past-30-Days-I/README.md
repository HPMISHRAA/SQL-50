# Day 24 - Daily Active Users

**LeetCode Problem:** [1141. User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i)

---

## 📋 Table: Activity

| Column Name   | Type    |
|---------------|---------|
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |

- `activity_type` is an ENUM with values: `('open_session', 'end_session', 'scroll_down', 'send_message')`
- Each session belongs to exactly one user.
- The table may contain duplicate rows.

---

## 🧾 Problem Statement

Write a SQL query to **report the daily active user count** for the **30-day period ending on 2019-07-27** (inclusive).  
A user is considered **active** on a day if they perform **at least one activity** on that day.

Return the result table in **any order**.

---

## 💡 Example

### 🔹 Input:

**Activity table:**

| user_id | session_id | activity_date | activity_type |
|---------|------------|----------------|----------------|
| 1       | 1          | 2019-07-20     | open_session   |
| 1       | 1          | 2019-07-20     | scroll_down    |
| 1       | 1          | 2019-07-20     | end_session    |
| 2       | 4          | 2019-07-20     | open_session   |
| 2       | 4          | 2019-07-21     | send_message   |
| 2       | 4          | 2019-07-21     | end_session    |
| 3       | 2          | 2019-07-21     | open_session   |
| 3       | 2          | 2019-07-21     | send_message   |
| 3       | 2          | 2019-07-21     | end_session    |
| 4       | 3          | 2019-06-25     | open_session   |
| 4       | 3          | 2019-06-25     | end_session    |

---

### 🔸 Output:

| day        | active_users |
|------------|---------------|
| 2019-07-20 | 2             |
| 2019-07-21 | 2             |

---

## 🧠 Explanation

- On **2019-07-20**, users `1` and `2` were active.
- On **2019-07-21**, users `2` and `3` were active.
- Only days **within the last 30 days ending 2019-07-27** are considered.
- Days with **zero active users** are excluded from the result.

---

## ✅ SQL Solution

```sql
SELECT
  activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE('2019-07-27') - INTERVAL 29 DAY AND '2019-07-27'
GROUP BY activity_date;
