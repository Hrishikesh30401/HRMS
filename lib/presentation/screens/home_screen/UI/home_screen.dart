import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/presentation/screens/home_screen/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FirebaseGetEmployeesEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FirebaseEmployeesLoaded) {
            final employees = state.employees;

            if (employees.isEmpty) {
              return Center(
                child: Text('no employee found'),
              );
            }
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Row(
                    children: [
                      Text(employee.firstname ?? ''),
                      SizedBox(
                        width: 5,
                      ),
                      Text(employee.lastname ?? '')
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Employee ID: ${employee.id}'),
                      Text('Email Id: ${employee.email}'),
                      Text('Age: ${employee.age}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is HomeFailure) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
