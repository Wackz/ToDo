import 'package:hive_flutter/hive_flutter.dart';

class ToDODatabase {
  List todoList = [];
  final _box = Hive.box('todo');

  void loadData() {
    todoList = _box.get("TODO");
  }

  void updateData() {
    _box.put("TODO", todoList);
  }
}