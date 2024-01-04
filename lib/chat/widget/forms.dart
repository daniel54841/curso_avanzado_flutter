import 'package:curso_avanzado_flutter/chat/widget/custom_button.dart';
import 'package:curso_avanzado_flutter/chat/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Column(
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
      ),
    );
  }
}
