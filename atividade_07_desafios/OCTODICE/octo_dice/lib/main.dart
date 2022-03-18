import 'dart:math';
import 'package:octo_dice/mydrawer.widget.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Octo Dice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OctoDice(title: 'Octo Dice'),
    );
  }
}

class OctoDice extends StatefulWidget {
  const OctoDice({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<OctoDice> createState() => _OctoDiceState();
}

class _OctoDiceState extends State<OctoDice> {
  late int _diceOne;
  late int _diceTwo;

  // Assim que o app inicia, a função é executada.
  @override
  void initState() {
    super.initState();
    _loadDicesValues();
  }

  void _loadDicesValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _diceOne = (prefs.getInt('diceOneValue') ?? Random().nextInt(8) + 1);
      _diceTwo = (prefs.getInt('diceTwoValue') ?? Random().nextInt(8) + 1);
    });
  }

  void _changeNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _diceOne = Random().nextInt(8) + 1;
      prefs.setInt('diceOneValue', _diceOne);
      _diceTwo = Random().nextInt(8) + 1;
      _checkValueForDiceTwo();
    });
  }

  void _checkValueForDiceTwo() async {
    final prefs = await SharedPreferences.getInstance();
    while (_diceTwo == _diceOne) {
      setState(() {
        _diceTwo = Random().nextInt(8) + 1;
      });
    }
    prefs.setInt('diceTwoValue', _diceTwo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const myDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/octaedro$_diceOne.png',
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/octaedro$_diceTwo.png',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeNumber,
        tooltip: "Roll the dices!",
        child: const Icon(Icons.rotate_90_degrees_ccw),
      ),
    );
  }
}
