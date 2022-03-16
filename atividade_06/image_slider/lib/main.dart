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
      title: 'Status Dog Gallery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.green),
        ),
      ),
      home: const MyHomePage(title: 'Status Dog Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentImage = 0;

  final _saved = [];

  void _nextImage() {
    setState(() {
      if (_currentImage < arr.length - 1) {
        _currentImage++;
      } else {
        _currentImage = 0;
      }
      print("$_currentImage ||| ${arr.length}");
    });
  }

  void _prevImage() {
    setState(() {
      if (_currentImage > 0) {
        _currentImage--;
      } else {
        _currentImage = arr.length - 1;
      }
    });
  }

  var arr = [
    'images/100.jpg',
    'images/200.jpg',
    'images/206.jpg',
    'images/400.jpg',
    'images/404.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final alreadySaved = _saved.contains(arr[_currentImage]);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pets),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Image.asset(arr[_currentImage]),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(arr[_currentImage]);
                  } else {
                    _saved.add(arr[_currentImage]);
                  }
                });
              },
              icon: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _prevImage,
                  child: const Text(
                    "Anterior",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _nextImage,
                  child: const Text("Proximo"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
