const userModel = require('../models/userModel')
const jwt = require('jsonwebtoken')

exports.Authenticate = async (req,res,next) =>{

    try{
        //stocked the token
        const authHeader = req.header('Authorization').replace('Bearer','');
        //verify the token
        const tokenHeaderDecoded = jwt.verify(authHeader,process.env.ACCESS_TOKEN_SECRET);
        console.log(tokenHeaderDecoded.id)
        //search token in the bdd
        const userBdd = await userModel.checkAuth(tokenHeaderDecoded.id,authHeader);
        
        req.user = tokenHeaderDecoded
          if(!userBdd)  throw new Error();  
        next()
    }catch(e){
        console.log(e)
        res.status(401).send("Authentifiez vous")
    }
}