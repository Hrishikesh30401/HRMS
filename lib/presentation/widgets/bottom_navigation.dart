import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
