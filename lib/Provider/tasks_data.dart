import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> Tasks = [
    Task(name: 'Task1'),
    Task(name: 'Task2'),
    Task(name: 'Task3'),
    Task(name: 'Task4'),
    Task(name: 'Task5'),
  ];
  void AddTask(String newTask) {
    Tasks.add(Task(name: newTask, isDone: false));
    notifyListeners();
  }

  void DeleteTask(Task task) {
    Tasks.remove(task);
    notifyListeners();
  }

  void Check(Task task) {
    task.isChange();
    notifyListeners();
  }
}
