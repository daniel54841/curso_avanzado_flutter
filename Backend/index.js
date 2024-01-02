const express = require('express');
///App de express
const app = express(); 
const path = require("path");
require('dotenv').config(); //definir las variables de entorno

//crear servidor sockets
const server = require("http").createServer(app); //usar la configuracion de la app
module.exports.io = require("socket.io")(server); //informacion que entra y sale

require("./sockets/socket");

const { execPath } = require('process');


//Path publico
const publicPath = path.resolve(__dirname, "public");

app.use(express.static(publicPath));


server.listen(process.env.PORT //definir el puerto definido en .env
    ,( err ) =>{
    if(err) throw new Error(err);
    console.log('Servidor corriendo en puerto',3000);
}); //escuchar en el puerto indicado