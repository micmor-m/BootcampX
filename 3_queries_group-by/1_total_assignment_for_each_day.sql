-- Get the total number of assignments for each day of bootcamp.
SELECT day, COUNT(assignments.id) as total_assignment
FROM assignments
GROUP BY day
ORDER BY day;
