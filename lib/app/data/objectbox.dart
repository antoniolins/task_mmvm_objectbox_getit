import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:task_mvvm_objectbox_getit/app/data/objectbox.g.dart';
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';

class ObjectBox {
  late final Store store;
  late final Box<TaskModel> taskBox;

  ObjectBox._create(this.store) {
    taskBox = Box<TaskModel>(store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "tasks-mdb"));
    return ObjectBox._create(store);
  }
} 