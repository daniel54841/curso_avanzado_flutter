import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  const Labels({
    Key? key,
    required this.ruta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Visibility(
              visible: ruta != "login",
              child: const Text(
                "¿No tienes cuenta?",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  ruta,
                );
              },
              child: Text(
                ruta != "login" ? "Crea una ahora!" : "Iniciar sesion",
                style: TextStyle(color: Colors.blue[600]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
