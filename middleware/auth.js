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
    },
    needRole: (neededRole)=>{
        return async (req,res,next)=>{
            let role = req.decoded.user_role
            if (!role){
                return res.status(400).send({"message": "Pas de role",status:"erreur"})
            }
            role = role.toLowerCase()
            if (role != neededRole){
                return res.status(400).send({"message": "Vous n avez pas de droit d acces a cette route",status:"erreur"})
            }
            else{
                next()
            }

        }
    }
}