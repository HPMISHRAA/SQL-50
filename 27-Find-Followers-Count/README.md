# Day 26 - Find Followers Count

**LeetCode Problem:** [1729. Find Followers Count](https://leetcode.com/problems/find-followers-count)

---

## 🧾 Table: Followers

| Column Name | Type |
|-------------|------|
| user_id     | int  |
| follower_id | int  |

- `(user_id, follower_id)` is the primary key.
- This table contains the IDs of a user and a follower in a social media app.
- Each row means `follower_id` follows `user_id`.

---

## 📌 Problem Statement

Write an SQL query to return, for each user, the number of followers they have.

Return the result table **ordered by `user_id` in ascending order**.

---

## 💡 Example:

### 👇 Input:

**Followers table:**

| user_id | follower_id |
|---------|-------------|
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |

---

### 📤 Output:

| user_id | followers_count |
|---------|------------------|
| 0       | 1                |
| 1       | 1                |
| 2       | 2                |

---

## 🧠 Explanation:

- User `0` has 1 follower → {1}
- User `1` has 1 follower → {0}
- User `2` has 2 followers → {0, 1}

---

## 🧮 SQL Solution

```sql
SELECT 
    user_id, 
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
