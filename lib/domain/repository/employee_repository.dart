import 'package:dartz/dartz.dart';
import 'package:hrms/core/resources/failures.dart';
import 'package:hrms/domain/entities/employee_entity.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeEntity>>> getEmployeeDetails();
}
