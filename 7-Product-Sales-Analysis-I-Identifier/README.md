 📊 SQL Query: Join Sales and Product Tables to Retrieve Sale Information

 🧾 Problem Statement

You are given two tables:

1. Sales
2. Product

Write a SQL query to report the `product_name`, `year`, and `price` for each record in the Sales table.

---

 📌 Table Structure

 🛒 Sales Table

| Column Name | Type |
|-------------|------|
| sale_id     | int  |
| product_id  | int  |
| year        | int  |
| quantity    | int  |
| price       | int  |

- Primary Key: `(sale_id, year)`
- `product_id` is a foreign key referencing the `Product` table.
- `price` is per unit.

---

 📦 Product Table

| Column Name  | Type    |
|--------------|---------|
| product_id   | int     |
| product_name | varchar |

- Primary Key: `product_id`

---

 🎯 Objective

Generate a result table with the following columns:
- `product_name`
- `year`
- `price`

---

 🧪 Sample Input

 Sales Table

| sale_id | product_id | year | quantity | price |
|---------|------------|------|----------|-------|
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

 Product Table

| product_id | product_name |
|------------|--------------|
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

---
 ✅ Expected Output

| product_name | year | price |
|--------------|------|-------|
| Nokia        | 2008 | 5000  |
| Nokia        | 2009 | 5000  |
| Apple        | 2011 | 9000  |

---

