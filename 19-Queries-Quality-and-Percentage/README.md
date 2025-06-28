# Day 19 - Queries Quality and Percentage

**LeetCode Problem:** [1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage)  
**Difficulty:** Easy

---

## 🧾 Table: Queries

| Column Name | Type    |
|-------------|---------|
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |

- This table may contain duplicate rows.
- `position` is between 1 and 500.
- `rating` is between 1 and 5.
- A query is considered **poor** if its `rating < 3`.

---

## 📌 Problem Statement

Write an SQL query to calculate:

- `quality`: average of `(rating / position)` for each `query_name`
- `poor_query_percentage`: percentage of queries with `rating < 3`

Return both values **rounded to 2 decimal places**.

📌 Return the result in **any order**.

---

## 💡 Example

### Input

**Queries table**

| query_name | result            | position | rating |
|------------|-------------------|----------|--------|
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |

---

### Output

| query_name | quality | poor_query_percentage |
|------------|---------|-----------------------|
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |

---

## 🧠 Explanation

- **Dog**:
  - Quality = (5/1 + 5/2 + 1/200) / 3 = **2.50**
  - Poor % = (1 poor / 3 total) * 100 = **33.33%**

- **Cat**:
  - Quality = (2/5 + 3/3 + 4/7) / 3 ≈ **0.66**
  - Poor % = (1 poor / 3 total) * 100 = **33.33%**

---

## 🧮 SQL Solution

```sql
SELECT 
  query_name,
  ROUND(AVG(rating * 1.0 / position), 2) AS quality,
  ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
