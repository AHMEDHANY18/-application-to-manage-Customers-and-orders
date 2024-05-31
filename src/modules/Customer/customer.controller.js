import connection from "../../../db/models/connectionDB.js"
//////////////////////////////// Getcustomer //////////////////////
export const getcustomer =(req, res,next) =>{
    connection.execute(`select * from customer`,(err, result)=>{
        if(err){
            res.status(400).json({message:"Error getting customer"});

        }
            res.json(result);
    }
)}
//1- sign up (customer must be unique)
export const signup = (req, res, next) => {
        const query ='INSERT INTO customer (`FName`, `Lname`, `Email`, `phone`) VALUES ("jjj","hany","jjj@gmail.com","01898267262")';
        connection.execute(query, (err, result) => {
            if (err) {
                return res.status(400).json("error");
            } else {
                console.log(result)
            }
        });
    };
//2- login.
export const login = (req, res, next) => {
    const { email } = req.body;
    connection.execute(`SELECT * FROM customer WHERE email='${email}'`, (err, result) => {
        if (err) {
            return res.status(400).json("error");
        }
        if (result.length === 0) {
            return res.status(400).json("Invalid email ");
        }
        return res.status(200).json("Login successful");
    });
}
