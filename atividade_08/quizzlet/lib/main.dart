import 'package:flutter/material.dart';
import 'package:quizzlet/pages/initial_page.dart';
import 'package:quizzlet/pages/quiz_page.dart';
import 'models/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  WidgetsFlutterBinding.ensureInitialized();  
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: InitialPage(),
          ),
        ),
      ),
    );
  }
}

