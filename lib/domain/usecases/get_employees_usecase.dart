import 'package:hrms/core/resources/data_state.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/repository/employee_repository.dart';

class GetEmployeesUsecase {
  final EmployeeRepository repository;

  GetEmployeesUsecase(this.repository);

  Future<DataState<List<EmployeeEntity>>> call() {
    return repository.getEmployeeDetails();
  }
}
