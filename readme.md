# Installation node_modules
npm install

# Configuration base de donnes mysql
aller dans: config/config.json
Modifier username,password,database
Cree la base de donne dans mysql

# Migration base de donnees
$ node_modules/.bin/sequelize db:migrate
