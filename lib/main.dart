import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'app/data/objectbox.dart';
import 'app/core/service_locator.dart';

late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  
  // Setup GetIt service locator
  setupServiceLocator(objectbox);
  
  runApp(const AppWidget());
} 