import 'package:curso_flutter_avanzado/pages/home.dart';
import 'package:flutter/material.dart';
//mateapp, crea el cuerpo predeterminado de main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     initialRoute: 'home',
      routes:{
        'home' : (_) => HomePage()
      }
    );
  }
}