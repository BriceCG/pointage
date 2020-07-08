let router = require('express').Router()
const Presence = require('../Models/Presence')

//middleware
const needAuth = require('../middleware/auth').needAuth()
const presenceValidation = require('../middleware/validation').presenceValidation()


router.post('/presence',needAuth,presenceValidation,async(req,res)=>{
    const {presence_type} = req.body;
    const pt_departement_departement_id_presence = req.decoded.user_departement_id || null
    const savePresence = await Presence.create({
        presence_date: new Date(),
        presence_type: presence_type,
        pt_user_user_id_presence: req.decoded.user_id,
        pt_departement_departement_id_presence,
    })
    if (savePresence){
        return res.status(200).send({status:"success",message:"Presence sauvgardee"})
    }
    else{
        res.status(400).send({status:"erreur",message:"Erreur de sauvgarde"})
    }
})

router.get('/presences',needAuth,async(req,res)=>{
    console.log(req.decoded.user_id)
    let presences = await Presence.findAll({
       where:{
        pt_user_user_id_presence: req.decoded.user_id
       }
    })
    if (presences){
        return res.status(200).send({status:"succes",presences:presences})
    }
    else{
        return res.status(400).send({status:"erreur",message:"Presences non trouvees"})
    }
})
module.exports = router