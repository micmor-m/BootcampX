-- Get the cohort with the longest average duration of assistance requests.
SELECT cohorts.name, AVG(completed_at-started_at) as average_assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
JOIN assignments ON assignments.id = assignment_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;