import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      title: 'Mi Card',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MiCard(),
    );
  }
}

class MiCard extends StatelessWidget {
  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Guilherme Mi Card")),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0.0, 5.0),
              ),
            ],
          ),
          child: SizedBox(
            width: 500,
            child: Card(
              // color: Color.fromARGB(255, 252, 114, 9),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("images/guilherme_foto.jpg"),
                      ),
                      title: Text(
                        "Guilherme Daniel",
                        style: TextStyle(fontFamily: "Lobster", fontSize: 25),
                      ),
                      subtitle: Text(
                        "Developer",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                            icon: SvgPicture.asset("images/github.svg"),
                            tooltip: "github.com/guidani",
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: SvgPicture.asset("images/linkedin.svg"),
                            tooltip: "linkedin.com/in/guilherme-daniel",
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: SvgPicture.asset("images/mail.svg"),
                            tooltip: "gui.dani13@gmail.com",
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
