import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';

const todoListKey = 'todo_list';

class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    final List<Todo> todos = jsonDecoded.map((e) => Todo.fromJson(e)).toList();
    debugPrint('todos: $todos');
    final orderedTodos = todos.reversed.toList();
    return orderedTodos;
  }

  void saveTodoList(List<Todo> todos) {
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
    debugPrint('jsonString: $jsonString');
  }
}
