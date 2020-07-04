# Installation node_modules
npm install

# Configuration base de donnes mysql
aller dans: config/config.json__
Modifier username,password,database__
Cree la base de donne dans mysql__

# Migration base de donnees
$ node_modules/.bin/sequelize db:migrate

# Lancement du serveur 
$ npm start
