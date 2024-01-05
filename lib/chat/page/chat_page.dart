import 'package:curso_avanzado_flutter/chat/widget/chat_textfile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 14,
                backgroundColor: Colors.blue[100],
                child: const Text(
                  "Te",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Nombre completo",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Text("$index");
                },
                reverse: true,
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              height: 50,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ChatTextFile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
