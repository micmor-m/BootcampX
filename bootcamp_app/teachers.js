// /Connect to the bootcampx database
//using a Pool is the preferred way to query with node-postgres
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const [, , cohort] = process.argv;

// Get the name of all teachers that performed an assistance request during a cohort.
pool.query(`
SELECT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON (teachers.id=assistance_requests.teacher_id)
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE teachers.id IN (assistance_requests.teacher_id) AND cohorts.name = '${cohort}'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));