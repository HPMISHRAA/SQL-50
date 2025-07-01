# Day 22 - Fraction of Players Logged In Again the Next Day

**LeetCode Problem:** [550. Game Play Analysis III](https://leetcode.com/problems/game-play-analysis-iii)

---

## 🧾 Table: Activity

| Column Name  | Type    |
|--------------|---------|
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |

- `(player_id, event_date)` is the **primary key**.
- Each row records a player's login activity on a specific date with the number of games played.

---

## 📌 Problem Statement

Write an SQL query to report the **fraction of players** that **logged in again on the day after their first login**, rounded to **2 decimal places**.

Return the result using the following column:
- `fraction`: the percentage of such players over all players.

---

## 💡 Example:

### 👇 Input:

**Activity table:**

| player_id | device_id | event_date | games_played |
|-----------|-----------|------------|--------------|
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |

### 📤 Output:

| fraction |
|----------|
| 0.33     |

---

## 🧠 Explanation

- Player 1 logged in on `2016-03-01` (first login) and again on `2016-03-02` (next day) ✅
- Player 2 and 3 did **not** log in the day after their first login ❌
- So, only 1 out of 3 players satisfies the condition → `1/3 = 0.33`

---

## 🧮 SQL Solution

```sql
SELECT
  ROUND(COUNT(DISTINCT a.player_id) / COUNT(DISTINCT first_login.player_id), 2) AS fraction
FROM Activity a
JOIN (
  SELECT player_id, MIN(event_date) AS first_login_date
  FROM Activity
  GROUP BY player_id
) first_login
ON a.player_id = first_login.player_id
AND a.event_date = DATE_ADD(first_login.first_login_date, INTERVAL 1 DAY);
