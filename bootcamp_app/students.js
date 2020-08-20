// /Connect to the bootcampx database
//using a Pool is the preferred way to query with node-postgres
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//query the database
const queryString = `
SELECT students.id as id, students.name as name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON (cohorts.id = students.cohort_id)
WHERE cohorts.name = $1
LIMIT $2;
`;

//potential dangerous value from user
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

//pass query and value separate to be safetly manage by sql
const query = {
  text: queryString,
  values: [cohortName, limit],
}

pool.query(query)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));