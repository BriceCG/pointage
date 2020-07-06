const {sequelize,Sequelize} = require('./model')
const User = sequelize.define("user", {
    username: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    role: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    

},{
    timestamps:false
})

module.exports = User