import 'package:flutter/material.dart';
import 'package:todo_app/widgets/cust_appbar.dart';
import 'package:todo_app/widgets/cust_bottom_navbar.dart';
import 'package:todo_app/screens/lessons_screen.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<NavigationContainer> {
  int _selectedIndex = 0;
  String _title = 'Lessons';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    const LessonsScreen(),
    const Text(
      'Will be added later',
      style: optionStyle,
    ),
    const Text(
      'Will be added later',
      style: optionStyle,
    ),
    const Text(
      'Will be added later',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _title = "Lessons";
          break;
        case 1:
          _title = "Calendar";
          break;
        case 2:
          _title = "Wallet";
          break;
        case 3:
          _title = "Account";
          break;
        default:
          _title = "ToDo";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar(_title),
      endDrawer: const Drawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: custBottomNavbar(_selectedIndex, _onItemTapped),
    );
  }
}
