
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';
import 'package:task_mvvm_objectbox_getit/app/data/repositories/task_repository.dart';

import '../services/local_service_db/local_task_service_db.dart' show LocalTaskServiceDB;

class LocalTaskRepository implements TaskRepository {
  LocalTaskRepository({required LocalTaskServiceDB localTaskServiceDB})
      : _localTaskServiceDB = localTaskServiceDB;

  final LocalTaskServiceDB _localTaskServiceDB;
  @override
  Future<List<TaskModel>> getAllTasks() async {
    return Future.value(_localTaskServiceDB.getAllTasks());
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    return Future.value(_localTaskServiceDB.getTaskById(id));
  }

  @override
  Future<int> createTask(String title, String description) async {
    final task = TaskModel(title, description);
    final taskId = await _localTaskServiceDB.createTask(task.title, task.description);
    return taskId;
  }

  @override
  Future<int> updateTask(TaskModel task) async {
    final existingTask = await getTaskById(task.id);
    if (existingTask == null) return -1;
    final taskId = _localTaskServiceDB.updateTask(task);
    return taskId;
  }

  @override
  Future<bool> deleteTask(int id) async {
    final existingTask = await getTaskById(id);
    if (existingTask == null) return false;
    _localTaskServiceDB.taskBox.remove(id);
    return true;
  }
} 