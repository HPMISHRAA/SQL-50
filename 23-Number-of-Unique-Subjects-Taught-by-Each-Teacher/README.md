# Day 23 - Number of Unique Subjects Taught by Each Teacher

**LeetCode Problem:** [2356. Number of Unique Subjects Taught by Each Teacher](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher)

---

## 🧾 Table: Teacher

| Column Name | Type |
|-------------|------|
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |

- `(subject_id, dept_id)` is the **primary key**.
- Each row indicates that a teacher teaches a subject in a particular department.

---

## 📌 Problem Statement

Write an SQL query to **calculate the number of unique subjects** each teacher teaches at the university.

Return the result table **in any order**.

---

## 💡 Example

### 👇 Input:

**Teacher table:**

| teacher_id | subject_id | dept_id |
|------------|------------|---------|
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |

---

### 📤 Output:

| teacher_id | cnt |
|------------|-----|
| 1          | 2   |
| 2          | 4   |

---

## 🧠 Explanation

- **Teacher 1** teaches subject `2` in multiple departments, but we only count unique `subject_id`s. So: `2 subjects` → (2, 3)
- **Teacher 2** teaches 4 different subjects → (1, 2, 3, 4)

---

## 🧮 SQL Solution

```sql
SELECT 
  teacher_id,
  COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
