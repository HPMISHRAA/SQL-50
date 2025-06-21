 📘 SQL Challenge: Exam Attendance Count

 🧾 Problem Statement

Write a SQL query to find the number of times each student attended each subject's exam.

The result should show:
- Each student (`student_id`, `student_name`)
- Each subject (`subject_name`)
- Count of exam attendances (`attended_exams`)

Even if a student never attended a subject's exam, their attendance should be shown as `0`.

---

 🧮 Tables Description

 👨‍🎓 Students

| Column Name   | Type    | Description                      |
|---------------|---------|----------------------------------|
| student_id    | int     | Primary key                      |
| student_name  | varchar | Name of the student              |

---

 📘 Subjects

| Column Name  | Type    | Description                      |
|--------------|---------|----------------------------------|
| subject_name | varchar | Primary key                      |

---

 📝 Examinations

| Column Name  | Type    | Description                                      |
|--------------|---------|--------------------------------------------------|
| student_id   | int     | References Students.student_id                  |
| subject_name | varchar | References Subjects.subject_name (not unique)   |

This table contains multiple rows for each exam a student attended.

---

 🧪 Example Input

 Students

| student_id | student_name |
|------------|---------------|
| 1          | Alice         |
| 2          | Bob           |
| 13         | John          |
| 6          | Alex          |

 Subjects

| subject_name |
|--------------|
| Math         |
| Physics      |
| Programming  |

 Examinations

| student_id | subject_name |
|------------|--------------|
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |

---

 ✅ Expected Output

| student_id | student_name | subject_name | attended_exams |
|------------|---------------|--------------|----------------|
| 1          | Alice         | Math         | 3              |
| 1          | Alice         | Physics      | 2              |
| 1          | Alice         | Programming  | 1              |
| 2          | Bob           | Math         | 1              |
| 2          | Bob           | Physics      | 0              |
| 2          | Bob           | Programming  | 1              |
| 6          | Alex          | Math         | 0              |
| 6          | Alex          | Physics      | 0              |
| 6          | Alex          | Programming  | 0              |
| 13         | John          | Math         | 1              |
| 13         | John          | Physics      | 1              |
| 13         | John          | Programming  | 1              |

---

 💡 SQL Query

```sql
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
