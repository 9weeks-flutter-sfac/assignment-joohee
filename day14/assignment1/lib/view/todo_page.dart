import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:assignment1/widget/filter_bottom_sheet.dart';
import 'package:assignment1/widget/todo_card.dart';
import 'package:dio/dio.dart';
import 'package:assignment1/model/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  initState() {
    super.initState();
    myfuture = readData();
  }

  Future<List<Todo>>? myfuture;

  Future<List<Todo>> readData() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    Dio dio = Dio();
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var tmp = List<Map<String, dynamic>>.from(res.data);
      setState(() {});
      return tmp.map((e) => Todo.fromMap(e)).toList();
    }
    return [];
  }

  void refreshData() {
    setState(() {
      myfuture = readData(); // Create a new Future
    });
  }

  TodoFilter _todoFilter = TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRect(
          //뒤에 블러 처리
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
        ),
        title: Text('Todo App'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FilterBottomSheet(
                      filter: _todoFilter,
                      onApply: (value) {
                        setState(() {
                          _todoFilter = value;
                        });
                      });
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              refreshData(); //refresh not working
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: myfuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Todo> todos = snapshot.data!;
            // if (_todoFilter == TodoFilter.completed) {
            //   todos = todos.where((e) => e.completed == true).toList();
            // } else if (_todoFilter == TodoFilter.incompleted) {
            //   todos = todos.where((e) => e.completed == false).toList();
            // }
            todos = filterMaker(todos);
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(todo: todos[index]);
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  List<Todo> filterMaker(List<Todo> value) {
    switch (_todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((e) => e.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((e) => e.completed == false).toList();
    }
  }
}
