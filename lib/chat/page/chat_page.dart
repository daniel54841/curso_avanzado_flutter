import 'package:curso_avanzado_flutter/chat/widget/chat_textfile.dart';
import 'package:flutter/material.dart';

import '../widget/chat_message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  static final List<ChatMessage> messages = [];

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  addMessage(String message) {
    ChatMessage messageT = ChatMessage(
      texto: message,
      uid: "123",
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 2000)),
    );
    ChatPage.messages.insert(0, messageT);
    messageT.animationController.forward();
  }

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
                itemCount: ChatPage._messages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatPage._messages[index];
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
