 🛍️ SQL Project: Find Users Who Visited Without Transactions

This SQL project focuses on identifying the customers who visited a mall without making any transactions, and counting how many times they made such visits.

---

 🧾 Table: Visits

This table contains information about customers who visited the mall.

| Column Name | Type | Description                        |
|-------------|------|------------------------------------|
| visit_id    | int  | Unique ID for each visit           |
| customer_id | int  | ID of the customer who visited     |

- `visit_id` is the column with unique values for this table.

---

 💳 Table: Transactions

This table contains information about the transactions made during the visit.

| Column Name    | Type | Description                            |
|----------------|------|----------------------------------------|
| transaction_id | int  | Unique ID for each transaction         |
| visit_id       | int  | Visit during which transaction occurred |
| amount         | int  | Amount spent during the transaction    |

- `transaction_id` is the column with unique values for this table.

---

 ❓ Task

Write a solution to **find the IDs of the users who visited the mall without making any transactions and the number of times they made such visits.

- Return the result table in any order.
- Result format should match the example provided below.

---

 📥 Example Input

 Visits

| visit_id | customer_id |
|----------|-------------|
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

 Transactions

| transaction_id | visit_id | amount |
|----------------|----------|--------|
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

---

 ✅ Expected Output

| customer_id | count_no_trans |
|-------------|----------------|
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |

---

 🔍 Explanation

- Customer with `id = 23` visited once (`visit_id = 1`) and made a transaction (`transaction_id = 12`).
- Customer with `id = 9` visited once (`visit_id = 2`) and made a transaction (`transaction_id = 13`).
- Customer with `id = 30` visited once (`visit_id = 4`) and made **no transaction** → count = 1
- Customer with `id = 54` visited **3 times** (`visit_id = 5`, `7`, `8`), and only one of those visits (`visit_id = 5`) had transactions → count = 2
- Customer with `id = 96` visited once (`visit_id = 6`) and made **no transaction** → count = 1

