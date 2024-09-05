const userModel = require('../models/userModel')
const bcrypt = require("bcrypt") 
const jwtU = require('../config/jwtutils')
const { clearParserCache } = require('mysql2')

// it's for create a new user
exports.createrUser = async (req, res) => {

    const password = bcrypt.hashSync(req.body.password,10)
    const lastname = req.body.lastname
    const firstname = req.body.firstname
    const email = req.body.email
    const username = req.body.username

    // check if req.body.email exist in th bdd
    await userModel.checkIfEmailExist(email)
    .then( async (verifMail) => {
        const tabmail = verifMail[0]
        const usermail = tabmail[0]

        if(usermail == null){
         // email dosn't exist, i add the new user   
        await userModel.addUser(lastname,firstname,email,password,username)
        // after i take info in the bdd for token
        await userModel.getTokenInfo(email)
            .then(async (tokenInfo) => {
            console.log(tokenInfo)
            const userTokenInfo = tokenInfo[0][0]
            const tokenInfoGenerated = {
                id: userTokenInfo.id_user,
                username: userTokenInfo.username,
                email: userTokenInfo.email,
            }
            const tokenUser = jwtU.generatedJwt(tokenInfoGenerated)
            console.log(tokenUser)
            const tokenUserObject = {
                token : tokenUser,
                id: userTokenInfo.id_user
            }
            return tokenUserObject
        })
        .then(async(tokenUserObjet)=> {
            await userModel.addToken(tokenUserObjet,email)
            console.log(tokenUserObjet)
            res.send({tokenUserObjet})
        })
        } else {
            res.send("Cette adresse mail est déja utilisé ")
        }
    })
} 

// exports.createItem()
// exports.moodifItem()

exports.login = async (req, res) => {

    console.log(req.body)
    //init the body request in the const 
    let userForm = req.body;
    const pwdUserFormHashed = bcrypt.hashSync(userForm.password,10)

    await userModel.getUserByMail(userForm.email)
    .then(async(result) => {
            const user = result[0]
            const objectUser = user[0] 
            
            if( objectUser == undefined){
                res.send("User inexistant")
            } else if (objectUser){
            if(bcrypt.compareSync(userForm.password,objectUser.password)){
                const tokenInfo = {
                    id: objectUser.id,
                    email: objectUser.email,
                    username: objectUser.username,
                }

                const tokenUser =  jwtU.generatedJwt(tokenInfo); 
                const tokenRefreshUser = jwtU.generatedResfreshJwt(tokenInfo);

                await userModel.getItemsTasksUser(objectUser.id)
                .then((itemUser)=>{
                    const dataUser = itemUser[0]
                    res.send({tokenUser,tokenRefreshUser,dataUser})
                })
            }
        }
    })
    
} 

exports.auth = async (req, res) => {
    res.send('ok')
} 

exports.addTasksById = async (req,res) => {}

exports.getAllTasks = async (req,res) => {
    const id = req.user.id;
    const tasksReq = await userModel.getAllItemsUser(id)
    const tasksUser = tasksReq[0]    
    console.log(tasksUser);
    res.send(tasksUser)
}

exports.getTasksPro = async (req,res) => {
    const id = req.query.id;
    const tasksReqPro = await userModel.getProTasksUser(id)
    const tasksProUser = tasksReqPro[0]    
    console.log(tasksProUser);
    res.send(tasksProUser)
}

exports.getTasksAdministratif = async (req,res) => {
    const id = req.query.id;
    const tasksReqAdminis = await userModel.getAdministratifTasksUser(id)
    const tasksAdminisUser = tasksReqAdminis[0]    
    console.log(tasksAdminisUser);
    res.send(tasksAdminisUser)
}

exports.getTasksCourse = async (req,res) => {
    const id = req.query.id;
    const tasksReqCourse = await userModel.getCourseTasksUser(id)
    const tasksCourseUser = tasksReqCourse[0]    
    console.log(tasksCourseUser);
    res.send(tasksCourseUser)
}

exports.modiftache = async (req,res) => {
    const idUser = req.user.id
    const idTasks = req.body.id_tache
    const taskname = req.body.taskname
    const description = req.body.description
    console.log(idUser,description)

    await userModel.putTasksUser(idUser,idTasks,taskname,description)
    const tasksChange = {
        idUser,
        idTasks,
        taskname,
        description
    }
    res.send(tasksChange)
}

 
