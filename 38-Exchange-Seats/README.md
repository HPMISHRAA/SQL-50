# 626. Exchange Seats

## 🔍 Problem Description

**Table: Seat**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| student     | varchar |

- `id` is the primary key.
- Each row indicates a student and their seat id.
- The id sequence starts from 1 and increments continuously.

---

## 🧠 Objective

Swap the seat id of every **two consecutive students**.  
If the total number of students is **odd**, the last student **remains in the same seat**.

Return the result **ordered by `id` in ascending order**.

---

## ✅ Example

### Input

**Seat Table:**

| id | student |
|----|---------|
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |

---

### Output

| id | student |
|----|---------|
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |

---

## 💡 Explanation

- Swap seat 1 & 2 → Doris and Abbot switch seats
- Swap seat 3 & 4 → Green and Emerson switch seats
- Seat 5 remains unchanged because it's the last and odd-positioned

---

## 🧾 SQL Solution (Logic)

To implement this:

- If `id` is **odd** and **next seat exists**, shift the student from next seat.
- If `id` is **even**, shift the student from previous seat.
- If `id` is the last and odd with no next seat → keep same.

```sql
SELECT
    CASE
        WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;
