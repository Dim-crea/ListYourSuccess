const express = require('express');
const userController = require('./controllers/userController')
const jwt = require('jsonwebtoken')

const PORT = 4000;

const app = express();
const bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

const router = express.Router();
app.use(router)

//middleware
const bootstrap = require("./middleware/bootstrap")
bootstrap(app,router)

app.listen(PORT, () => {
    console.log(`Serveur Express en cours d'exécution sur le port ${PORT}`);
})



