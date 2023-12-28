const express = require('express');
const app = express(); 
const path = require("path");
require('dotenv').config(); //definir las variables de entorno
const { execPath } = require('process');


//Path publico
const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));


app.listen(process.env.PORT //definir el puerto definido en .env
    ,( err ) =>{
    if(err) throw new Error(err);
    console.log('Servidor corriendo en puerto',3000);
}); //escuchar en el puerto indicado