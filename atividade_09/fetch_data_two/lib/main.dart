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
  List<Post> allPosts = [];
  ScrollController _scrollController = ScrollController();
  int current_page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // TODO: dar um jeito de chamar a função novamente;
        loadData();
      }
    });
  }

  loadData() {
    setState(() {
      current_page++;
    });

    return getData(current_page);
  }

  Future<List<Post>> getData(int p) async {
    try {
      final baseUrl = 'https://jsonplaceholder.typicode.com';
      final url = Uri.parse('$baseUrl/posts?_page=$current_page&_limit=15');
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to load Posts');
      }
      List jsonDecoded = jsonDecode(response.body);
      final x = jsonDecoded.map((e) => Post.fromJson(e)).toList();
      for (var i in x) {
        print(i.id);
        allPosts.add(i);
      }
      // return jsonDecoded.map((e) => Post.fromJson(e)).toList();
      return [];
    } catch (error) {
      throw Exception(error);
    }
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
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> post = snapshot.data!;
              // for (var p in post) {
              //   allPosts.add(p);
              // }
              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  controller: _scrollController,
                  itemCount: allPosts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey<int>(allPosts.length),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text('Deseja realmente deletar?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text('SIM'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: const Text('Não'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (direction) {
                        setState(() {
                          allPosts.removeAt(index);
                        });
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15.0),
                        child: const Text(
                          'Deletar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        color: Colors.red,
                      ),
                      child: ListTile(
                        leading: const FlutterLogo(),
                        title: Text(
                            "${allPosts[index].id}: ${allPosts[index].title}"),
                        trailing: const Icon(Icons.add),
                        onTap: () {
                          var snackBar = SnackBar(
                            content:
                                Text('allPosts: ${allPosts[index].id} clicado'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
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

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
}
