# Day 7 - Not Boring Movies

**LeetCode Problem:** [620. Not Boring Movies](https://leetcode.com/problems/not-boring-movies/)

---

## Table: Cinema

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| movie       | varchar |
| description | varchar |
| rating      | float   |

- `id` is the primary key.
- Each row contains the name of a movie, its description, and a rating.
- `rating` is a float value (2 decimal places) between 0 and 10.

---

## Problem Statement

Write a SQL query to report all **movies** that:
- Have an **odd-numbered `id`**, and
- Have a `description` **not equal to** "boring"

Return the result **ordered by `rating` in descending order**.

---

## Example:

**Input:**

**Cinema table:**

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

---

**Output:**

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

---

## Explanation

- Movies with **odd-numbered IDs** are: 1, 3, and 5.
- Movie with ID = 3 has the description `"boring"` → ❌ Excluded
- Remaining valid movies are sorted by `rating` in descending order.

---
