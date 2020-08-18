-- Calculate the average total duration of assistance requests for each cohort.
-- always remember that the return from the inner select is still a table 
-- even if it has only one column so always add dot in the outer select
SELECT AVG(per_cohort.total_duration) as average_assistance_time
FROM ( 
SELECT SUM(completed_at-started_at) as total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_duration)
as per_cohort;