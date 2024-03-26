const express = require('express');
const mysql = require('mysql');
const path = require('path');
const cors = require('cors');
const app = express();

app.use(cors()); 

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "CSCI4400",
    database: "mydb"
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to MySQL database');
});

app.get("/index", (req, res) => {
    db.query("SELECT * FROM gen_events", (err, results) => {
        if (err) {
            console.error('Error querying database:', err);
            res.status(500).send('Error querying database');
        }
         else {
            res.json(results);
        }
    });
});

const PORT = 5500;
app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}...`);
});
