let express = require('express')
const app = express()
let bodyParser = require('body-parser')
let cors = require('cors')
require('dotenv').config()


app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use(cors())
const PORT = process.env.PORT || 4000

app.use('',require('./controllers/user.controller'))

app.get('*',(req,res)=>{
    return res.send({message:"Cette url n existe pas"})
})
app.post('*',(req,res)=>{
    return res.send({message:"Cette url n existe pas"})
})
app.put('*',(req,res)=>{
    return res.send({message:"Cette url n existe pas"})
})
app.delete('*',(req,res)=>{
    return res.send({message:"Cette url n existe pas"})
})

app.listen(PORT,()=>{
    console.log('Serveur connecte http://127.0.0.1:'+PORT)
})
