import 'package:flutter/material.dart';
import 'app/data/services/local_service_db/local_task_service_db.dart';
import 'app/app_widget.dart';
import 'app/core/service_locator.dart';

late LocalTaskServiceDB localTaskServiceDB;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localTaskServiceDB = await LocalTaskServiceDB.create();
  // Setup GetIt service locator
  setupServiceLocator(localTaskServiceDB);
   
  runApp(const AppWidget());
} 