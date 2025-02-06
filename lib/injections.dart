import 'package:get_it/get_it.dart';
import 'package:hrms/core/network/dio_client.dart';
import 'package:hrms/data/data_sources/remote/employee_remote_datasource.dart';
import 'package:hrms/data/repository/employee_repository_impl.dart';
import 'package:hrms/domain/repository/employee_repository.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';
import 'package:hrms/presentation/screens/home_screen/bloc/home_bloc.dart';

final locator = GetIt.asNewInstance();

Future<void> init() async {
  locator.registerFactory(() => HomeBloc(locator()));

  locator.registerLazySingleton(() => GetEmployeesUsecase(locator()));

  locator.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(locator()));

  locator.registerLazySingleton<EmployeeRemoteDatasource>(
      () => EmployeeRemoteDatasourceImpl(locator()));

  locator.registerLazySingleton(() => DioClient());
}
