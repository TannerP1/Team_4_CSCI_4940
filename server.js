//file creates a server for website
const express=require('express');
const path= require('path');
const app=express();

const db= mysql.createConnection({
    host: "localhost",
    username: "root",
    password: "password",
    database:"capstone"
});
app.get("/index", (req,res)=>{
    //Query for events table 
    db.query("SELECT * FROM gen_events")
})
app.listen(5500,()=>{
    console.log("Server is listening...");
});

//to run, type "npm start" in terminal
   
