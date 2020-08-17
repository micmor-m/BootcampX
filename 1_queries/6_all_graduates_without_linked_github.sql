-- Get all graduates without a linked Github account.
SELECT name, email, phone
  FROM students
  WHERE end_date < current_date AND github IS NULL;
