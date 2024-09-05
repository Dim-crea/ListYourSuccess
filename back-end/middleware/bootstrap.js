// import the module route
const route = require("../routes/index")

//export the module
module.exports = (app, router) => {
    route.appRoute(router)
}