import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:tugaspertemuan7/main.dart';
import 'package:tugaspertemuan7/todo.dart';
import 'package:tugaspertemuan7/db_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeData light = ThemeData.light().copyWith(primaryColor: Colors.blue);
  ThemeData dark = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeProvider({bool? isDarkMode}){
    _selectedTheme = isDarkMode! ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("isDarkTheme", false);
      print(prefs.getBool("isDarkTheme"));
      print("LIGHT MODE");
    } else {
      _selectedTheme = dark;
      prefs.setBool("isDarkTheme", true);
      print(prefs.getBool("isDarkTheme"));
      print("DARK MODE");
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllTodos();
  }
  

  void _getAllTodos() async {
    _todos = await _dbHelper.getTodos();
    notifyListeners();
  }

  Future<void> addTodos(Todo todo) async {
    await _dbHelper.insertTodo(todo);
    _getAllTodos();
  }

  Future<void> deleteTodos(int id) async {
    await _dbHelper.deleteTodo(id);
    _getAllTodos();
  }

  Future<void> updateTodos(Todo todo) async {
    await _dbHelper.updateTodo(todo);
    _getAllTodos();
  }
}
