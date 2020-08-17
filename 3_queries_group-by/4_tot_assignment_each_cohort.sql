-- Get the total number of assignment submissions for each cohort.
SELECT cohorts.name as cohort, COUNT(assignment_submissions.id) as total_submissions
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY COUNT(assignment_submissions.id) DESC;