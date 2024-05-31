import mysql from "mysql2"

const connection =  mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'assignment_5',
});

connection.connect((err)=>{
    if(err)
        {
            console.error(err);
        }
        else{
            console.log("copnnected successfully");
        }
})


export default connection