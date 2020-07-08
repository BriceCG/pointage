let jwt = require('jsonwebtoken');

module.exports = {
    needAuth: ()=>{
        return async(req,res,next)=>{
            const token = req.headers['x-api-key']
            //Si pas de token
            if (!token){
                return res.status(400).send({message:"Pas de token"})
            }
            const decoded = jwt.decode(token,require('../config/jwtConfig').secret)
            if (decoded){
                req.decoded = decoded
                next()
            }
            else{
                return res.status(400).send({status:"erreur",message:"Token Invalide"})
            }
        }
    }
}