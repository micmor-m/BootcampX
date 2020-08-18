-- Get the total number of assistance_requests for a student.
SELECT COUNT(assistance_requests.id) as total_assistances, students.name
FROM students
JOIN assistance_requests ON (students.id = assistance_requests.student_id)
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;