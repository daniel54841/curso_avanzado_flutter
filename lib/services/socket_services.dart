import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

//para notificar el provider --> ChangeNotifier
class SocketService with ChangeNotifier {
  final ServerStatus _status = ServerStatus.connecting;
  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    /* io.Socket socket = io.io('http://192.168.1.35:3000/', {
      "transport": ["websocket"],
      "autoConnect": true,
    });
    socket.onConnect((_) {
      print('connect');
    });

    socket.onDisconnect((_) => print('disconnect'));*/
    Socket socket = io("http://localhost:3000", OptionBuilder().setTransports(["websocket"]).enableAutoConnect().build());
    socket.onConnect((_) => print('connect'));
    socket.onDisconnect((_) => print('disconnect'));
  }
}
