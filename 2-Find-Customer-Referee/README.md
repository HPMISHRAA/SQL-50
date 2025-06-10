 Day 2 - Find Customer Referee

LeetCode Problem: [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)

---

 Table: Customer

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| referee_id  | int     |

- `id` is the primary key.
- Each row represents a customer’s name and the `referee_id` of the person who referred them.

---

 Problem Statement:

Find the names of the customers **not referred by the customer with id = 2**.

Return the result table in any order.

---

 Example:

 Input:

Customer table:

| id | name | referee_id |
|----|------|------------|
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |

---

 Output:

| name |
|------|
| Will |
| Jane |
| Bill |
| Zack |

---

 Explanation:

Alex and Mark were referred by customer `id = 2`, so they are excluded.
