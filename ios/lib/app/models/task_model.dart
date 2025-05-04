import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {

  @Id()
  int id;
  String title;
  String description;
  bool isCompleted;

  TaskModel( 
    this.title,
    this.description,
    {this.id = 0,
    this.isCompleted = false,});
} 