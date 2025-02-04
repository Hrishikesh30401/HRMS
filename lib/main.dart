import 'package:flutter/material.dart';
import 'package:hrms/core/di/injection.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';
import 'package:hrms/presentation/screens/home/home_screen.dart';

void main() {
  init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final getEmployeeUseCase = locator<GetEmployeeUseCase>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        getEmployeeUseCase: getEmployeeUseCase,
      ),
    );
  }
}
