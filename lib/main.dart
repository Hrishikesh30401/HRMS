import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/injections.dart';
import 'package:hrms/presentation/screens/home_screen/UI/home_screen.dart';
import 'package:hrms/presentation/screens/home_screen/bloc/home_bloc.dart';

Future<void> main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => locator<HomeBloc>(),
        child: HomeScreen(),
      ),
    );
  }
}
