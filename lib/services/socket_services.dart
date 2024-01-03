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
  late Socket _socket;

  ServerStatus get serverStatus => _status;
  Socket get socket => _socket;

  void _initConfig() {
    _socket = io("http://192.168.1.35:3000", OptionBuilder().setTransports(["websocket"]).enableAutoConnect().build());
    _socket.onConnect((_) {
      print('connect');
      _status = ServerStatus.online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      print('disconnect');
      _status = ServerStatus.offline;
      notifyListeners();
    });

    _socket.on("nuevo_mensaje", (payload) {
      print("nuevo_mensaje: $payload");
    });
  }
}
