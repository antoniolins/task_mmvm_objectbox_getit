import 'package:flutter/material.dart';
import 'package:task_mvvm_objectbox_getit/app/models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';

class EditTaskDialog extends StatelessWidget {
  const EditTaskDialog({
    super.key,
    required this.viewModel,
    required this.task,
  });

  final TaskViewModel viewModel;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);

    return AlertDialog(
      title: const Text('Edit Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (titleController.text.isNotEmpty) {
              task.title = titleController.text;
              task.description = descriptionController.text;
              viewModel.updateTask(task);
            }
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
} 