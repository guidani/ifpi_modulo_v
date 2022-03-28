import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzlet/main.dart';
import 'package:quizzlet/pages/quiz_page.dart';

class ResultPage extends StatefulWidget {
  final int points;
  const ResultPage(this.points, {Key? key}) : super(key: key);

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
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            MaterialButton(
              onPressed: () {
                // quizBrain.reset();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                width: double.infinity,
                color: Colors.green,
                child: Text(
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
