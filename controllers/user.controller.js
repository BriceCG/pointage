let router = require('express').Router()
const { Op } = require('sequelize')
const models = require('../models')
const User = models.user
router.get('/users', async (req, res) => {
    let users = await User.findAll()
    return res.send({ users: users })
})
router.post('/user', async (req, res) => {
    const { username, password, role } = req.body;
    //Si les donnes  sont pas manquantes
    if (!username || !password || !role) {
        return res.send({ message: "Donne manquantes" })
    }

    else {
        //Si l utilisateur se trouve deja dans la base de donne
        let existingUser = await User.findOne({
            where: {
                [Op.and]: [
                    { username: username },
                    { password: password }
                ]
            }
        })

        if (existingUser) {
            return res.send({ message: "Utilisateur deja dans la base de donnee`" })
        }
        const newUser = await User.create({
            username: username,
            password: password,
            role: role
        })
        if (newUser) {
            return res.send({ message: "Utilisateur sauvgardee" })
        }
        else {
            return res.send({ message: "Erreur" })
        }
    }
})
router.get('/user/:id', async (req, res) => {
    let id = req.params.id
    let user = await User.findOne({ where: { id: id } })
    if (user) {
        return res.send({ user: user })
    }
    else {
        return res.send({ message: "Utilisateur non trouvee" })
    }
})

router.put('/user/:id', async (req, res) => {
    const id = req.params.id;

    const { username, password, role } = req.body;
    //Si les donnes  sont pas manquantes
    if (!username || !password || !role) {
        return res.send({ message: "Donne manquantes" })
    }

    let existingUser = await User.findOne({
        where: {
            id: id
        }
    })
    //Si l utilisateur n est pas dans la base de donnee
    if (!existingUser) {
        return res.send({ message: "Utilisateur non trouvee" })
    }
    else {
        let updateUser = await User.update({
            username: username,
            password: password,
            role: role
        }, {
            where: {
                id: id
            }
        })
        if (updateUser) {
            return res.send({ message: "Utilisateur mis a jour" })
        }
        else {
            return res.send({ message: "Erreur" })
        }
    }
})

router.delete('/user/:id', async (req, res) => {
    const id = req.params.id
    let existingUser = await User.findOne({
        where: {
            id: id
        }
    })
    if (!existingUser) {
        return res.send({ message: "Utilisateur non trouvee" })
    }
    else {
        let deleteUser = await User.destroy({
            where: {
                id: id
            }
        })
        if (deleteUser) {
            return res.send({ message: "Utilisateur supprime" })
        }
        else {
            return res.send({ message: "Erreur" })
        }
    }
})

module.exports = router