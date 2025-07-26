# 1341. Movie Rating

## 🔍 Problem Description

We are given three tables:

### 🎬 Movies

| Column Name | Type    |
|-------------|---------|
| movie_id    | int     |
| title       | varchar |

- `movie_id` is the primary key.
- Contains information about each movie.

### 👤 Users

| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| name        | varchar |

- `user_id` is the primary key.
- The `name` column has unique values.

### ⭐ MovieRating

| Column Name | Type    |
|-------------|---------|
| movie_id    | int     |
| user_id     | int     |
| rating      | int     |
| created_at  | date    |

- `(movie_id, user_id)` is the primary key.
- Stores each user's rating of a movie and the date of the review.

---

## 🧠 Objective

You need to find:

1. The **user name** who has rated the **greatest number of movies**. If there's a tie, return the **lexicographically smaller name**.
2. The **movie name** with the **highest average rating in February 2020**. Again, if there's a tie, return the **lexicographically smaller title**.

---

## ✅ Example

### Input

**Movies Table:**

| movie_id | title     |
|----------|-----------|
| 1        | Avengers  |
| 2        | Frozen 2  |
| 3        | Joker     |

**Users Table:**

| user_id | name    |
|---------|---------|
| 1       | Daniel  |
| 2       | Monica  |
| 3       | Maria   |
| 4       | James   |

**MovieRating Table:**

| movie_id | user_id | rating | created_at |
|----------|---------|--------|------------|
| 1        | 1       | 3      | 2020-01-12 |
| 1        | 2       | 4      | 2020-02-11 |
| 1        | 3       | 2      | 2020-02-12 |
| 1        | 4       | 1      | 2020-01-01 |
| 2        | 1       | 5      | 2020-02-17 |
| 2        | 2       | 2      | 2020-02-01 |
| 2        | 3       | 2      | 2020-03-01 |
| 3        | 1       | 3      | 2020-02-22 |
| 3        | 2       | 4      | 2020-02-25 |

---

### Output

| results     |
|-------------|
| Daniel      |
| Frozen 2    |

---

## 💡 Explanation

- **User with most ratings:**  
  Daniel and Monica have both rated 3 movies, but "Daniel" comes before "Monica" lexicographically.
  
- **Movie with highest average rating in Feb 2020:**  
  - *Frozen 2*: (5 + 2) / 2 = 3.5  
  - *Joker*: (3 + 4) / 2 = 3.5  
  - *Avengers*: (4 + 2) / 2 = 3.0  
  => Highest average rating is 3.5, but *Frozen 2* comes first lexicographically.

---

## 🧾 SQL Solution

```sql
-- User with the most ratings
SELECT name AS results
FROM Users
JOIN MovieRating ON Users.user_id = MovieRating.user_id
GROUP BY name
ORDER BY COUNT(*) DESC, name ASC
LIMIT 1

UNION ALL

-- Movie with highest average rating in Feb 2020
SELECT title AS results
FROM Movies
JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY title
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1;
