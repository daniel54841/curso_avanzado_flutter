import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 2,
        backgroundColor: Colors.blue,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
