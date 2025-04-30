import 'package:flutter/material.dart';
import 'views/task_list_page.dart';
import 'core/service_locator.dart';
import 'viewmodels/task_viewmodel.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListPage(viewModel: getIt<TaskViewModel>()),
    );
  }
} 