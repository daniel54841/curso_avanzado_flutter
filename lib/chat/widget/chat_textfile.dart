import 'package:curso_avanzado_flutter/chat/widget/chat_icon_button.dart';
import 'package:flutter/material.dart';

class ChatTextFile extends StatefulWidget {
  ChatTextFile({Key? key}) : super(key: key);
  bool isWriting = false;
  @override
  State<ChatTextFile> createState() => _ChatTextFileState();
}

class _ChatTextFileState extends State<ChatTextFile> {
  final TextEditingController _textCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: _textCtrl,
            onSubmitted: (_) {
              _textCtrl.clear();
              _focusNode.requestFocus();
              setState(() {
                widget.isWriting = false;
              });
            },
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  widget.isWriting = true;
                } else {
                  widget.isWriting = false;
                }
              });
            },
            decoration: const InputDecoration.collapsed(
              hintText: "Enviar mensaje",
            ),
            focusNode: _focusNode,
          ),
        ),
        ChatIconButton(isWriting: widget.isWriting)
      ],
    );
  }
}
