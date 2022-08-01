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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'To-Do App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Todo {
  String? title;
  String? description;
}

class _MyHomePageState extends State<MyHomePage> {
  final _textDescriptionController = TextEditingController();
  final _textTitleController = TextEditingController();
  final List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: TextField(
            controller: _textTitleController,
            decoration: InputDecoration(
              hintText: "Title",
              border: UnderlineInputBorder(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: TextField(
            controller: _textDescriptionController,
            decoration: InputDecoration(
              hintText: "Description",
              border: UnderlineInputBorder(),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      todoList[index].title ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      todoList[index].description ?? 'empty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[400]),
                    ),
                  );
                }))
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todos = Todo();
          todos.title = _textTitleController.text;
          todos.description = _textDescriptionController.text;
          setState(() {
            todoList.add(todos);
          });
        },
        tooltip: 'Add To-Do List',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
