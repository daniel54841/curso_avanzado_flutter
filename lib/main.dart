import 'package:curso_avanzado_flutter/pages/home.dart';
import 'package:curso_avanzado_flutter/pages/status.dart';
import 'package:curso_avanzado_flutter/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//mateapp, crea el cuerpo predeterminado de main
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          "status": (_) => const StatusPage(),
        },
      ),
    );
  }
}
