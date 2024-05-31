import {Router} from 'express'
import * as PC from './product.controller.js'

const router = Router()

router.get('/addproduct', PC.addProduct)
router.get('/TotalRevenueByCategory', PC.TotalRevenueByCategory)
router.get('/TotalItemsSoldPerProduct', PC.TotalItemsSoldPerProduct)


export default router