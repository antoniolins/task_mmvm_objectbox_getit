import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  @Id()
  int id = 0;

  String title;
  String description;
  bool isCompleted;

  TaskModel(this.title, this.description, {this.isCompleted = false});
} 