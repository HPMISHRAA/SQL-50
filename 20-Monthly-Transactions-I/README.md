# Day 20 - Monthly Transactions I

**LeetCode Problem:** [1164. Monthly Transactions I](https://leetcode.com/problems/monthly-transactions-i)

---

## 📊 Table: Transactions

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| country     | varchar |
| state       | enum    |
| amount      | int     |
| trans_date  | date    |

- `id` is the primary key.
- `state` is an enum with values: `["approved", "declined"]`.
- Each row contains a transaction record for a given country.

---

## 🧩 Problem Statement

Write a SQL query to find the following for **each month** and **each country**:
- Total number of transactions (`trans_count`)
- Total transaction amount (`trans_total_amount`)
- Total number of approved transactions (`approved_count`)
- Total approved transaction amount (`approved_total_amount`)

Return the result table with:
- `month` in `YYYY-MM` format
- Results grouped by month and country

The output can be returned in any order.

---

## 📥 Example Input

### Transactions Table:

| id  | country | state    | amount | trans_date |
|-----|---------|----------|--------|------------|
| 121 | US      | approved | 1000   | 2018-12-18 |
| 122 | US      | declined | 2000   | 2018-12-19 |
| 123 | US      | approved | 2000   | 2019-01-01 |
| 124 | DE      | approved | 2000   | 2019-01-07 |

---

## 📤 Example Output

| month   | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
|---------|---------|-------------|----------------|--------------------|-----------------------|
| 2018-12 | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01 | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01 | DE      | 1           | 1              | 2000               | 2000                  |

---

## ✅ SQL Solution

```sql
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    month, country;
