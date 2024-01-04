import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class FormRegister extends StatelessWidget {
  FormRegister({Key? key}) : super(key: key);
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: "Nombre de Usuario",
          keyboardType: TextInputType.text,
          icon: Icons.perm_identity_outlined,
          isPassword: false,
          textController: _userCtrl,
        ),
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
      ],
    );
  }
}
