let router = require('express').Router()

router.post('/login',require('../middleware/validation').authValidation(),async(req,res)=>{
    const {user_username,user_password} = req.body
    
})

module.exports = router
