import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/data/dictionary.dart';
import 'package:todo_app/data/models/lessons.dart';
import 'package:todo_app/widgets/custDrawer.dart';
import 'package:todo_app/widgets/cust_appbar.dart';
import 'package:todo_app/widgets/cust_bottom_navbar.dart';
import 'package:todo_app/screens/lessons_screen.dart';

import '../helpers/getDataFromJson.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  final List<LessonsItem> lessons = [];
  int _selectedIndex = 0;
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  final List<Widget> _widgetOptions = [
    //-- 1 Tab
    const LessonsScreen(),
    //-- 2 Tab
    const Text(
      Dictionary.willBeAddedLater,
      style: optionStyle,
    ),
    //-- 3 Tab
    const Text(
      Dictionary.willBeAddedLater,
      style: optionStyle,
    ),
    //-- 4 Tab
    const Text(
      Dictionary.willBeAddedLater,
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return lessons;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: CustBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
