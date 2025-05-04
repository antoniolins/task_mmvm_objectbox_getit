
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';

import 'task_repository.dart';
import '../services/local_service_db/local_task_service_db.dart';


class LocalTaskRepository implements TaskRepository {

  LocalTaskRepository({required LocalTaskServiceDB localTaskServiceDB})
      : _localTaskServiceDB = localTaskServiceDB;

  final LocalTaskServiceDB _localTaskServiceDB;

  @override
  Future<int> createTask(String title, String description) {
    return _localTaskServiceDB.createTask(title, description);
  }

  @override
  Future<bool> deleteTask(int id) {
    return _localTaskServiceDB.deleteTask(id);
  }

  @override
  Future<List<TaskModel>> getAllTasks() {
    return _localTaskServiceDB.getAllTasks();
  }

  @override
  Future<TaskModel?> getTaskById(int id) {
    return _localTaskServiceDB.getTaskById(id);
  }

  @override
  Future<int> updateTask(TaskModel task) {
    return _localTaskServiceDB.updateTask(task);
  }

}