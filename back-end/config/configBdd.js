const dotenv = require("dotenv");
const mysql = require("mysql2");

dotenv.config();
const { DB_HOST, DB_USER, DB_PASSEWORD, DB_NAME } = process.env

exports.dbConnex = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSEWORD,
    database: DB_NAME,
})
