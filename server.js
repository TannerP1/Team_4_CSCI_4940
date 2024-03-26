//This file connects the frontend and backend
const express = require('express');           //importing express module
const mysql = require('mysql');               //imports mysql module to allow interaction with database
const path = require('path');                 //path module to work with files and directories
const cors = require('cors');                 //allows requests from other domains
                                                        
const app = express();                            

app.use(cors()); 

const db = mysql.createConnection({        //creating connection between database and frontend
    host: "localhost",
    user: "root",
    password: "CSCI4400",
    database: "mydb"
});

db.connect((err) => {                    //Error catcher
    if (err) {
        throw err;
    }
    console.log('Connected to MySQL database');
});

app.get("/index", (req, res) => {                //pulling data
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
