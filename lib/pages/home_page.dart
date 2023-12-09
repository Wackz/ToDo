import 'package:coba/components/dialog_box.dart';
import 'package:coba/components/todo_tile.dart';
import 'package:coba/database/todo_database.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  ToDODatabase db = ToDODatabase();

  void onCompleteChange(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_textController.text, false]);
      db.updateData();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateData();
    });
  }

  void onFloatingButtonPresed() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _textController,
              onSave: saveTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 243, 149),
      appBar: AppBar(
        title: const Text(
          "TO DO",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 214, 90),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskComplete: db.todoList[index][1],
            onChange: (p0) {
              onCompleteChange(index);
            },
            onDelete: (p0) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonPresed,
        backgroundColor: const Color.fromARGB(255, 255, 214, 90),
        child: const Icon(Icons.add),
      ),
    );
  }
}
