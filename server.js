const express=require('express');
const path= require('path');

const app=express();
app.get('/', (req,res)=>{
    res.sendFile(path.join(__dirname,index.html));
});app.listen(5500,()=>{
    console.log("Server is listening");
});
const mysql= require("mysql");
const con= mysql.createConnection({
    host: "localhost",
    username: "root",
    password: "password"
});

