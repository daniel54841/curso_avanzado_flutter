import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final TextEditingController _textCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
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
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _textCtrl,
                        onSubmitted: (_) {
                          _textCtrl.clear();
                          _focusNode.requestFocus();
                        },
                        onChanged: (value) {},
                        decoration: const InputDecoration.collapsed(hintText: "Enviar mensaje"),
                        focusNode: _focusNode,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: const Icon(Icons.send_rounded),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
