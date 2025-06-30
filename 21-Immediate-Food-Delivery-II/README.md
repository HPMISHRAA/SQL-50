# Day 21 - Immediate Food Delivery I

**LeetCode Problem:** [1173. Immediate Food Delivery I](https://leetcode.com/problems/immediate-food-delivery-i)

---

## 📊 Table: Delivery

| Column Name                  | Type |
|-----------------------------|------|
| delivery_id                 | int  |
| customer_id                 | int  |
| order_date                  | date |
| customer_pref_delivery_date | date |

- `delivery_id` is the primary key.
- The table contains food delivery orders, including the preferred delivery date by customers.

---

## 🧠 Problem Statement

An order is called **immediate** if the `order_date` is **equal** to the `customer_pref_delivery_date`, else it's **scheduled**.

The **first order of a customer** is the one with the **earliest `order_date`**. Each customer has exactly one first order.

Write an SQL query to find the **percentage of immediate orders** among all **first orders** of customers, rounded to **2 decimal places**.

---

## 📝 Example

### 🎯 Input

**Delivery Table**

| delivery_id | customer_id | order_date | customer_pref_delivery_date |
|-------------|-------------|------------|------------------------------|
| 1           | 1           | 2019-08-01 | 2019-08-02                   |
| 2           | 2           | 2019-08-02 | 2019-08-02                   |
| 3           | 1           | 2019-08-11 | 2019-08-12                   |
| 4           | 3           | 2019-08-24 | 2019-08-24                   |
| 5           | 3           | 2019-08-21 | 2019-08-22                   |
| 6           | 2           | 2019-08-11 | 2019-08-13                   |
| 7           | 4           | 2019-08-09 | 2019-08-09                   |

---

### ✅ Output

| immediate_percentage |
|----------------------|
| 50.00                |

---

## 📘 Explanation

- First orders:
  - Customer 1 → ID 1 → **Scheduled**
  - Customer 2 → ID 2 → **Immediate**
  - Customer 3 → ID 5 → **Scheduled**
  - Customer 4 → ID 7 → **Immediate**

Out of 4 customers, 2 had immediate orders:  
\[(2 / 4) * 100 = 50.00%\]

---

## 💻 SQL Solution

```sql
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
  SELECT customer_id, MIN(order_date)
  FROM Delivery
  GROUP BY customer_id
);
