const { response } = require("express");
const { validationResult } = require("express-validator");



const crearUsuario= (req,res=response) =>{
    const errores = validationResult( req );

    

    res.json({
        ok: true,
        msg:"Crear usuario!!!"
    });
}


module.exports = {
    crearUsuario
}