-- Get the total number of assistance_requests for a teacher.
SELECT COUNT(assistance_requests.id) as total_assistances, teachers.name
FROM teachers
JOIN assistance_requests ON (teachers.id = assistance_requests.teacher_id)
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;