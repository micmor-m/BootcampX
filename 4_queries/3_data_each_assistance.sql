
-- Get important data about each assistance request.
-- SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, assistance_requests.completed_at - assistance_requests.started_at as duration
-- FROM students
-- FULL OUTER JOIN assistance_requests ON (students.id = assistance_requests.student_id)
-- FULL OUTER JOIN teachers ON (teachers.id = assistance_requests.teacher_id)
-- FULL OUTER JOIN assignments ON (assignments.id = assistance_requests.assignment_id)
-- GROUP BY assistance_requests.completed_at - assistance_requests.started_at, assignments.name, teachers.name, students.name
-- ORDER BY assistance_requests.completed_at - assistance_requests.started_at;


SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at-started_at) as duration
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;