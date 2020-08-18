-- Get the name of all teachers that performed an assistance request during a cohort.
SELECT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON (teachers.id=assistance_requests.teacher_id)
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE teachers.id IN (assistance_requests.teacher_id) AND cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;