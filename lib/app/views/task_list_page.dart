import 'package:flutter/material.dart';
import 'package:task_mvvm_objectbox_getit/app/views/add_task_widget.dart';
import 'package:task_mvvm_objectbox_getit/app/views/edit_task_widget.dart';

import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key, required this.viewModel});
  final TaskViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return ListView.builder(
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) => viewModel.toggleTaskStatus(task),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditTaskDialog(context, task),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => viewModel.deleteTask(task),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTaskDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AddTaskDialog(viewModel: viewModel),
    );
  }

  Future<void> _showEditTaskDialog(BuildContext context, TaskModel task) async {
    await showDialog(
      context: context,
      builder: (context) => EditTaskDialog(viewModel: viewModel, task: task),
    );
  }
}
