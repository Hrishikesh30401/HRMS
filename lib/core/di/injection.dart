import 'package:get_it/get_it.dart';
import 'package:hrms/data/remote/employee_remote_datasource.dart';
import 'package:hrms/data/repositories/employee_repository_impl.dart';
import 'package:hrms/domain/repositories/employee_repository.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';
import 'package:hrms/presentation/screens/home/bloc/home_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => HomeBloc(locator()));

  locator.registerLazySingleton(() => GetEmployeeUseCase(locator()));

  locator.registerLazySingleton<EmplRemoteDataSource>(
      () => UsersRemoteDataSourceImpl());
      
  locator.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(locator()),
  );
}
