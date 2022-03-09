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
      title: "I'mPoor",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImPoor(),
    );
  }
}

class ImPoor extends StatelessWidget {
  const ImPoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(child: Text("I'm Poor")),
      ),
      body: Center(
        // Fix overflow error when the image is in large screens
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/coal.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
