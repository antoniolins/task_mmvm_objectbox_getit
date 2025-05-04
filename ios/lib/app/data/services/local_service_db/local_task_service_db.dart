import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:task_mvvm_objectbox_getit/app/data/services/local_service_db/objectbox.g.dart' show openStore;

 
import 'package:objectbox/objectbox.dart';
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart' show TaskModel;

class LocalTaskServiceDB {
  late final Store store;

  late final Box<TaskModel> taskBox;  

  LocalTaskServiceDB._create(this.store) {
    taskBox = Box<TaskModel>(store);
  }

  static Future<LocalTaskServiceDB> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "tasks-mdb"));
    return LocalTaskServiceDB._create(store);
  }

  Future<List<TaskModel>> getAllTasks() async {
    return Future.value(taskBox.getAll());
  }

  Future<TaskModel?> getTaskById(int id) async {
    return Future.value(taskBox.get(id));
  }

  Future<int> createTask(String title, String description) async {
    final task = TaskModel(title, description);
    final taskId = await taskBox.putAsync(task);
    return taskId;
  }

  Future<int> updateTask(TaskModel task) async {
    final existingTask = await getTaskById(task.id);
    if (existingTask == null) return -1;
    final taskId = taskBox.put(task);
    return taskId;
  }

  Future<bool> deleteTask(int id) async {
    final existingTask = await getTaskById(id);
    if (existingTask == null) return false;
    taskBox.remove(id);
    return true;
  }

  Future<void> dispose() async {
    store.close();
  }
} 