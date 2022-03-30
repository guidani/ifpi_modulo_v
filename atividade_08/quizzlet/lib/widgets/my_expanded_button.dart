import 'package:flutter/material.dart';

class MyExpandedButton extends StatelessWidget {
  final VoidCallback? checkAnswer;
  final Color? btnColor;
  final String text;
  const MyExpandedButton({Key? key, required this.checkAnswer, required this.btnColor, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: btnColor,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: checkAnswer,
        ),
      ),
    );
  }
}
