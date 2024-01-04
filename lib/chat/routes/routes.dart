import 'package:flutter/cupertino.dart';

import '../page/chat_page.dart';
import '../page/loading_page.dart';
import '../page/login_page.dart';
import '../page/register_page.dart';
import '../page/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "usuarios": (_) => const UsuariosPage(),
  "chat": (_) => const ChatPage(),
  "login": (_) => const LoginPage(),
  "register": (_) => const RegisterPage(),
  "loading": (_) => const LoadingPage(),
};
