import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final bool isWriting;
  const ChatIconButton({
    Key? key,
    required this.isWriting,
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
          onPressed: isWriting ? () {} : null,
        ),
      ),
    );
  }
}
