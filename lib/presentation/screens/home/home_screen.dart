import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/domain/usecases/get_employees_usecase.dart';
import 'package:hrms/presentation/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.getEmployeeUseCase});

  final GetEmployeeUseCase getEmployeeUseCase;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getEmployeeUseCase)..add(HomeLoadEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('HRMS'),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeLoadedState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID: ${state.employeeEntity.id}'),
                    Text('First Name: ${state.employeeEntity.firstName}'),
                    Text('Last Name: ${state.employeeEntity.lastName}'),
                    Text('Age: ${state.employeeEntity.age}'),
                  ],
                );
              }
              if (state is HomeErrorState) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return SizedBox();
            },
          )),
    );
  }
}
