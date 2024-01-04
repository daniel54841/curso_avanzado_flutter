import 'package:curso_avanzado_flutter/chat/widget/logo.dart';
import 'package:flutter/material.dart';

import '../widget/forms.dart';
import '../widget/labels.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          //pone espacio en la parte del notch en el dispositivo
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(), //rebote al bajar al tope
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(),
                  Forms(),
                  Labels(),
                  Text("Terminos y condiciones de uso",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
