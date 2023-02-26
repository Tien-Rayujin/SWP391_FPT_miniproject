const sql = require('mssql')
require('dotenv').config({ path: '.././.env' })

const config = {
    server: process.env.SQL_SERVER,
    database: process.env.SQL_DB,
    user: process.env.SQL_USERNAME,
    password: process.env.SQL_PASSWORD,
    port: parseInt(process.env.SQL_PORT),
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
}

sql.on('error', err => { console.log(err.message); })
/**
 * EX:
 *  const con = connection()
 *  con.then(pool => {
 *      const query = 'select * from Accounts'
 *      return pool.request().query(query)
 * }).then(data => {
 *      return data.recordSet
 * })
 *
 *
 * @returns Promise object provide request and query data
 */
async function connection(){
   try {
       sql.connect(config);
       return sql;
   }
    catch (err) {
        console.log(err.message)
    }
}

module.exports = {connection}
