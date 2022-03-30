import 'package:flutter/material.dart';
import 'package:quizzlet/pages/quiz_page.dart';

class ResultPage extends StatefulWidget {
  final int points;
  final Function reset;
  const ResultPage(this.points, this.reset, {Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Resultado: ${widget.points} pontos",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            MaterialButton(
              // onPressed: () {
              //       Navigator.pop(context, true);
              //   widget.reset();
              // },
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
                widget.reset();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                width: double.infinity,
                color: Colors.green,
                child: const Text(
                  "RESETAR",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
