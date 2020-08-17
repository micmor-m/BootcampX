-- Get the total number of assignments for each day of bootcamp.
-- but only return rows where total assignments is greater than or equal to 10.
SELECT day, COUNT(assignments.id) as total_assignment
FROM assignments
GROUP BY day
HAVING COUNT(assignments.id) >= 10
ORDER BY day;