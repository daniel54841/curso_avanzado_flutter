import 'package:curso_avanzado_flutter/chat/page/chat_page.dart';
import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final bool isWriting;
  final String textChatWrite;
  const ChatIconButton({
    Key? key,
    required this.isWriting,
    required this.textChatWrite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: IconTheme(
        data: IconThemeData(color: Colors.blue[400]),
        child: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.send_rounded,
          ),
          onPressed: isWriting
              ? () {
                  ChatPage.addMessage(textChatWrite);
                }
              : null,
        ),
      ),
    );
  }
}
