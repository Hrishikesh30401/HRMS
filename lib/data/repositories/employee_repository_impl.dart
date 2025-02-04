import 'package:flutter/material.dart';
import 'package:hrms/core/resources/location/data_state.dart';
import 'package:hrms/data/models/employee_model.dart';
import 'package:hrms/data/remote/employee_remote_datasource.dart';
import 'package:hrms/domain/entities/employee_entity.dart';
import 'package:hrms/domain/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmplRemoteDataSource _employeeRemoteDataSource;

  EmployeeRepositoryImpl(this._employeeRemoteDataSource);

  @override
  Future<DataState<List<EmployeeEntity>>> getEmployees() async {
    try {
      var result = await _employeeRemoteDataSource.getEmployee();
      // Convert result to List<UserEntity> if needed
      return DataSuccess(result.map((user) => user.toEntity()).toList());
    } on FlutterError catch (error) {
      return DataFailed(FlutterError(error.message));
    } catch (error) {
      return DataFailed(FlutterError("Unexpected error: $error"));
    }
  }
}
