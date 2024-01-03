
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
    
    client.emit("active-bands",bands.getBands());
    
    client.on("disconnect",() => {
        console.log("Cliente desconectado");
    })

    client.on("vote-band",(payload)=>{
        bands.voteBand(payload.id);
        //notificar a todos que hay un cambio
        io.emit("active-bands",bands.getBands());
    });

    client.on("mensaje",( payload )=> {
        console.log("Mensaje: ", payload);
        io.emit("mensaje",{admin: "Nuevo mensaje"});
        //io manda mensaje a todos los usuario
    });
    
    client.on("add-band",( payload)=>{
        const newBand = new Band(payload.name);
        bands.addBand(newBand);
        io.emit("active-bands",bands.getBands());
    });

    client.on("delete-band",(payload)=>{
        bands.deleteBand(payload.id);
        io.emit("active-bands",bands.getBands());
    });

   
}); //fin de io.on

