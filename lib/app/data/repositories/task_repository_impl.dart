import 'package:task_mvvm_objectbox_getit/app/data/services/objectbox/objectbox.dart';
import 'package:task_mvvm_objectbox_getit/app/data/repositories/task_repository.dart';
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final ObjectBox _objectBox;

  TaskRepositoryImpl(this._objectBox);

  @override
  Future<List<TaskModel>> getAllTasks() async {
    return Future.value(_objectBox.taskBox.getAll());
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    return Future.value(_objectBox.taskBox.get(id));
  }

  @override
  Future<int> createTask(String title, String description) async {
    final task = TaskModel(title, description);
    final taskId = await _objectBox.taskBox.putAsync(task);
    return taskId;
  }

  @override
  Future<int> updateTask(TaskModel task) async {
    final existingTask = await getTaskById(task.id);
    if (existingTask == null) return -1;
    final taskId = _objectBox.taskBox.put(task);
    return taskId;
  }

  @override
  Future<bool> deleteTask(int id) async {
    final existingTask = await getTaskById(id);
    if (existingTask == null) return false;
    
    _objectBox.taskBox.remove(id);
    return true;
  }
} 