
const {io} = require("../index");
const Band = require("./model/band");
const Bands = require("./model/bands");

const bands = new Bands();

bands.addBand( new Band( "Queen"));
bands.addBand( new Band( "Bon Jovi"));
bands.addBand( new Band( "Heroes del Silencio"));
bands.addBand( new Band( "Metalica"));

// mensajes de sockets
io.on("connection",client => {
    console.log("Cliente conectado");
    client.on("disconnect",() => {
        console.log("Cliente desconectado");
    })

    client.on("mensaje",( payload )=> {
        console.log("Mensaje: ", payload);
        
        client.emit("active-bands",bands.getBands());

        io.emit("mensaje",{admin: "Nuevo mensaje"});
        //io manda mensaje a todos los usuario

    });

    client.on("emitir-mensaje", (payload) =>{
        // console.log(payload);
        //io.emit("nuevo-mensaje:",payload); //emite a todos los clientes
        client.broadcast.emit("emitir-mensaje",payload); //emite a todos los clientes, menos al que lo emitió

    });
});

