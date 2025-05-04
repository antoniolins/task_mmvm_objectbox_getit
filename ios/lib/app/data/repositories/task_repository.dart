
 
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel?> getTaskById(int id);
  Future<int> createTask(String title, String description);
  Future<int> updateTask(TaskModel task);
  Future<bool> deleteTask(int id);
} 