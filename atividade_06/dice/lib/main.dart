import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lets roll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.amber,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dice",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png')),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')),
            ),
          ],
        ),
      ),
    );
  }
}
