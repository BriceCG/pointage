const express = require('express')
const app = express()
const bodyParser = require('body-parser')

const cors = require('cors')
require('dotenv').config()

app.use(cors())
app.use(bodyParser.json())


const PORT = process.env.PORT || 4000

app.use('',require('./controllers/user.controller'))


app.listen(PORT,()=>{
    console.log('Serveur connecte au http://localhost:'+PORT)
})
