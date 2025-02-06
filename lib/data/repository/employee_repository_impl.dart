import 'package:hrms/core/resources/data_state.dart';
import 'package:hrms/data/data_sources/remote/employee_remote_datasource.dart';
import 'package:hrms/data/models/employee_model.dart';
import 'package:hrms/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDatasource? employeeRemoteDatasource;

  EmployeeRepositoryImpl(this.employeeRemoteDatasource);

  @override
  Future<DataState<List<EmployeeModel>>> getEmployeeDetails() async {
    return employeeRemoteDatasource!.getEmployeeDetails();
  }
}
