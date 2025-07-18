# 1164. Product Price at a Given Date

## 📘 Problem Description

**Table: Products**

| Column Name   | Type |
|---------------|------|
| product_id    | int  |
| new_price     | int  |
| change_date   | date |

- (product_id, change_date) is the **primary key**.
- Each row indicates that the price of a product was changed to `new_price` on `change_date`.
- Initially, **all products have a price of 10**.

---

## 🎯 Objective

Find the **price of all products on `2019-08-16`**.

- If a product had **no price change before or on 2019-08-16**, the price remains **10**.
- If it had **multiple price changes**, return the latest price **on or before 2019-08-16**.

---

## ✅ Example

### Input

**Products Table:**

| product_id | new_price | change_date |
|------------|-----------|-------------|
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |

### Output

| product_id | price |
|------------|-------|
| 1          | 35    |
| 2          | 50    |
| 3          | 10    |

---

## 🧠 Key Concepts Used

- Subqueries with `MAX(change_date)` to get latest change
- Handling default values for products without updates
- Filtering with `WHERE change_date <= '2019-08-16'`
- Joining result with distinct product list to include all products

---

## 🧾 SQL Solution

```sql
SELECT p.product_id,
       COALESCE(
         (SELECT new_price
          FROM Products p2
          WHERE p2.product_id = p.product_id
            AND p2.change_date <= '2019-08-16'
          ORDER BY p2.change_date DESC
          LIMIT 1), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;
