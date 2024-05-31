import {Router} from 'express'
import * as OC from './order.controller.js'
const router = Router()

router.get('/addorder',OC.addorder)
router.get('/AVG',OC.AVG)
router.get('/EarliestOrderCustomer',OC.EarliestOrderCustomer)
router.get('/PercentageOfRepeatCustomers',OC.PercentageOfRepeatCustomers)
router.get('/LeastFiveOrders',OC.LeastFiveOrders)
router.get('/listcustomer',OC.listcustomer)
router.get('/TopSpending',OC.TopSpending)
router.get('/MostPurchasedItems',OC.MostPurchasedItems)



export default router