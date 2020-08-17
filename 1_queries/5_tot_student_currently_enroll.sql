-- Get all of the students currently enrolled.
SELECT name, id, cohort_id
  FROM students
  WHERE start_date < current_date AND end_date IS NULL
  ORDER BY cohort_id;
