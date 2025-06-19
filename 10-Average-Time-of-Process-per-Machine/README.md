 📊 LeetCode SQL #1661: Average Time of Process per Machine

 📘 Problem Description

The `Activity` table shows user activities for a factory website. Each machine runs several processes, and each process has two entries in the table: one for `start` and one for `end`.

---

 🧾 Table: `Activity`

| Column Name    | Type    | Description                                                  |
|----------------|---------|--------------------------------------------------------------|
| machine_id     | int     | ID of the machine                                            |
| process_id     | int     | ID of the process on the machine                             |
| activity_type  | enum    | `'start'` or `'end'` indicating the type of activity         |
| timestamp      | float   | Time in seconds when the activity occurred                   |

- Primary key: (`machine_id`, `process_id`, `activity_type`)
- Each process has exactly one `'start'` and one `'end'` activity.
- The `'start'` timestamp is guaranteed to be **before** the `'end'` timestamp.

---

 🎯 Objective

Write an SQL query to calculate the average processing time for each machine.

- Processing time for a process is:  
  `end.timestamp - start.timestamp`

- Average time per machine is:  
  `total processing time of all processes / number of processes`

Return a result with:

| machine_id | processing_time |
|------------|-----------------|

- `processing_time` must be rounded to 3 decimal places.
- You may return the result in **any order**.

---

 🧪 Example

 🔹 Input

Activity Table:

| machine_id | process_id | activity_type | timestamp |
|------------|------------|----------------|-----------|
|     0      |     0      |     start      |  0.712    |
|     0      |     0      |     end        |  1.520    |
|     0      |     1      |     start      |  3.140    |
|     0      |     1      |     end        |  4.120    |
|     1      |     0      |     start      |  0.550    |
|     1      |     0      |     end        |  1.550    |
|     1      |     1      |     start      |  0.430    |
|     1      |     1      |     end        |  1.420    |
|     2      |     0      |     start      |  4.100    |
|     2      |     0      |     end        |  4.512    |
|     2      |     1      |     start      |  2.500    |
|     2      |     1      |     end        |  5.000    |

---

 🔹 Output

| machine_id | processing_time |
|------------|-----------------|
|     0      |      0.894      |
|     1      |      0.995      |
|     2      |      1.456      |

---

 💡 Explanation

Each machine runs exactly 2 processes.

- Machine `0`:  
