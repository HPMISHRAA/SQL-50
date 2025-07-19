# 🚌 Last Person to Fit in the Bus

## 📄 Problem Description

**Table: `Queue`**

| Column Name | Type    |
|-------------|---------|
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |

- `person_id` is the unique identifier for each person.
- `turn` determines the boarding order (1 = first to board).
- The bus has a maximum weight limit of **1000 kg**.
- People board **one at a time** in order of their `turn`.

---

## 🧠 Objective

Write an SQL query to return the **name of the last person** who can **board the bus without exceeding** the **total weight limit** of 1000 kilograms.

- Only one person boards at a time.
- Once the weight limit is **reached or exceeded**, no one else can board.
- Return the `person_name` of the **last person** who successfully boards.

---

## ✅ Example

### Input

**Queue Table:**

| person_id | person_name | weight | turn |
|-----------|-------------|--------|------|
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |

### Process (sorted by `turn`):

| Turn | Name      | Weight | Cumulative Weight |
|------|-----------|--------|-------------------|
| 1    | Alice     | 250    | 250               |
| 2    | Alex      | 350    | 600               |
| 3    | John Cena | 400    | 1000 ✅            |
| 4    | Marie     | 200    | 1200 ❌ (exceeds)  |

---

### Output

```text
+-------------+
| person_name |
+-------------+
| John Cena   |
+-------------+
