import 'package:flutter/material.dart';
import 'package:quizzlet/pages/result_page.dart';
import 'package:quizzlet/widgets/my_expanded_button.dart';

import '../main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int points = 0;
  int numRespostasCorretas = 0;

  void _resetValues() {
    points = 0;
    scoreKeeper = [];
    quizBrain.reset();
    numRespostasCorretas = 0;
  }

  double calcPercentualAcertos() {
    int totalQuestoes = quizBrain.numberOfQuestions();
    double percentual = (numRespostasCorretas * 100) / totalQuestoes;
    return percentual;
  }

  void checkAnswer(bool? userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == null) {
        scoreKeeper.add(const Icon(
          Icons.question_mark,
          color: Colors.grey,
        ));
      } else {
        if (userPickedAnswer == correctAnswer) {
          numRespostasCorretas += 1;
          points += 10;
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        if (quizBrain.isFinished() == true) {
          int currentPoints = points;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(currentPoints, _resetValues)));
          this._resetValues();
        }
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Questão ${quizBrain.getCurrentQuestion()}/${quizBrain.numberOfQuestions()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Text(
              "${calcPercentualAcertos().ceil()}% de acerto",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Text(
              "pontuação: ${points}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const Divider(
          height: 1.0,
          color: Colors.white,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // Texto da questão
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        MyExpandedButton(
          checkAnswer: () {
            checkAnswer(true);
          },
          btnColor: Colors.green,
          text: "TRUE",
        ),
        MyExpandedButton(
          checkAnswer: () {
            checkAnswer(false);
          },
          btnColor: Colors.red,
          text: "FALSE",
        ),
        MyExpandedButton(
          checkAnswer: () {
            checkAnswer(null);
          },
          btnColor: Colors.grey,
          text: "MAYBE",
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
