import 'package:get_it/get_it.dart';
import 'package:to_do/data/database_service.dart';
import 'package:to_do/data/todo_repository_impl.dart';
import 'package:to_do/domain/model/todo_repository.dart';
import 'package:to_do/presentation/bloc/todo_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<ToDORepository>(ToDoRepositoryImpl(getIt()));
  getIt.registerFactory(() => ToDoListCubit(repository: getIt()));
}
