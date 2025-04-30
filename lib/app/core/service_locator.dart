import 'package:get_it/get_it.dart';
import '../data/objectbox.dart';
import '../data/repositories/task_repository_impl.dart';
import '../viewmodels/task_viewmodel.dart';

final getIt = GetIt.instance;

void setupServiceLocator(ObjectBox objectBox) {
  // Register ObjectBox
  getIt.registerSingleton<ObjectBox>(objectBox);
  
  // Register TaskRepository
  getIt.registerSingleton<TaskRepositoryImpl>(
    TaskRepositoryImpl(getIt<ObjectBox>()),
  );
  
  // Register TaskViewModel
  getIt.registerFactory<TaskViewModel>(
    () => TaskViewModel(getIt<TaskRepositoryImpl>()),
  );
} 