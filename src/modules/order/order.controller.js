import connection from "../../../db/models/connectionDB.js"
//add order
export const addorder = (req, res, next) => {
    const { totalAmount, customerID } = req.body;
    const query = `INSERT INTO ordertable (orderDate, totalAmount, customerID) VALUES (NOW(), '${totalAmount}', '${customerID}')`;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(400).json({ message: "Error adding order", error: err });
        }
        return res.status(200).json("order added successfully");
    });
}
//////////////////////////////////////////////////////////////
//API to calculate the average order value.
export const AVG = (req, res, next) => {
    const query = `SELECT AVG(totalAmount) AS averageOrderValue FROM ordertable`;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error", error: err });
        }
        else {
            return res.status(200).json(result);
        }
    });
}
//////////////////////////////////////////////////////////////
//API to find the customer who has made the earliest order\
export const EarliestOrderCustomer = (req, res, next) => {
    const query = `
        SELECT customerID, MIN(orderDate) AS earliestOrderDate FROM ordertable GROUP BY customerID
        ORDER BY earliestOrderDate ASC
        LIMIT 1
    `;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error" });
        }

        return res.status(200).json(result);
    });
}
////////////////////////////////////////////////////////////////
// API to find the percentage of customers who have made more than one order
export const PercentageOfRepeatCustomers = (req, res, next) => {
    const query = `
        SELECT COUNT(customerID) AS totalCustomers, SUM(CASE WHEN orderCount > 1 THEN 1 ELSE 0 END) AS repeatCustomers
        FROM (
            SELECT customerID, COUNT(*) AS orderCount
            FROM ordertable
            GROUP BY customerID
        ) AS orderCounts
    `;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error" });
        }
        return res.status(200).json(result);
    });
}
//////////////////////////////////////////////////////////////////////////////
// API to list all customers who have made at least 5 orders
export const LeastFiveOrders = (req, res, next) => {
    const query = `
        SELECT customerID, COUNT(*) AS orderCount FROM ordertable GROUP BY customerID HAVING orderCount >= 5`;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error" });
        }
        return res.status(200).json(result);
    });
}
///////////////////////////////////////////////////////////////////
// Write a query to list all customers who have not made any orders.
export const listcustomer = (req, res, next) => {
    const query = `
        SELECT * FROM customer AS c LEFT JOIN ordertable AS o ON c.id = o.customerID WHERE o.customerID IS NULL;`;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error", error: err });
        }
        return res.status(200).json(result);
    });
}
///////////////////////////////////////////////////////////////////
// API to list the top 2 customers who have spent the most money.
export const TopSpending = (req, res, next) => {
    const query = `
        SELECT customerID, SUM(totalAmount) AS totalSpent FROM ordertable GROUP BY customerID ORDER BY totalSpent DESC
        LIMIT 2
    `;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error" });
        }
        return res.status(200).json(result);
    });
}
////////////////////////////////////////////////////////
// API to find the customer who has purchased the most items in total (زي اللي قبلها )
export const MostPurchasedItems = (req, res, next) => {
    const query = `
        SELECT customerID, SUM(totalAmount) AS totalSpent FROM ordertable GROUP BY customerID ORDER BY totalSpent DESC
        LIMIT 1
    `;
    connection.execute(query, (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Error" });
        }
        return res.status(200).json(result);
    });
}
