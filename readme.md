# Installation node_modules
npm install

# Configuration base de donnes mysql
aller dans: config/config.json<br />
Modifier username,password,database<br />
Cree la base de donne dans mysql<br />

# Migration base de donnees
$ node_modules/.bin/sequelize db:migrate

# Lancement du serveur 
$ npm start
