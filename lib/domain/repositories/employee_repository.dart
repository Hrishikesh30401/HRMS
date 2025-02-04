import 'package:hrms/core/resources/location/data_state.dart';
import 'package:hrms/domain/entities/employee_entity.dart';

abstract class EmployeeRepository {
  Future<DataState<List<EmployeeEntity>>> getEmployees();
}
