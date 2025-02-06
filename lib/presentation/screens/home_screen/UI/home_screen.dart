import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/presentation/screens/profile_screen/UI/profile_screen.dart';
import 'package:hrms/presentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:imagebutton/imagebutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(FirebaseGetEmployeesEvent());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: ImageButton(
                    width: 50,
                    height: 45,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => ProfileScreen(),
                        ),
                      );
                    },
                    pressedImage: Image(
                      width: 50,
                      image: AssetImage('assets/images/avatar.png'),
                    ),
                    unpressedImage: Image(
                      width: 50,
                      image: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
                Text('Home'),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
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
                return Card(
                  child: ListTile(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 40,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.widgets_rounded,
              size: 40,
              color: Colors.grey,
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              size: 50,
              color: Colors.black87,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box,
              size: 40,
              color: Colors.grey,
            ),
            label: 'Approvals',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
              size: 40,
              color: Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
