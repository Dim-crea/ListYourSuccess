const userController = require('../controllers/userController')
const tokenAuthenticate = require("../middleware/jwtAuth")

exports.appRoute = router =>{

    // --- Route GET
    router.get("/allTaches",userController.getAllTasks)//get tasks of the user 
    //router.get("/tasksPro",userController.getTasksPro)//get tasks pro of the user 
    //router.get("/id/administratif",userController.getTasksAdministratif)//get tasks administratif of the user 
    //router.get("/event", userEvent.getEvent)// get all the event in the city 

    // --- Route POST
    router.post("/addNewUser",userController.createrUser)//create a user account 
    router.post("/login",userController.login)
    router.post("/auth",tokenAuthenticate.Authenticate,userController.auth)//connect user 
    //router.post("newTasks",tokenAuthenticate.Authenticate,userController.addTasksById)//create a tasks
    // router.post("/createEvent",userController.createEvent)
    //router.post("/suscribre",userController.userSuscribe)

    // --- Route PUT
    router.put("/modiftache", tokenAuthenticate.Authenticate, userController.modiftache )//modif a tasks. For that we need iduser, idtask,new taskname and new description
    //router.put("/modifUser",tokenAuthenticate.Authenticate, userController.modifUser) 



    // --- Route DELETE
    // router.delete("/deleteUser",userController.deleteUser) //delete user
    // router.delete("/deleteTasks,userController.deleteTasks")// remove a tasks 
    // router.delete("/deleteCategory", userController.deleteCategory) //remove a categorie
}