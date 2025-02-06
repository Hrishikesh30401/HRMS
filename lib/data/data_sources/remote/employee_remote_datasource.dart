import 'package:dio/dio.dart';
import 'package:hrms/core/network/dio_client.dart';
import 'package:hrms/core/resources/data_state.dart';
import 'package:hrms/data/models/employee_model.dart';

abstract class EmployeeRemoteDatasource {
  Future<DataState<List<EmployeeModel>>> getEmployeeDetails();
}

class EmployeeRemoteDatasourceImpl implements EmployeeRemoteDatasource {
  final DioClient _dioClient;

  EmployeeRemoteDatasourceImpl(this._dioClient);

  @override
  Future<DataState<List<EmployeeModel>>> getEmployeeDetails() async {
    try {
      final response = await _dioClient.dio.get('employees.json');

      if (response.data != null) {
        final employees = (response.data as List).map((data) {
          return EmployeeModel.fromJson(data);
        }).toList();
        return DataSuccess(employees);
      }

      return DataSuccess([]);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
