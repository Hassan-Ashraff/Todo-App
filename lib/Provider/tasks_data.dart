import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> Tasks = [];

  TasksData() {
    loadTasks();
  }

  void AddTask(String newTask) async {
    Tasks.add(Task(name: newTask));
    await _saveTasks();
    notifyListeners();
  }

  void DeleteTask(Task task) async {
    Tasks.remove(task);
    await _saveTasks();
    notifyListeners();
  }

  void Check(Task task) async {
    task.isChange();
    await _saveTasks();
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksList = Tasks.map((task) => jsonEncode(task.toMap())).toList();
    await prefs.setStringList('tasks', tasksList);
  }

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasksJsonList = prefs.getStringList('tasks');
    if (tasksJsonList != null) {
      Tasks = tasksJsonList.map((taskJson) => Task.fromMap(jsonDecode(taskJson))).toList();
      notifyListeners();
    }
  }
}
