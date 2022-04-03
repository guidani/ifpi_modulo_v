import 'package:fetch_data_two/utils/Post.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = getData();
  }

  Future<List<Post>> getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load Posts');
    }
    List jsonDecoded = jsonDecode(response.body);
    return jsonDecoded.map((e) => Post.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching data'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> post = snapshot.data!;
              return ListView.builder(
                  itemCount: post.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.red,
                              content: const Text('Deleted'),
                              action: SnackBarAction(
                                label: 'OK',
                                textColor: Colors.white,
                                onPressed: (){},
                              ),
                            ),
                          );
                        }
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15.0),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white,),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const FlutterLogo(),
                            title: Text(post[index].title),
                            trailing: const Icon(Icons.add),
                            onTap: () {
                              var snackBar = SnackBar(
                                duration: const Duration(milliseconds: 500),
                                content: Text('Post: ${post[index].id} clicado'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                          Divider(height: 1,),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
