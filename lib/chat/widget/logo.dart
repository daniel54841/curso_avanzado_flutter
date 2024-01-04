import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: const Column(
          children: [
            Image(
              image: AssetImage("assets/tag-logo.png"),
              width: 170,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Messenger",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
