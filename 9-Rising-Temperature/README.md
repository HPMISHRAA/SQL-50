 Weather Temperature Comparison

 Problem Statement

You are given a table `Weather` with the following schema:

| Column Name  | Type   |
|--------------|--------|
| id           | int    |
| recordDate   | date   |
| temperature  | int    |

- `id` is unique for each row.
- No two rows have the same `recordDate`.
- The table stores temperature information for each day.

---

 Task

Write a query to find all dates' `id` where the temperature is higher than the previous date's (yesterday's) temperature.

Return the result in any order.

---

 Example

 Input Table: Weather

| id | recordDate  | temperature |
|----|-------------|-------------|
| 1  | 2015-01-01  | 10          |
| 2  | 2015-01-02  | 25          |
| 3  | 2015-01-03  | 20          |
| 4  | 2015-01-04  | 30          |

 Output:

| id |
|----|
| 2  |
| 4  |

 Explanation:

- On `2015-01-02`, the temperature (25) was higher than the previous day (10).
- On `2015-01-04`, the temperature (30) was higher than the previous day (20).

---

This problem helps in understanding how to compare rows based on date values and how to use SQL joins or window functions effectively.
