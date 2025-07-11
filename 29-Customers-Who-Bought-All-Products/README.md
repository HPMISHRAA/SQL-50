# 💡 LeetCode SQL - 1045. Customers Who Bought All Products

## 🧩 Problem Description

Table: `Customer`

| Column Name | Type |
|-------------|------|
| customer_id | int  |
| product_key | int  |

- This table may contain duplicate rows.
- `customer_id` is not NULL.
- `product_key` is a foreign key referencing `Product.product_key`.

Table: `Product`

| Column Name | Type |
|-------------|------|
| product_key | int  |

- `product_key` is the primary key.

---

## 📚 Task

Write an SQL query to report the **customer IDs** of customers who bought **all** the products listed in the `Product` table.

---

## 🧪 Example

### 🧾 Input

**Customer table:**

| customer_id | product_key |
|-------------|-------------|
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |

**Product table:**

| product_key |
|-------------|
| 5           |
| 6           |

---

### 📤 Output

| customer_id |
|-------------|
| 1           |
| 3           |

---

## 🧠 Explanation

- Product list = {5, 6}
- Customers who bought both products:
  - Customer `1` → ✅ Bought 5 & 6
  - Customer `3` → ✅ Bought 5 & 6
  - Customer `2` → ❌ Bought only 6

Hence, only customer IDs 1 and 3 are returned.

---

## 🧮 SQL Solution

```sql
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
