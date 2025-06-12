 Day 4 - Article Views I

LeetCode Problem: [1148. Article Views I](https://leetcode.com/problems/article-views-i/)

---

 Table: Views

| Column Name | Type    |
|-------------|---------|
| article_id  | int     |
| author_id   | int     |
| viewer_id   | int     |
| view_date   | date    |

- `article_id` is the ID of the article.
- `author_id` is the ID of the user who wrote the article.
- `viewer_id` is the ID of the user who viewed the article.
- `view_date` is the date when the article was viewed.
- A user may view the same article more than once per day.

---

 Problem Statement

Write a SQL query to **find all the authors who viewed their own articles.

Return the result table in **any order** without duplicates.

---

 Example:

Input:

| article_id | author_id | viewer_id | view_date  |
|------------|-----------|-----------|------------|
| 1          | 3         | 5         | 2019-08-01 |
| 3          | 4         | 4         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |

---

Output:

| id |
|----|
| 4  |
| 7  |

---

 Explanation

- User 4 viewed their own article (article_id 3) on both 2019-08-01 and 2019-07-21.
- User 7 viewed their own article (article_id 2) on 2019-08-01.
- The result should list each such user **only once.

---
