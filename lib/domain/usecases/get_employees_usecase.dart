import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hrms/core/resources/failures.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/repository/employee_repository.dart';

class GetEmployeesUsecase {
  final EmployeeRepository repository;

  GetEmployeesUsecase(this.repository);

  Future<Either<Failure, List<EmployeeEntity>>> call() async {
    try {
      final result = await repository.getEmployeeDetails();
      return result;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
