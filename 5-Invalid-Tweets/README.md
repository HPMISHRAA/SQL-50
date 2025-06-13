 Day 5 - Invalid Tweets

LeetCode Problem: [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)

---

 Table: Tweets

| Column Name | Type    |
|-------------|---------|
| tweet_id    | int     |
| content     | varchar |

- `tweet_id` is the primary key (unique).
- `content` consists of alphanumeric characters, `'!'`, or a space `' '`.
- No other special characters are allowed.
- This table contains all the tweets in a social media app.

---

 Problem Statement

Write a SQL query to find the **IDs of the invalid tweets**.  
A tweet is considered **invalid** if the number of characters in the content is **strictly greater than 15**.

Return the result table in **any order**.

---

 Example:

Input:

| tweet_id | content                           |
|----------|-----------------------------------|
| 1        | Let us Code                       |
| 2        | More than fifteen chars are here! |

---

Output:

| tweet_id |
|----------|
| 2        |

---

 Explanation

- Tweet 1 has a content length of 11 → ✅ Valid
- Tweet 2 has a content length of 33 → ❌ Invalid

Therefore, only tweet ID 2 should be returned.
