-- Perform the same query as before, but include the number of assistances as well.
SELECT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.teacher_id) as total_assistances
FROM teachers
JOIN assistance_requests ON (teachers.id=assistance_requests.teacher_id)
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;