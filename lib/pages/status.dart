import 'package:curso_avanzado_flutter/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Tener la comunicacion de los sockets services

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    //socketService.socket.emit(event);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Server Status: ${socketService.serverStatus}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.socket.emit(
            "emitir-mensaje",
            {"nombre": "Flutter", "mensaje": "Hola desde Flutter"},
          );
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
