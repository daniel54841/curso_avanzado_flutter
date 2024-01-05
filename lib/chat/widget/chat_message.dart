import 'package:curso_avanzado_flutter/chat/widget/my_message.dart';
import 'package:curso_avanzado_flutter/chat/widget/other_message.dart';
import 'package:flutter/cupertino.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: Container(
          child: uid == "123"
              ? MyMessage(
                  text: texto,
                )
              : OtherMessage(text: texto),
        ),
      ),
    );
  }
}
