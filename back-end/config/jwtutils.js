const jwt = require('jsonwebtoken');
process.env.REFRESH_TOKEN_SECRET;

exports.generatedJwt = (user) => {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, {expiresIn: '5d'})
}

exports.generatedResfreshJwt = (user) => {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, {expiresIn: '1m'})
}

