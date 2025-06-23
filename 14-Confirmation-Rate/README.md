# 📩 SQL Challenge: Confirmation Rate of Each User

## 📄 Problem Statement

Write a SQL query to calculate the **confirmation rate** for each user.

- A confirmation rate is defined as:  
  **number of 'confirmed' messages / total confirmation requests**  
- If a user made **no requests**, the rate should be **0.00**.
- The result should show each `user_id` along with their rounded `confirmation_rate` (rounded to **two decimal places**).

---

## 🧮 Table Schema

### 🧾 Signups

| Column Name | Type     | Description                     |
|-------------|----------|---------------------------------|
| user_id     | int      | Unique user ID (Primary Key)    |
| time_stamp  | datetime | Signup time of the user         |

---

### 📬 Confirmations

| Column Name | Type     | Description                                     |
|-------------|----------|-------------------------------------------------|
| user_id     | int      | References Signups.user_id                     |
| time_stamp  | datetime | Time of confirmation or timeout                 |
| action      | ENUM     | Either 'confirmed' or 'timeout'                |

Primary Key: (`user_id`, `time_stamp`)

---

## 🧪 Example Input

### Signups

| user_id | time_stamp          |
|---------|---------------------|
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |

### Confirmations

| user_id | time_stamp          | action    |
|---------|---------------------|-----------|
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |

---

## ✅ Expected Output

| user_id | confirmation_rate |
|---------|-------------------|
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |

---

## 💡 SQL Query

```sql
SELECT 
    s.user_id,
    ROUND(
        IFNULL(SUM(c.action = 'confirmed') / COUNT(c.user_id), 0),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;
