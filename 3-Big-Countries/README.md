 Day 3 - Big Countries

LeetCode Problem: [595. Big Countries](https://leetcode.com/problems/big-countries/)

---

Table: World

| Column Name | Type    |
|-------------|---------|
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |

- `name` is the primary key.
- Each row gives information about the name of a country, the continent it belongs to, its area, population, and GDP.

---

Problem Statement

A country is considered big if:
- Its `area` is at least 3 million (i.e., 3000000 km²), OR
- Its `population` is at least 25 million (i.e., 25000000).

Write a SQL query to find the name, population, and area of the big countries.

Return the result table in any order.

---

 Example:

Input (World table):

| name        | continent | area    | population | gdp          |
|-------------|-----------|---------|------------|--------------|
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |

---

Output:

| name        | population | area    |
|-------------|------------|---------|
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |

---

Explanation

- Afghanistan is included because its population is over 25 million.
- Algeria is included because its population is over 25 million.
