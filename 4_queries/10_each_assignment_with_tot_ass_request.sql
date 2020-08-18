
-- List each assignment with the total number of assistance requests with it.
SELECT assignments.id, name, day, chapter, COUNT(assistance_requests.id) as total_requests
FROM assistance_requests
JOIN assignments ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;