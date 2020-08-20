// /Connect to the bootcampx database
//using a Pool is the preferred way to query with node-postgres
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const [, , cohort, limit] = process.argv

//query the database
pool.query(`
SELECT students.id as id, students.name as name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON (cohorts.id = students.cohort_id)
WHERE cohorts.name = '${cohort}12'
LIMIT '${limit}';
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));