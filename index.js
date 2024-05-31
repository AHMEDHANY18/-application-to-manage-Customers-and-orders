import express from 'express'
import productRouter from './src/modules/product/product.routes.js'
import orderRouter from './src/modules/order/order.routes.js'
import connection from './db/models/connectionDB.js'
import customerRouter from './src/modules/customer/customer.routes.js'
const app = express()
const port = 3000


app.use(express.json())
app.use(productRouter)
app.use(customerRouter)
app.use(orderRouter)
app.use("*",(req,res,next)=>{
    res.status(404).json("404 Not Found")
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})