import 'package:hrms/data/models/employee_model.dart';
import 'package:dio/dio.dart';

abstract class EmplRemoteDataSource {
  Future<List<EmployeeModel>> getEmployee();
}

class UsersRemoteDataSourceImpl extends EmplRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  @override
  Future<List<EmployeeModel>> getEmployee() async {
    try {
      var response = await _dio.get("xxx/getEmployee");
      if (response.statusCode == 200) {
        var data = response.data;
        List<EmployeeModel> result = (data['users'] as List)
            .map((i) => EmployeeModel.fromJson(i))
            .toList();
        return result;
      } else {
        throw Exception(
            "Failed to fetch users. Status: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching users: $error");
    }
  }
}
