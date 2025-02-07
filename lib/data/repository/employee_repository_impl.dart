import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hrms/core/resources/data_state.dart';
import 'package:hrms/core/resources/failures.dart';
import 'package:hrms/data/data_sources/remote/employee_remote_datasource.dart';
import 'package:hrms/data/models/employee_model.dart';
import 'package:hrms/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDatasource? employeeRemoteDatasource;

  EmployeeRepositoryImpl(this.employeeRemoteDatasource);

  @override
  Future<Either<Failure, List<EmployeeModel>>> getEmployeeDetails() async {
    try {
      final DataState<List<EmployeeModel>> response =
          await employeeRemoteDatasource!.getEmployeeDetails();

      if (response is DataSuccess<List<EmployeeModel>>) {
        return Right(response.data!);
      } else if (response is DataFailed<List<EmployeeModel>>) {
        return Left(ServerFailure(response.error?.message ?? 'Unknown error'));
      } else {
        return Left(ServerFailure('Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
