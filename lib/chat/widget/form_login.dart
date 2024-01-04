import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class FormLogin extends StatelessWidget {
  FormLogin({Key? key}) : super(key: key);
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: "Email",
          keyboardType: TextInputType.emailAddress,
          icon: Icons.email_outlined,
          isPassword: false,
          textController: _emailCtrl,
        ),
        CustomTextField(
          hintText: "Contraseña",
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
          isPassword: true,
          textController: _passwordCtrl,
        ),
        CustomButton(
          onPress: () {
            debugPrint("Pintando");
          },
          text: 'Ingrese',
        ),
      ],
    );
  }
}
