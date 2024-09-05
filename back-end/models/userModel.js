const { dbConnex } = require( '../config/configBdd');

// exports.getUserByMail = async (email) => {
//     const rows = await dbConnex.promise().execute(
//         "SELECT * FROM users WHERE email = ? ",[email]);
//     return rows;
// }

// ----- process for create a user 
// ----- checkIfEmailExist before add a new User 
exports.checkIfEmailExist = async (email) => {
    const verifMail = await dbConnex.promise().execute(
        "SELECT email FROM users WHERE email = ?", [email]
    );
    return verifMail;
}
//----- add the user in the bdd 
exports.addUser = async (lastname,firstname,email,password,username) => {
    const rows = await dbConnex.promise().execute(
        "INSERT INTO users (lastname, firstname, email, password, username) VALUES ( ?, ?, ?, ?, ?);",[lastname,firstname,email,password,username]
    );
    return rows;
};

// ----- info for generated jwt
exports.getTokenInfo = async(email) => {
    const Infofortoken = await dbConnex.promise().execute(
        "SELECT * FROM users WHERE email = ?", [email]
    )
    return Infofortoken
}
exports.addToken = async(token,email) => {
    await dbConnex.promise().execute(
        "UPDATE users  SET auth = ? WHERE email = ?", [token,email]
    )
}
// ------ end of process

exports.checkAuth = async (id,token) => {
    const tokenUser = await dbConnex.promise().execute(
        "SELECT * From users WHERE id_user = ? AND auth = ? ;",[id,token]
    )
    return tokenUser;
}

exports.getAllItemsUser = async (id) => { 
    const itemUser = await dbConnex.promise().execute(
        "SELECT username, taskname, description FROM users INNER JOIN tache ON users.id = tache.id_user WHERE users.id = ? ;",[id]
    )
    return itemUser;
} // a revoir

exports.getOneTaskUser = async (id_user,id_tache) => { 
    const itemUser = await dbConnex.promise().execute(
        "SELECT * FROM taches WHERE id_user = ? AND id_tache = ?;",[id_user,id_tache]
    )
    return itemUser;
}

exports.getProTasksUser = async (id) => { 
    const itemUser = await dbConnex.promise().execute(
        "SELECT username, taskpro, description FROM users INNER JOIN professionnelle ON users.id = professionnelle.id_user WHERE users.id = ? ;",[id]
    )
    return itemUser;
}

exports.getAdministratifTasksUser = async (id) => { 
    const itemUser = await dbConnex.promise().execute(
        "SELECT username, taskname, description FROM users INNER JOIN Administratif ON users.id = Administratif.id_user WHERE users.id = ? ;",[id]
    )
    return itemUser;
}

exports.getCourseTasksUser = async (id) => { 
    const itemUser = await dbConnex.promise().execute(
        "SELECT username, itemcourse FROM users INNER JOIN course ON users.id = course.id_user WHERE users.id = ? ;",[id]
    )
    return itemUser;
}

exports.putTasksUser = async (id_user,id_tache,taskname,description) => { 
    const itemUser = await dbConnex.promise().execute(
        "UPDATE taches SET taskname = ?, description = ? WHERE id_tache = ? AND id_user = ? ;",[taskname,description,id_tache,id_user]
    )
    return itemUser;
}

exports.getAllInfobyId = async (id) => {
    const rows = await dbConnex.promise().execute(
    )
};



