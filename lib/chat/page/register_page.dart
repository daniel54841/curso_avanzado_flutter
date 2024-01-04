import 'package:flutter/material.dart';

import '../widget/forms.dart';
import '../widget/labels.dart';
import '../widget/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        //pone espacio en la parte del notch en el dispositivo
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), //rebote al bajar al tope
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  title: "Registro",
                ),
                Forms(
                  isLogin: false,
                ),
                Labels(
                  ruta: "login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
