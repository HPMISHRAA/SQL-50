 Day 1 - Recyclable and Low Fat Products

 Table: Products

| Column Name | Type  |
|-------------|-------|
| product_id  | int   |
| low_fats    | enum  |
| recyclable  | enum  |

- `product_id` is the primary key (unique values) for this table.
- `low_fats` is an ENUM of type ('Y', 'N'), where 'Y' means low fat and 'N' means not.
- `recyclable` is an ENUM of type ('Y', 'N'), where 'Y' means recyclable and 'N' means not.

---

 Problem Statement:

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

---

 Example 1:

Input: 
Products table:

| product_id | low_fats | recyclable |
|------------|----------|------------|
| 0          | Y        | N          |
| 1          | Y        | Y          |
| 2          | N        | Y          |
| 3          | Y        | Y          |
| 4          | N        | N          |

Output:

| product_id |
|------------|
| 1          |
| 3          |

Explanation: Only products 1 and 3 are both low fat and recyclable.
