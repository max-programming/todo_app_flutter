import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String text) {
    todos.add(
      Todo(
        id: Random().nextInt(100).toString(),
        todoText: text,
      ),
    );
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void markTodo(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
  }
}
