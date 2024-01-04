import 'package:curso_avanzado_flutter/chat/widget/form_login.dart';
import 'package:flutter/material.dart';

import 'form_register.dart';

class Forms extends StatefulWidget {
  final bool isLogin;
  const Forms({Key? key, required this.isLogin}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: widget.isLogin ? FormLogin() : FormRegister(),
    );
  }
}
