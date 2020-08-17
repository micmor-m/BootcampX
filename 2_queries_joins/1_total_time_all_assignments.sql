-- Get the total amount of time that a student has spent on all assignments.
--  use 'Ibrahim Schimmel'
SELECT SUM(assignment_submissions.duration) as total_duration
  FROM assignments 
  JOIN assignment_submissions ON assignments.id = assignment_submissions.assignment_id
  JOIN students ON students.id = assignment_submissions.student_id
  WHERE students.name = 'Ibrahim Schimmel';
