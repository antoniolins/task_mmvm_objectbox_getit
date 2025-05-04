import 'package:get_it/get_it.dart';
import '../data/repositories/local_task_repository.dart';
import '../viewmodels/task_viewmodel.dart';
import '../data/services/local_service_db/local_task_service_db.dart';

final getIt = GetIt.instance;

void setupServiceLocator(LocalTaskServiceDB localTaskServiceDB) {
  // Register LocalTaskService
  getIt.registerSingleton<LocalTaskServiceDB>(localTaskServiceDB);
  
  // Register TaskRepository
  getIt.registerSingleton<LocalTaskRepository>(
    LocalTaskRepository(localTaskServiceDB: getIt<LocalTaskServiceDB>()),
  );
      
  // Register TaskViewModel
  getIt.registerFactory<TaskViewModel>(
    () => TaskViewModel(getIt<LocalTaskRepository>()),
  );
} 