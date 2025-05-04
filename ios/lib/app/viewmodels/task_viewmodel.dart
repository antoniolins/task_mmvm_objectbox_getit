import 'package:flutter/foundation.dart';
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';
import '../data/repositories/task_repository.dart';


class TaskViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository;
  List<TaskModel> _tasks = [];

  TaskViewModel(this._taskRepository) {
    loadTasks();
  }

  List<TaskModel> get tasks => _tasks;

  Future<List<TaskModel>> loadTasks() async {
    _tasks = await _taskRepository.getAllTasks();
    notifyListeners();
    return _tasks;
  }

  Future<void> addTask(String title, String description) async {
    await _taskRepository.createTask(title, description);
    await loadTasks();
   // loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await _taskRepository.updateTask(task);
    await loadTasks();
  }

  Future<void> toggleTaskStatus(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    await _taskRepository.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(TaskModel task) async {
    await _taskRepository.deleteTask(task.id);
    await loadTasks();
  }
} 