# 1907. Count Salary Categories

## 📘 Problem Description

**Table: Accounts**

| Column Name | Type |
|-------------|------|
| account_id  | int  |
| income      | int  |

- `account_id` is the primary key.
- Each row contains the monthly income of one bank account.

---

## 🎯 Objective

Write an SQL query to **count the number of accounts** in each of the following salary categories:

- **Low Salary**: Income **< 20000**
- **Average Salary**: Income **between 20000 and 50000** (inclusive)
- **High Salary**: Income **> 50000**

The output must contain all three categories, even if a category has 0 accounts.

---

## 🧪 Example

**Input:**

Accounts table:
| account_id | income |
|------------|--------|
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |

**Output:**

| category       | accounts_count |
|----------------|----------------|
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |

**Explanation:**
- Low Salary: Only account 2
- High Salary: Accounts 3, 6, and 8
- Average Salary: None

---

## ✅ SQL Solution

```sql
SELECT 'Low Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION

SELECT 'Average Salary',
       COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION

SELECT 'High Salary',
       COUNT(*)
FROM Accounts
WHERE income > 50000;
