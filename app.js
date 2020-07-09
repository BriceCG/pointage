const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const compression = require('compression')

const cors = require('cors')
require('dotenv').config()

app.use(compression())
app.use(cors('*'))
app.use(bodyParser.json())

const PORT = process.env.PORT || 4000

app.use('',require('./controller/departement.controller'))
app.use('',require('./controller/user.controller'))
app.use('',require('./controller/auth.controller'))
app.use('',require('./controller/presence.controller'))
app.listen(PORT,()=>{
    console.log('Serveur connecte au http://localhost:'+PORT)
})
