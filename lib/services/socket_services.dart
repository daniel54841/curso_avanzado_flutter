import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

//para notificar el provider --> ChangeNotifier
class SocketService with ChangeNotifier {
  ServerStatus _status = ServerStatus.connecting;
  SocketService() {
    _initConfig();
  }

  get serverStatus => _status;

  void _initConfig() {
    Socket socket = io("http://192.168.1.35:3000", OptionBuilder().setTransports(["websocket"]).enableAutoConnect().build());
    socket.onConnect((_) {
      print('connect');
      _status = ServerStatus.online;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      print('disconnect');
      _status = ServerStatus.offline;
      notifyListeners();
    });

    socket.on("nuevo_mensaje", (payload) {
      print("nuevo_mensaje: $payload");
    });
  }
}
