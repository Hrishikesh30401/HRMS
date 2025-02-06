import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://hrms-app-53685-default-rtdb.firebaseio.com/',
          headers: {'Content-Type': 'application/json'},
        ));
}
