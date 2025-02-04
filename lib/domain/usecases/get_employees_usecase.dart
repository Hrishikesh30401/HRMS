import 'package:hrms/core/resources/location/data_state.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/repositories/employee_repository.dart';
import 'package:hrms/domain/usecases/employeedata_usecase.dart';

class GetEmployeeUseCase implements UseCase<DataState<List<EmployeeEntity>>, void> {
  final EmployeeRepository _employeeRepository;
  GetEmployeeUseCase(this._employeeRepository);

  @override
  Future<DataState<List<EmployeeEntity>>> call({void params}) {
    return _employeeRepository.getEmployees();
  }
}
