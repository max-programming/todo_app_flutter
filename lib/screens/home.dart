// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/settings.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = Provider.of<TodoProvider>(context).todos;
    final _todoController = TextEditingController();

    void addTodo(String text) {
      if (text.trim() == '') {
        Fluttertoast.showToast(
          msg: "Please enter some text",
          toastLength: Toast.LENGTH_SHORT,
          webShowClose: true,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: tdRed,
          textColor: Colors.white,
          fontSize: 16,
        );
        return;
      }
      Provider.of<TodoProvider>(context, listen: false).addTodo(text);
    }

    void deleteTodo(Todo todo) {
      Provider.of<TodoProvider>(context, listen: false).deleteTodo(todo);
    }

    void markTodo(Todo todo) {
      Provider.of<TodoProvider>(context, listen: false).markTodo(todo);
    }

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBGColor,
        title: Text('Todo App'),
        actions: [
          PopupMenuButton(
            onSelected: (result) {
              if (result == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 0,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              )
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (Todo todo in todos)
                        TodoItem(
                          todo: todo,
                          onTodoChanged: () => markTodo(todo),
                          onDeleteChanged: () => deleteTodo(todo),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      cursorColor: tdBlue,
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new todo item',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => addTodo(_todoController.text),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () => addTodo(_todoController.text),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                    child: Icon(Icons.add),
                    // child: Text(
                    //   '+',
                    //   style: TextStyle(fontSize: 40),
                    // ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
